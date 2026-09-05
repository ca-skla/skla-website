#!/usr/bin/env bash
# check-article.sh <slug|file> — structural, compliance and facts lint for one insight article.
# Exit 1 on any FAIL. Requires bash, grep (PCRE), perl (core JSON::PP). Run from the repo root.
set -u
ARG="${1:-}"
[ -z "$ARG" ] && { echo "usage: $0 <slug|insights-<slug>.html>"; exit 2; }
case "$ARG" in
  insights-*.html) FILE="$ARG" ;;
  insights-*)      FILE="$ARG.html" ;;
  *)               FILE="insights-$ARG.html" ;;
esac
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT" || exit 2
PIPE="_pipeline"
FAILS=0; WARNS=0
fail() { echo "FAIL  $1"; FAILS=$((FAILS+1)); }
warn() { echo "WARN  $1"; WARNS=$((WARNS+1)); }
ok()   { echo "ok    $1"; }

[ -f "$FILE" ] || { fail "$FILE not found"; echo "RESULT: $FAILS fail(s)"; exit 1; }
if [ "$FILE" = "insights-article-template.html" ]; then
  echo "== check-article: $FILE is the template (worked example with guide comments) — not a live article; nothing to lint."
  echo "RESULT: 0 fail(s), 0 warning(s) — $FILE"; exit 0
fi
echo "== check-article: $FILE"
URL="https://www.skla.in/$FILE"
BODY="$(perl -0777 -ne 'print $1 if /<body[^>]*>(.*)<\/body>/s' "$FILE")"
ARTICLE="$(printf '%s' "$BODY" | perl -0777 -pe 's/<header class="site-header".*?<\/header>//s; s/<footer.*?<\/footer>//s')"

# --- 1. envelope -----------------------------------------------------------
head -c 15 "$FILE" | grep -q '<!DOCTYPE html>' && ok "starts with <!DOCTYPE html>" || fail "must start with <!DOCTYPE html>"
tail -c 12 "$FILE" | grep -q '</html>' && ok "ends with </html>" || fail "must end with </html> (OneDrive truncation guard)"
if [ "$FILE" != "insights-article-template.html" ]; then
  grep -q '<!--' "$FILE" && fail "HTML comments present (live articles carry none)" || ok "no HTML comments"
fi
grep -q '{{' "$FILE" && fail "unreplaced {{placeholder}}" || ok "no placeholders"
grep -qi 'coming soon' "$FILE" && fail "'Coming soon' text present" || ok "no 'Coming soon'"
grep -q 'VERIFY' "$FILE" && fail "VERIFY marker left in file (move to _pipeline/FACTS.md)" || ok "no VERIFY markers"

