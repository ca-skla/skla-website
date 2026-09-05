#!/usr/bin/env bash
# check-site.sh <draft|refresh|bootstrap> — diff allowlist audit + site-wide integrity. Exit 1 on any FAIL.
set -u
LANE="${1:-draft}"
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT" || exit 2
FAILS=0
fail() { echo "FAIL  $1"; FAILS=$((FAILS+1)); }
ok()   { echo "ok    $1"; }
echo "== check-site: lane=$LANE"

BR=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "?")
[ "$BR" != "main" ] && ok "on branch $BR" || fail "on main — routines must never work on main"

# diff allowlist (only when origin/main is known)
if git rev-parse --verify -q origin/main >/dev/null; then
  CHANGED=$(git diff --name-only origin/main...HEAD 2>/dev/null; git diff --name-only; git ls-files --others --exclude-standard)
  for f in $(printf '%s\n' "$CHANGED" | sort -u); do
    case "$LANE" in
      draft)
        case "$f" in
          insights-*.html|insights.html|sitemap.xml|_pipeline/BACKLOG.md|_pipeline/BRIEFS.md|_pipeline/FACTS.md|_pipeline/BULLETIN.md|_pipeline/reviews/*) ;;
          *) fail "outside draft-lane allowlist: $f";;
        esac;;
      refresh)
        case "$f" in
          insights-*.html|insights.html|sitemap.xml|_pipeline/FACTS.md|_pipeline/BULLETIN.md|_pipeline/BACKLOG.md|_pipeline/reviews/*) ;;
          *) fail "outside refresh-lane allowlist: $f";;
        esac;;
      bootstrap) ;;
    esac
    case "$f" in insights-article-template.html) [ "$LANE" != "bootstrap" ] && fail "template must not be edited by a routine";; esac
  done
  ok "diff audited ($(printf '%s\n' "$CHANGED" | sort -u | grep -c .) file(s))"
fi

# every html ends with </html>
BAD=0
for f in *.html; do tail -c 12 "$f" | grep -q '</html>' || { fail "$f does not end with </html>"; BAD=1; }; done
[ "$BAD" -eq 0 ] && ok "all $(ls *.html | wc -l) html files end with </html>"

# sitemap: every loc resolves, no duplicates
DUP=$(grep -o '<loc>[^<]*</loc>' sitemap.xml | sort | uniq -d)
[ -z "$DUP" ] && ok "sitemap has no duplicate <loc>" || fail "duplicate sitemap entries: $DUP"
for u in $(grep -o '<loc>[^<]*</loc>' sitemap.xml | sed 's/<loc>//;s/<\/loc>//'); do
  p="${u#https://www.skla.in/}"; [ "$p" = "$u" ] && { fail "sitemap loc not on www.skla.in: $u"; continue; }
  [ -z "$p" ] && p="index.html"
  [ -e "$p" ] || fail "sitemap loc has no file: $p"
done
perl -0777 -ne 'exit(( /<urlset[^>]*>/ && /<\/urlset>\s*$/ ) ? 0 : 1)' sitemap.xml && ok "sitemap envelope well-formed" || fail "sitemap.xml envelope malformed"

# every article listed on insights.html exists and vice versa
for f in $(grep -o 'href="insights-[^"]*\.html"' insights.html | sed 's/href="//;s/"$//' | sort -u); do [ -e "$f" ] || fail "insights.html links to missing $f"; done
for f in insights-*.html; do
  [ "$f" = "insights-article-template.html" ] && continue
  grep -q "href=\"$f\"" insights.html || fail "$f has no card on insights.html"
  grep -q "<loc>https://www.skla.in/$f</loc>" sitemap.xml || fail "$f missing from sitemap.xml"
done
ok "index/sitemap/article set consistent"

# no pipeline docs leaked into served paths other than _pipeline/
[ -f netlify.toml ] && grep -q '/_pipeline/\*' netlify.toml && ok "netlify shadows /_pipeline/" || fail "netlify.toml lacks the /_pipeline/* 404 rule"

echo "RESULT: $FAILS fail(s) — lane $LANE"
[ "$FAILS" -eq 0 ]
