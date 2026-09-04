#!/usr/bin/env bash
# render-bulletin.sh — regenerate the "Latest updates" block in insights.html from _pipeline/BULLETIN.md.
# Inserts the whole section at <!-- BULLETIN:ANCHOR --> on first use; afterwards rewrites only the items
# between <!-- BULLETIN:START --> and <!-- BULLETIN:END -->. Shows the newest N rows (config bulletin_max_items).
set -u
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT" || exit 2
N=$(grep -E '^\s*bulletin_max_items:' _pipeline/config.yml | grep -o '[0-9]*' | head -1); N=${N:-6}
ITEMS=$(perl -ne '
  next unless /^\| *(\d{4}-\d{2}-\d{2}) *\| *(\w+) *\| *(yes|no) *\| *(.*?) *\| *(.*?) *\| *(\S*) *\| *([^|]*)\| *([^|]*)\|/;
  my ($d,$aud,$push,$note,$label,$url,$facts,$pr)=($1,$2,$3,$4,$5,$6,$7,$8);
  my %lab=(nri=>"NRI &amp; OCI",investor=>"Foreign Investor",business=>"Indian Business",newact=>"New Income-tax Act");
  my @m=qw(January February March April May June July August September October November December);
  my ($y,$mo,$da)=split /-/,$d; my $disp=int($da)." ".$m[$mo-1]." $y";
  $url = "" unless $url =~ /^https:\/\//;
  my $link = $url ? qq{ <a href="$url" target="_blank" rel="noopener">$label</a>} : "";
  print qq{        <li class="update-item" data-audience="$aud">\n          <div class="update-meta"><time datetime="$d">$disp</time><span class="post-tag t-$aud">$lab{$aud}</span></div>\n          <p>$note$link</p>\n        </li>\n};
' _pipeline/BULLETIN.md)
# keep newest N (rows are newest-first in BULLETIN.md)
export N
ITEMS=$(printf '%s\n' "$ITEMS" | perl -0777 -ne 'my @li = /(        <li class="update-item".*?<\/li>\n)/sg; my $n=$ENV{N}; $n=scalar(@li) if $n>@li; print join("", @li[0..$n-1]) if $n>0')
export ITEMS
if [ -z "$ITEMS" ]; then echo "render-bulletin: no rows in BULLETIN.md — nothing rendered"; exit 0; fi
if grep -q '<!-- BULLETIN:START -->' insights.html; then
  perl -0777 -i -pe 's/(<!-- BULLETIN:START -->\r?\n).*?\r?\n?[ \t]*(<!-- BULLETIN:END -->)/$1$ENV{ITEMS}\n$2/s' insights.html
  echo "render-bulletin: items regenerated ($N max)"
elif grep -q '<!-- BULLETIN:ANCHOR -->' insights.html; then
  SECTION=$(cat <<'HTML'
<!-- ================= LATEST UPDATES (generated from _pipeline/BULLETIN.md by render-bulletin.sh) ================= -->
<section class="bg-paper" id="updates">
  <div class="container">
    <div class="updates-panel reveal">
      <div class="section-head"><span class="eyebrow">Latest updates</span><h2>Recent developments</h2></div>
      <ol class="updates-list">
<!-- BULLETIN:START -->
<!-- BULLETIN:END -->
      </ol>
      <p class="muted updates-note">Summaries of official publications, given for professional updation; not advice. Older notes are removed as they age.</p>
    </div>
  </div>
</section>
HTML
)
  export SECTION
  perl -0777 -i -pe 's/<!-- BULLETIN:ANCHOR -->/$ENV{SECTION}/' insights.html
  perl -0777 -i -pe 's/(<!-- BULLETIN:START -->\r?\n).*?\r?\n?[ \t]*(<!-- BULLETIN:END -->)/$1$ENV{ITEMS}\n$2/s' insights.html
  echo "render-bulletin: section inserted at anchor and items rendered ($N max)"
else
  echo "render-bulletin: neither markers nor anchor found in insights.html"; exit 1
fi