# --- 2. structure ----------------------------------------------------------
H1=$(grep -c '<h1' "$FILE"); [ "$H1" -eq 1 ] && ok "exactly one <h1>" || fail "expected 1 <h1>, found $H1"
SVC=$(printf '%s' "$ARTICLE" | grep -o 'services\.html#[a-z]*' | sort -u); SVCN=$(printf '%s' "$ARTICLE" | grep -o 'services\.html#[a-z]*' | wc -l)
[ "$SVCN" -eq 1 ] && ok "exactly one services.html# link ($SVC)" || fail "expected exactly 1 services.html#… link in the article body, found $SVCN"
case "$SVC" in services.html#audit|services.html#tax|services.html#fema|services.html#nri|services.html#accounting|services.html#advisory|"") ;; *) fail "service anchor $SVC not in {audit,tax,fema,nri,accounting,advisory}";; esac
printf '%s' "$ARTICLE" | grep -q 'class="article-lead"' && ok "lead paragraph" || fail "missing p.article-lead"
H2=$(printf '%s' "$ARTICLE" | grep -c '<h2'); [ "$H2" -ge 3 ] && ok "$H2 h2 sections" || warn "only $H2 <h2> sections (expected ≥ 3 incl. FAQ/References)"
printf '%s' "$ARTICLE" | grep -q 'class="callout"' && ok "callout present" || warn "no div.callout"
printf '%s' "$ARTICLE" | grep -q '<blockquote' && ok "blockquote present" || warn "no practitioner blockquote"
printf '%s' "$ARTICLE" | grep -q 'class="article-byline"' && ok "byline block" || fail "missing .article-byline"
FAQN=$(printf '%s' "$ARTICLE" | grep -c 'class="faq-q"'); [ "$FAQN" -ge 3 ] && [ "$FAQN" -le 6 ] && ok "$FAQN FAQ items" || fail "FAQ items = $FAQN (expected 3–5)"
QN=$(grep -c '"@type": "Question"' "$FILE"); [ "$QN" -eq "$FAQN" ] && ok "FAQ parity with FAQPage schema" || fail "FAQ parity: $FAQN visible vs $QN in FAQPage JSON-LD"
RELN=$(perl -0777 -ne 'if (/<div class="related-grid[^"]*">(.*?)<\/div>\s*<\/div>\s*<\/section>/s) { my $g=$1; my $n=()=$g=~/class="post-card/g; print $n } else { print 0 }' "$FILE")
[ "$RELN" -eq 3 ] && ok "related grid has 3 cards" || fail "related grid has $RELN cards (expected 3)"
grep -q 'This article is provided for general professional information and updation only. It does not constitute professional advice or an offer or solicitation of any work. Readers should obtain appropriate professional advice on their specific facts before acting. Figures, forms and dates are subject to change in law.' "$FILE" && ok "disclaimer verbatim" || fail "disclaimer missing or altered"

# --- 3. head / schema / URLs ----------------------------------------------
CANON=$(grep -o 'rel="canonical" href="[^"]*"' "$FILE" | sed 's/.*href="//;s/"$//')
OGURL=$(grep -o 'property="og:url" content="[^"]*"' "$FILE" | sed 's/.*content="//;s/"$//')
MEOP=$(grep -o '"mainEntityOfPage": "[^"]*"' "$FILE" | head -1 | sed 's/.*: "//;s/"$//')
BC3=$(grep -o '"position": 3, "name": "[^"]*", "item": "[^"]*"' "$FILE" | sed 's/.*"item": "//;s/"$//')
urlcheck() { [ "$2" = "$URL" ] && ok "$1 = $URL" || fail "$1 is '$2' (expected $URL)"; }
urlcheck canonical "$CANON"; urlcheck og:url "$OGURL"; urlcheck mainEntityOfPage "$MEOP"; urlcheck breadcrumb-3 "$BC3"
TITLE=$(perl -0777 -ne 'print $1 if /<title>(.*?)<\/title>/s' "$FILE"); TL=${#TITLE}
[ "$TL" -le 60 ] && ok "<title> length $TL" || warn "<title> length $TL (> 60)"
DESC=$(grep -o 'name="description" content="[^"]*"' "$FILE" | sed 's/.*content="//;s/"$//'); DL=${#DESC}
[ "$DL" -ge 120 ] && [ "$DL" -le 165 ] && ok "meta description length $DL" || warn "meta description length $DL (target 150–160)"
# JSON-LD parse via perl core JSON::PP
perl -0777 -MJSON::PP -ne 'my $i=0; my $bad=0; while (/<script type="application\/ld\+json">(.*?)<\/script>/sg) { $i++; my $j=$1; eval { JSON::PP->new->decode($j) }; if ($@) { $bad++; print "FAIL  JSON-LD block $i does not parse: ".substr($@,0,80)."\n" } } print "ok    $i JSON-LD block(s) parse\n" unless $bad; exit($bad?1:0)' "$FILE" || FAILS=$((FAILS+1))
grep -q '"@type": "Article"' "$FILE" && ok "Article schema" || fail "missing Article schema"
grep -q '"@type": "FAQPage"' "$FILE" && ok "FAQPage schema" || fail "missing FAQPage schema"
grep -q '"@type": "BreadcrumbList"' "$FILE" && ok "BreadcrumbList schema" || fail "missing BreadcrumbList schema"
DP=$(grep -o '"datePublished": "[^"]*"' "$FILE" | sed 's/.*: "//;s/"$//'); DM=$(grep -o '"dateModified": "[^"]*"' "$FILE" | sed 's/.*: "//;s/"$//')
for d in "$DP" "$DM"; do echo "$d" | grep -qE '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' && ok "ISO date $d" || fail "date '$d' is not YYYY-MM-DD"; done
grep -qE 'Updated (January|February|March|April|May|June|July|August|September|October|November|December) [0-9]{4}' "$FILE" && ok "'Updated <Month YYYY>' present" || fail "missing 'Updated <Month YYYY>' in article-meta"

# --- 4. reviewer -----------------------------------------------------------
R1=$(grep -o '<strong>Reviewed by</strong> [^<]*' "$FILE" | sed 's/.*<\/strong> //' | sed 's/ *$//')
R2=$(grep -o '<strong>Reviewed by [^<]*</strong>' "$FILE" | sed 's/<strong>Reviewed by //;s/<\/strong>//' | sed 's/ *$//')
[ -n "$R1" ] && [ "$R1" = "$R2" ] && ok "reviewer consistent: $R1" || fail "reviewer mismatch: hero='$R1' byline='$R2'"
case "$R1" in "CA. Sunil Kumar Lahoti"|"CA. Shradha Lahoti") ;; *) fail "reviewer '$R1' not an allowed partner byline";; esac
grep -qi 'Sunny' "$FILE" && fail "'Sunny' appears in the article (not a partner / not a CA)" || true

# --- 5. links resolve ----------------------------------------------------
MISSING=0
for h in $(grep -o 'href="[^"#:]*"' "$FILE" | sed 's/href="//;s/"$//' | sed 's/[?#].*//' | sort -u); do
  [ -z "$h" ] && continue
  [ -e "$h" ] || { fail "href target missing: $h"; MISSING=$((MISSING+1)); }
done
[ "$MISSING" -eq 0 ] && ok "all internal hrefs resolve"
NAVN=$(perl -0777 -ne 'if (/<ul class="nav-links">(.*?)<\/ul>/s) { my $n=()=$1=~/<li>/g; print $n } else { print 0 }' "$FILE")
[ "$NAVN" -eq 8 ] && ok "nav has 8 links" || fail "nav has $NAVN links (expected 8)"
grep -q 'href="insights.html" class="active"' "$FILE" && ok "Insights nav link active" || fail "Insights nav link must carry class=\"active\""
grep -q 'wa.me/919885580871' "$FILE" && ok "footer WhatsApp link" || fail "footer WhatsApp link missing"
grep -q 'no-solicitation basis' "$FILE" && ok "footer ICAI line" || fail "footer ICAI no-solicitation line missing"

# --- 6. compliance regexes (COMPLIANCE.md §B) -----------------------------
REGEXES=$(perl -0777 -ne 'print $1 if /## B\..*?```\n(.*?)```/s' "$PIPE/COMPLIANCE.md")
HIT=0
while IFS= read -r rx; do
  [ -z "$rx" ] && continue
  m=$(printf '%s' "$ARTICLE" | grep -inoP "$rx" | head -3)
  if [ -n "$m" ]; then fail "compliance regex hit /$rx/: $(echo "$m" | tr '\n' ' ')"; HIT=$((HIT+1)); fi
done <<EOF
$REGEXES
EOF
[ "$HIT" -eq 0 ] && ok "no compliance regex hits"
printf '%s' "$ARTICLE" | grep -qiP '\b(our client|client of ours|we saved|we helped [A-Z])' && fail "client identification wording" || ok "no client identification"

# --- 7. encoding ----------------------------------------------------------
NONASCII=$(printf '%s' "$BODY" | grep -v 'logo-img' | grep -nP '[^\x00-\x7F]' | head -3)
[ -z "$NONASCII" ] && ok "body is ASCII + entities" || fail "raw non-ASCII in body (use entities): $(echo "$NONASCII" | tr '\n' ' ' | cut -c1-160)"
if perl -0777 -ne 'my $bad=0; while (/<script type="application\/ld\+json">(.*?)<\/script>/sg) { $bad++ if $1 =~ /&(mdash|ndash|rsquo|amp|#8377);/ } exit($bad?1:0)' "$FILE"; then ok "no entities inside JSON-LD"; else
  if [ "$DM" \> "2026-09-01" ]; then fail "HTML entities inside JSON-LD (use raw UTF-8 there)"; else warn "HTML entities inside JSON-LD (legacy; fix on re-verification — JSON parsers do not decode them)"; fi
fi

# --- 8. sitemap / index -------------------------------------------------
if [ "$FILE" != "insights-article-template.html" ]; then
  grep -q "<loc>$URL</loc>" sitemap.xml && ok "sitemap lists the URL" || fail "sitemap.xml has no entry for $URL"
  grep -q "href=\"$FILE\"" insights.html && ok "insights.html links to the file" || fail "insights.html has no card linking to $FILE"
fi

# --- 9. facts register ---------------------------------------------------
if [ "$FILE" != "insights-article-template.html" ]; then
  # columns (awk -F'|'): $2 id · $13 status · $14 used_in
  for id in $(grep -o 'data-fact="F-[0-9]*"' "$FILE" | sed 's/data-fact="//;s/"$//' | sort -u); do
    grep -qE "^\| $id \|" "$PIPE/FACTS.md" || fail "data-fact $id has no row in FACTS.md"
    grep -E "^\| $id \|" "$PIPE/FACTS.md" | awk -F'|' -v f="$FILE" 'index($14, f) > 0 { found = 1 } END { exit found ? 0 : 1 }' || fail "FACTS.md row $id does not list $FILE in used_in"
  done
  # every CURRENT row whose used_in lists this file must have a marker in the file
  MISSM=$(grep -E '^\| F-[0-9]+ \|' "$PIPE/FACTS.md" | awk -F'|' -v f="$FILE" '{ s = $13; gsub(/ /, "", s); if (s == "current" && index($14, f) > 0) { id = $2; gsub(/ /, "", id); print id } }' | while read -r id; do grep -q "data-fact=\"$id\"" "$FILE" || echo "$id"; done)
  [ -z "$MISSM" ] && ok "facts markers consistent with FACTS.md" || fail "current FACTS rows without a data-fact marker in the file: $(echo "$MISSM" | tr '\n' ' ')"
  if grep -q 'class="article-refs"' "$FILE"; then ok "References block present"; else
    if [ "$DM" \> "2026-09-01" ]; then fail "References block missing (required for articles modified after 2026-09-01)"; else warn "References block missing (legacy article; add on re-verification)"; fi
  fi
fi

# --- 10. length / read time ----------------------------------------------
WORDS=$(printf '%s' "$ARTICLE" | perl -0777 -pe 's/<section class="article-refs">.*?<\/section>//s; s/<script.*?<\/script>//sg; s/<[^>]+>/ /g; s/&[a-z#0-9]+;/ /g' | wc -w)
CLAIM=$(grep -o '[0-9]* min read' "$FILE" | head -1 | grep -o '^[0-9]*')
EXP=$(( (WORDS + 80) / 160 )); [ "$EXP" -lt 4 ] && EXP=4
if [ -n "$CLAIM" ]; then
  DIFF=$(( CLAIM - EXP )); [ "$DIFF" -lt 0 ] && DIFF=$(( -DIFF ))
  [ "$DIFF" -le 2 ] && ok "read time $CLAIM min for ~$WORDS words" || warn "read time label $CLAIM min vs ~$WORDS words (expected ~$EXP min)"
else warn "no 'N min read' label"; fi
echo "RESULT: $FAILS fail(s), $WARNS warning(s) — $FILE"
[ "$FAILS" -eq 0 ]
