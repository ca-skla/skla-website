# RUNBOOK.md — SKLA Insights pipeline

The operating procedure for the two cloud routines that keep www.skla.in/insights.html current, and for the
human who reviews their pull requests. Read this file completely before doing anything else. Where this file
and a routine prompt differ, the hard rules in §3 win, then this file.

Site facts: plain static HTML, no build step. Repo `ca-skla/skla-website`, branch `main` → Netlify deploys
automatically. Netlify rewrites `x.html` links to `/x` at deploy time — always write `x.html` in source.
Everything durable the pipeline needs lives in `_pipeline/` (never served: shadowed by a forced 404).

---

## 0. Purpose, scope, non-goals

- Publish one new, fully sourced insight article every fortnight (1st and 15th) after human review.
- Keep the existing articles correct as the law changes; keep a dated "Latest updates" bulletin on
  `insights.html`.
- Never publish anything unreviewed. Never state a figure, date, form, section or judgment that is not traced
  to a primary instrument in `FACTS.md`. When unsure, write less.
- Out of scope for the routines: every page other than `insights.html` and `insights-*.html`; CSS/JS;
  header/footer/nav markup; `netlify.toml`; `robots.txt`; `CLAUDE.md`; `README.md`; this file; `config.yml`;
  `COMPLIANCE.md`; `bin/*`; `insights-article-template.html`. Those change only through human PRs.

## 1. Files and roles

| Path | Purpose | Written by |
|---|---|---|
| `_pipeline/config.yml` | mode / paused / reviewer / notify e-mail / lane limits | humans |
| `_pipeline/RUNBOOK.md` | this procedure | humans |
| `_pipeline/COMPLIANCE.md` | ICAI + firm rules; the hard-fail regexes | humans |
| `_pipeline/STRATEGY.md`, `_pipeline/BRIEFS.md` | audiences, pillars, house style; per-article briefs | humans; draft lane appends briefs |
| `_pipeline/BACKLOG.md` | state block, ordered backlog, published log, parked ideas | draft lane (status/dates), humans (order/rows) |
| `_pipeline/FACTS.md` | the facts register — every figure on the insight pages | both lanes |
| `_pipeline/BULLETIN.md` | canonical log of bulletin notes | both lanes |
| `_pipeline/reviews/<slug>.md`, `refresh-<yyyy-mm>.md` | review pack per PR (audit trail after merge) | both lanes |
| `_pipeline/templates/*` | PR body skeletons, bulletin item snippet | humans |
| `_pipeline/routines/PROMPT-*.md` | the exact prompts installed in the cloud routines | humans |
| `_pipeline/bin/*.sh` | lint and render scripts (bash + grep + perl; Linux) | humans |
| `_pipeline/bin/sync-mirror.ps1` | LOCAL only: repo → OneDrive mirror + zip | humans |
| `_pipeline/reference/*` | the ICAI website-rules study | humans |

## 2. Lanes and cadence

| Lane | Routine | When (IST) | Produces |
|---|---|---|---|
| **draft** | `skla-insight-draft` | 1st and 15th, 07:00 | one PR `insight/<slug>`: new article + index card + sitemap + FACTS/BACKLOG rows + review pack; plus a separate `refresh/<yyyy-mm>-<topic>` PR only if the scan found a material change to an existing article; bulletin notes |
| **refresh** | `skla-law-watch` | 8th, 07:00 | one PR `refresh/<yyyy-mm>`: re-verification of FACTS rows older than `reverify_after_days`, corrections, one thin-article expansion (BACKLOG §D), bulletin ageing |

One open PR per lane. If the lane's branch prefix already exists on `origin` or an open PR has that head, the run
prints `STATUS: SKIPPED`, leaves a reminder comment on the open PR (if it can) and stops — it never queues a
second draft. State advances only through merged PRs, so overlapping scan windows are safe: always check whether a
change is already reflected on the page before acting on it.

## 3. Hard rules (apply even if everything else is unreachable)

- **R1** Never commit to, push, merge into, force-push or delete `main`. Never merge, close or delete anything on
  GitHub. You open pull requests; a human publishes.
- **R2** Write only inside your lane's allowlist (§4.7 / §5.6). Anything else in `git diff --name-only
  origin/main...HEAD` is reverted with `git checkout origin/main -- <file>` and reported.
- **R3** E-mail, if a Gmail tool is available and `mode: live`, goes to `config.notify_email` only. One message
  per run, no attachments, no article text intended for onward circulation.
- **R4** Never print tokens or credentials. Never install packages. At most one new article per run.
- **R5** Every figure, rate, threshold, date, form number, section number and judgment in anything you write has
  a `FACTS.md` row with a fetched primary source and a quoted excerpt (§6). No row, no sentence.
- **R6** A secondary source is never authority. If the primary text cannot be read, the claim is removed or
  hedged to the qualitative rule and the row is marked `unverified` (⚠ for the reviewer). Never guess a section,
  form or notification number.
- **R7** `COMPLIANCE.md` applies to every word you write, including bulletin notes, PR bodies and e-mails.

## 4. Draft lane — procedure

### 4.0 Bootstrap
```
git fetch origin && git checkout main && git pull --ff-only
```
Read `config.yml`. If `paused: true` → print `STATUS: PAUSED`, stop. Set `TODAY=$(date -u +%F)`,
`MONTH_LABEL=$(date -u +"%B %Y")`, `DISPLAY_DATE=$(date -u +"%-d %B %Y")`.
Environment probe (report the results, never the values): `command -v gh`; `gh auth status` (yes/no);
`GITHUB_TOKEN` set (yes/no); which of the allowlisted portals returned readable content (§6.3 ladder).

### 4.1 Gate
`git ls-remote --heads origin 'insight/*'` non-empty, or an open PR with head `insight/*`
(`curl -s https://api.github.com/repos/ca-skla/skla-website/pulls?state=open`) → `STATUS: SKIPPED`; if `gh` is
authenticated, `gh pr comment <n> --body "Reminder: this draft is still awaiting review; the <TODAY> scheduled
draft was skipped and will run after this PR is merged or closed."` Print the summary block (§14) and stop.

### 4.2 Scan for developments (also feeds refresh items and bulletin notes)
Read the `State` block of `BACKLOG.md` (`last_scanned`, `next_audience`). For each source in §6.2, collect items
dated after `last_scanned` (discovery by `site:` search where the portal blocks fetches — §6.3). Open and read each
candidate. Triage with the materiality rubric (§7.1) and classify NEW / EDIT / BULLETIN / ignore. Record the
scan (sources, window, counts) for the review pack.

### 4.3 Pick the work item (§7)
Material NEW item → the reactive `Update` piece this run. Otherwise the first `queued`, unblocked BACKLOG row for
`next_audience` (one seasonal override per run when another row's `publish_by` is within 30 days). Self-heal
BACKLOG first: any row whose file exists on `main` → `published`; any row whose PR was closed unmerged → `queued`.
Dedupe (§7.3). No item and nothing material → `STATUS: EMPTY-BACKLOG` (still do 4.9 bulletin/refresh if any).
`SLUG=<slug>`; `git checkout -b insight/$SLUG`.

### 4.4 Research → source dossier (§6)
Build the dossier before writing prose: for every proposition the article will make, an instrument, its official
URL, the quoted excerpt (≤ 40 words) that supports it, the effective date, and the in-force check. Write the
`FACTS.md` rows now (row first, prose second). Append the brief to `BRIEFS.md` (keyword, intent, outline,
FAQ, links, differentiation, sources).

### 4.5 Draft (§8, §9)
Copy `insights-article-template.html` → `insights-$SLUG.html` and replace everything, keeping the anatomy
exactly. Mark each element that states a registered fact with `data-fact="F-####"`. Then: one card at the top of
the matching audience group in `insights.html`; one `<url>` in `sitemap.xml` (`lastmod $TODAY`, `monthly`,
`0.7`) and bump `insights.html`'s `<lastmod>`; a related-grid swap in 1–3 siblings (link-only edit; no date bump).

### 4.6 Verification pass (mandatory, after drafting)
For every `FACTS.md` row used in the file: re-fetch the source; confirm the excerpt is present in the fetched
text (PDFs → text first) and that the sentence as written is what the source says; check for a later amending
instrument (§6.5). Fix or remove on any failure. Record ✅ / ⚠ per row. A PR is opened only when every row that
carries a figure, date, form or section is ✅ **or** is explicitly hedged in the text and listed ⚠ for the
reviewer. Judgments: confirm parties, court, date, citation and the holding as quoted.

### 4.7 Allowlist (draft lane)
`insights-$SLUG.html` (new) · `insights.html` (one card; `<lastmod>` in sitemap) · `sitemap.xml` (one `<url>` +
insights lastmod) · ≤ `max_related_swaps` sibling `insights-*.html` (related-grid block only) ·
`_pipeline/BACKLOG.md` · `_pipeline/BRIEFS.md` (append) · `_pipeline/FACTS.md` · `_pipeline/BULLETIN.md` ·
`_pipeline/reviews/$SLUG.md`. A refresh item found by the scan goes on its own branch `refresh/<yyyy-mm>-<topic>`
with the refresh-lane allowlist (§5.6), committed separately.

### 4.8 Self-check (≤ 3 fix iterations)
```
bash _pipeline/bin/check-article.sh $SLUG && bash _pipeline/bin/check-site.sh draft
```
Keep the final output verbatim for the review pack. Unresolved hard fail → push anyway, title `[NEEDS FIX] …`,
draft PR, `STATUS: NEEDS-FIX`.

### 4.9 Bulletin
Prepend any BULLETIN items found in 4.2 to `_pipeline/BULLETIN.md`, run `bash _pipeline/bin/render-bulletin.sh`
(inserts or regenerates the block in `insights.html`; newest `bulletin_max_items` shown).

### 4.10 Review pack, commits, diff audit
Fill `_pipeline/templates/PR-BODY-draft.md` → `_pipeline/reviews/$SLUG.md`. Update the BACKLOG row
(`in-review`, date, PR when known), the State block (`last_scanned: $TODAY`, `next_audience` rotated). Commit:
(1) `Draft insight: <title>` — article, card, sitemap, related swaps; (2) `Pipeline: facts, backlog, review pack
for <slug>`. Diff audit per R2.

### 4.11 Deliver
- `mode: dry-run` → `git push -u origin HEAD:dryrun/$SLUG`; no PR, no e-mail; print the compare URL.
- `mode: live` → `git push -u origin insight/$SLUG`, then (a) `gh pr create --base main --head insight/$SLUG
  --title "[DRAFT] <title>" --body-file _pipeline/reviews/$SLUG.md` (+ `gh pr edit --add-label draft-article`;
  add `needs-partner` if any ⚠ row); (b) else with `GITHUB_TOKEN`: `POST /repos/ca-skla/skla-website/pulls`;
  (c) else print `OPEN PR MANUALLY: https://github.com/ca-skla/skla-website/compare/main...insight/$SLUG?expand=1`.
  Preview URL: `https://deploy-preview-<PR#>--<netlify_site_name>.netlify.app/insights-$SLUG.html` (or the
  branch deploy `https://insight-$SLUG--<site>.netlify.app/…` when there is no PR number yet).
  E-mail (Gmail tool present): to `notify_email`, subject `[SKLA site] Draft ready for review: <title> (PR #n)`,
  body = summary block + preview + PR links + the ⚠ rows.

## 5. Refresh lane — procedure

### 5.0–5.1 Bootstrap and gate as §4.0–4.1 with prefix `refresh/`; `YM=$(date -u +%Y-%m)`; a same-month
`refresh/$YM` branch or PR → `SKIPPED`.

### 5.2 Scope
Read `FACTS.md`. Select (a) rows with `verified` older than `reverify_after_days` or `status: unverified`;
(b) the next thin article in BACKLOG §D (expansion schedule); (c) every article untouched for 12 months (full
re-read for time-dependent phrasing).

### 5.3 Scan and re-verify
For each selected row: fetch the primary source (§6.3), confirm the value, check for later amendments (§6.5).
Changed → new row, old row `superseded` (+ `superseded_by`), move the `data-fact` marker, edit every occurrence
(body, callout, FAQ HTML **and** FAQPage JSON-LD), bump `Updated <Month YYYY>`, JSON-LD `dateModified`, sitemap
`lastmod` (never `datePublished`). Unchanged → update `verified` only; no text or date change on the page.
Also run the §4.2 scan for developments since `last_scanned` and classify them (EDIT items are handled here;
NEW items are noted in the pack for the draft lane; BULLETIN items go to BULLETIN.md).

### 5.4 Thin-article expansion (one per month)
Expand the scheduled article to its type's word range with the full research/dossier/verification treatment,
add the References block, correct its read time, bump its dates. Mark the BACKLOG §D row done.

### 5.5 Deliver
No changed rows, no expansion due, no bulletin items → `STATUS: NO-CHANGES` (report sources checked; no branch).
Else branch `refresh/$YM`, `render-bulletin.sh`, `check-site.sh refresh`, `check-article.sh` per touched file,
review pack from `PR-BODY-refresh.md` → `_pipeline/reviews/refresh-$YM.md`, commit `Refresh <Month YYYY>: <n>
articles, <m> facts re-verified, <k> bulletin items`, deliver as §4.11 with title `[REFRESH] <Month YYYY>`.

### 5.6 Allowlist (refresh lane)
Existing `insights-*.html` (content and References block; never the related-grid block, header, footer, nav) ·
`insights.html` (bulletin block between the markers; card blurb only when it states a changed value) ·
`sitemap.xml` (lastmods) · `_pipeline/FACTS.md` · `_pipeline/BULLETIN.md` · `_pipeline/BACKLOG.md` (§D row) ·
`_pipeline/reviews/refresh-<yyyy-mm>.md`.

## 6. Research and citation standard

### 6.1 Hierarchy of authority (cite the highest that settles the point)
1. **Statute and rules in force**, from official text: Income-tax Act 2025 (in force 1 April 2026; tax year
   2026-27 onward) and the Income-tax Act 1961 for periods to 31 March 2026 (returns filed during 2026 for
   FY 2025-26 are under the 1961 Act); Income-tax Rules 2026 (Notification No. 22/2026, G.S.R. 198(E), 20 March
   2026) and the 1962 Rules; Finance Acts; CGST/IGST Acts and CGST Rules 2017; FEMA 1999 with its rules,
   regulations and RBI Master Directions (record the "updated as on" date); Companies Act 2013 and rules; LLP Act
   2008; EPF/ESI Acts for payroll topics.
2. **Subordinate instruments, always by number and date** (with G.S.R./S.O. and Gazette reference where
   gazetted): CBDT notifications and circulars; CBIC notifications (Central Tax / Rate) and circulars; DPIIT press
   notes; RBI A.P. (DIR Series) circulars, FEMA notifications, press releases; MCA notifications and circulars;
   ICAI announcements. GST Council **recommendations are not law until notified** — say so and give no effective
   date until the notification exists. Press releases and FAQs are explanatory; label them as such.
3. **Judicial authority** — cite *parties, court/bench, date, citation (neutral or reporter)* and one sentence on
   what was held; add subsequent history where found. Supreme Court binds everyone; a High Court binds its state
   (Telangana High Court for Hyderabad readers; others persuasive); ITAT is persuasive (name the bench); AAR/AAAR
   rulings bind only the applicant; CESTAT/NCLT for their domains. Use a judgment only where it materially settles
   a question readers face; no lists of cases for their own sake.

### 6.2 Source allowlist (primary; also the only domains an article or bulletin may link to)
| Domain | Cite / scan | Scan page(s) |
|---|---|---|
| incometaxindia.gov.in | Act/Rules text, CBDT circulars, notifications, press releases | Notifications; Circulars; Press releases (`/notifications`, `/circulars`) |
| incometax.gov.in | e-filing portal: ITR/utility releases, due-date announcements, form manuals | Latest Updates |
| egazette.gov.in | Gazette text of Acts, Rules, S.O./G.S.R. notifications | search by ministry/date; PDFs `/WriteReadData/<yyyy>/<id>.pdf` |
| indiacode.nic.in | consolidated Acts | as needed |
| indiabudget.gov.in, finmin.nic.in, dea.gov.in | Budget speech, Finance Bill/Act, memorandum | 1 Feb and the following run |
| cbic.gov.in, cbic-gst.gov.in, taxinformation.cbic.gov.in | GST notifications, circulars, instructions | `cbic-gst.gov.in` PDF lists; tax-information portal |
| gst.gov.in, einvoice1.gst.gov.in | portal advisories, e-invoice / e-way bill, return changes | News & Updates |
| gstcouncil.gov.in | Council meeting recommendations, press releases | What's New; Press Release |
| rbi.org.in, fema.rbi.org.in, firms.rbi.org.in, flair.rbi.org.in | FEMA notifications, A.P. (DIR Series) circulars, master directions, press releases; FIRMS/FLAIR guidance | Notifications; Master Directions; Press Releases |
| mca.gov.in | Companies/LLP rules, circulars, forms, due-date extensions | Notifications; Circulars |
| dpiit.gov.in, startupindia.gov.in, fifp.gov.in | FDI press notes, startup recognition, approval route | Press Notes; Notifications |
| pib.gov.in | Ministry of Finance / Commerce releases | ministry filter by date |
| icai.org, resource.cdn.icai.org | Code of Ethics, guidance notes, announcements | Announcements |
| sci.gov.in, hcts.tshc.gov.in (Telangana HC), itat.gov.in, other HC sites | judgments and orders | search by subject / party |
| epfindia.gov.in, esic.gov.in | payroll topics only | as needed |
| registration.telangana.gov.in, tgct.gov.in | Telangana stamp duty / state GST | as needed |
| contents.tdscpc.gov.in (TRACES) | TDS procedures, Form 128/27Q mechanics | as needed |

Secondary sites (Taxmann, TaxGuru, ClearTax, CAclubindia, Big-4 alerts, PRS, business press) are for discovery
only — to learn that something happened and to find the instrument number. Never cite or link them; record them
in `FACTS.md` notes as "found via".

### 6.3 Fetch ladder (some portals block automated clients)
Probed 5 Sep 2026: rbi.org.in, gstcouncil.gov.in, cbic-gst.gov.in readable; taxinformation.cbic.gov.in and
egazette.gov.in need `curl -k`; pib.gov.in and indiacode.nic.in need browser-like headers; **incometaxindia.gov.in
and mca.gov.in return 403 to every non-browser client** (discovery still works through `site:` search, whose
index carries instrument numbers and titles).
1. Fetch the official page/PDF directly (`WebFetch`, else
   `curl -sSL -k -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/128 Safari/537.36"`;
   PDFs → text with `pdftotext` or `python3 -c "import pypdf…"` if available).
2. Gazette copy on egazette.gov.in (search `site:egazette.gov.in "G.S.R. <no>(E)"` or the notification title).
3. PIB release for the same instrument (explanatory — confirms number, date and effect, not operative text).
4. India Code for Act text.
5. `_pipeline/sources/` — a repo-resident cache of instrument texts, if present (a local task may populate it).
6. An unofficial verbatim copy (Taxmann/TaxGuru) used **only as a text copy**: the row is `unverified`, the PR
   row is ⚠ "reviewer to verify on portal", and the sentence is hedged. Circulars (not gazetted) often land here.
Record which rung was reached in the row's `notes`.

### 6.4 Sourcing rule
Every number, date, rate, threshold, form, section, penalty, fee, deadline and portal step in a draft must have a
`FACTS.md` row: instrument, official URL (or reporter citation), excerpt, effective date, verified date, in-force
check. The element that states it carries `data-fact="F-####"`. The row is written before the sentence.

### 6.5 Recency and in-force rule
- V-class facts (rates, thresholds, due dates, forms, fees, procedures): the instrument must be the one
  currently operative — after locating it, search the same source for later amendments up to the run date
  ("amend", "supersede", "rescind", the instrument number); read the consolidated "as amended" text where the
  portal provides one. `verified` must be within `reverify_after_days` at PR time.
- S-class facts (definitions, structural rules): cite the consolidated Act/Rules; re-verify annually.
- Judgments: search for appeal / SLP / review outcomes; record "subsequent history: none found (checked <date>)"
  when nothing turns up.
- Conflicting sources → do not quote either figure; describe the framework; row `disputed`; ⚠ Low confidence.
- Deadlines: always with the year and the assessment/tax year they belong to; never "this year", "recently",
  "as of mid-2026". Worked examples carry no calendar year unless it matters.

### 6.6 Income-tax Act 2025 renumbering convention
First mention: `section 395 of the Income-tax Act 2025 (section 197 of the 1961 Act)`; forms `Form 128 (earlier
Form 13)`; later mentions use the new number only. State which regime governs the period discussed. Mapping
source of truth: `FACTS.md` §1 (verified against the Act text) and `insights-old-vs-new-section-numbers.html`.
An unmapped section → look it up in the Act text, add a row, then use it; if unresolved write "the successor
provision under the Income-tax Act 2025 (section 44AA of the 1961 Act)" and flag ⚠.

## 7. Topic selection

### 7.1 Materiality rubric — all five must hold
1. Primary-sourced: the instrument itself is on an allowlisted domain (or a Gazette/India Code copy).
2. Effective: in force now, or a fixed commencement within 12 months (drafts, bills before assent, consultation
   papers → bulletin at most).
3. In scope: NRIs/OCIs, foreign investors into India, or Indian SMEs/startups/professionals, on a topic inside the
   pillars (STRATEGY.md), the six service pillars, or an existing article.
4. Actionable: changes a rate, threshold, due date, form, procedure, eligibility or penalty a reader would act on
   (clarifications, FAQs, utility releases, extensions under 7 days → bulletin).
5. Not already reflected in the current text of the articles.

### 7.2 Classification
| Outcome | When | Action |
|---|---|---|
| NEW article (`Update`) | new topic no article covers, or "what to do" changes for a whole audience (Budget / Finance Act, new form regime, due-date framework, GST Council package, FDI press note) | reactive piece this run; slug carries the year |
| EDIT | a value/date/form/section inside an existing article's scope | refresh PR |
| BULLETIN | extension, clarification, utility release, ICAI announcement, in-scope but not article-worthy | one note |
| ignore | fails the rubric | logged in the run report |
Two NEW candidates → the one affecting more audiences; the other goes to the top of the backlog with
`publish_by` = +14 days. Budget day: bulletin first; the reactive article on the following run once the Bill
text is available.

### 7.3 Rotation, seasonality, dedupe
Rotation `nri → investor → business → nri …` (`newact` counts as the audience it primarily serves). Seasonal
override once per run. Before drafting, compare the working title and keyword with every live `<title>`, `<h1>`
and `meta keywords`; ≥ 50 % overlap of intended H2s → extend the existing article (refresh with new H2s) or park
the row as `duplicate-of: <slug>`.

## 8. Drafting rules

**Length (body, lead → last FAQ answer):** Update 900–1,400 · Explainer/Reference 1,200–1,600 · Guide
1,500–1,800 (big-bet guides to 2,400) · How-to 1,800–2,500 · Comparison 1,600–1,800 · Pillar guide 2,500–4,000.
Read time `max(4, round(words/160))` min. Never pad; ship shorter and say so.

**Anatomy (exactly the template's):** head SEO (`<title>` headline ≤ 52 chars + ` | SKLA`; meta description
150–160 unique; keywords; canonical = og:url = `mainEntityOfPage` = breadcrumb item 3; og:type article) →
JSON-LD: Article → HowTo only if the body has numbered `<h3>` steps → FAQPage → BreadcrumbList → hero
(breadcrumb `Home / Resources / <label ≤ 32 chars>`; bare `post-tag` eyebrow from the closed list; one `<h1>`;
`article-meta`: Reviewed by · `Updated <Month YYYY>` · N min read) → `p.article-lead` (2–3 sentences: problem +
payoff) → H2 sections (H3 only for steps/sub-cases) → `div.callout > h4 "The short version"` after the first or
second H2 → one `<blockquote>` practitioner insight, generalised (never a client or a matter) → optional table →
one neutral contact line at most → byline block → FAQ 3–5 (real search phrasings; answers 40–80 words, no links,
no "contact us"; mirrored exactly in FAQPage) → **References** block (§9) → related grid (exactly 3 live cards,
same primary audience) → disclaimer verbatim → footer.

**Reactive (`Update`) skeleton:** What changed (table Before → After → From when) · Who is affected · What to do
now · What has not changed · FAQ. **Pillar skeleton:** lead · How to use this guide · one H2 per cluster article
(150–250-word summary ending in a descriptive link) · Common sequences · FAQ (5) · related grid of the three
most useful cluster articles; every cluster article then gets a link-only edit pointing up to the pillar.

**Voice:** short sentences, plain English, premium-advisory, warm but precise. "You" for explanation; no
personalised recommendations, no outcome promises, no hype. Numbers with `&#8377;`; `&mdash;` for dashes,
`&ndash;` in ranges, `&rsquo;` apostrophes; raw UTF-8 only in `<title>`, meta, JSON-LD and alt text.

**Links:** exactly one `services.html#<anchor>` in the body, descriptive not promotional — NRI `#nri`; India
entry/FEMA `#fema`; income-tax, GST, transfer pricing, PE, treaties `#tax`; company law / structuring / ROC /
ESOP `#advisory`; bookkeeping / payroll / PF-ESI `#accounting`; statutory audit / attestation `#audit` (tax audit
stays `#tax`). 1–3 sibling links with descriptive anchor text; one link up to the pillar once it exists; an inbound
related-card link from ≥ 1 sibling. Outbound links only to §6.2 domains, and only in the References block or a
bulletin note.

**Metadata (closed lists):** slug `insights-<3–6 words>.html` (year only for inherently dated pieces; never
renamed after merge) · `data-audience` ∈ `nri|investor|business|newact` (two allowed, primary first) · card pill
`t-nri "NRI &amp; OCI"` / `t-investor "Foreign Investor"` / `t-business "Indian Business"` / `t-newact "New
Income-tax Act"` · hero eyebrow `For NRIs &amp; OCIs` / `For Foreign Investors` / `For Indian Businesses` /
`Income-tax Act 2025` / `For Founders &amp; Investors` (dual business+investor only) · type label Guide · How-to ·
Comparison · Update · Reference · Pillar guide · Explainer · new card at the top of its audience group; the
featured slot changes only by human decision.

**Reviewer:** default `CA. Sunil Kumar Lahoti` → `Partner, S K Lahoti Associates, Chartered Accountants.`
GST / indirect tax → `CA. Shradha Lahoti` → `Partner, S K Lahoti Associates &mdash; indirect tax and GST
compliance.` International tax / transfer pricing / PE / treaties / cross-border remittance → `CA. Shradha
Lahoti` → `Partner, S K Lahoti Associates &mdash; international and cross-border taxation.` FEMA / India entry
stays Sunil. Avatar `SL` either way. Nothing else in a byline.

**Dates:** new article `datePublished = dateModified = TODAY`; `Updated <Month YYYY>` = run month; sitemap
`lastmod = TODAY`, `changefreq monthly`, `priority 0.7` (pillar 0.8). If the merge slips past month-end the
reviewer asks the desktop app to re-stamp before merging.

## 9. Article contract (checked by `bin/check-article.sh`)

Starts `<!DOCTYPE html>`, ends `</html>`; exactly one `<h1>`; no HTML comments, no `{{`, no `Coming soon`, no
`VERIFY`; canonical = og:url = mainEntityOfPage = breadcrumb item 3; both `Reviewed by` strings = config
reviewer; `Updated <Month YYYY>` present; JSON-LD parses, ISO dates; FAQ count parity with FAQPage; exactly one
service link; every internal href resolves; nav has 8 links with Insights `class="active"`; footer carries the
ICAI line and `wa.me/919885580871`; hard-fail regexes from COMPLIANCE.md; no raw non-ASCII in the body except the
logo alt texts; sitemap lists the URL; `insights.html` links to the file; every `data-fact` id exists in
`FACTS.md` with this file in `used_in`, and every `current` row for this file has a marker; **References block
present** for any article with `dateModified` ≥ 2026-09-01 (legacy articles: warning until re-verified).

**References block** (between the FAQ block and the related grid):
```html
<section class="article-refs">
  <h2>References</h2>
  <p class="refs-note">Position stated as on 15 September 2026 &middot; sources checked 15 September 2026.</p>
  <ol>
    <li data-fact="F-0102">Income-tax Rules, 2026 &mdash; Notification No. 22/2026 [F. No. 370142/41/2025-TPL] / G.S.R. 198(E), 20 March 2026 (CBDT). <a href="https://egazette.gov.in/WriteReadData/2026/271439.pdf" target="_blank" rel="noopener">Gazette copy</a></li>
    <li>Income-tax Act, 2025, section 395. <a href="https://www.indiacode.nic.in/" target="_blank" rel="noopener">India Code</a></li>
    <li><em>Parties v Parties</em>, Supreme Court of India, 12 March 2025, 2025 INSC 123 &mdash; held that &hellip;</li>
  </ol>
</section>
```
Disclaimer (verbatim): "This article is provided for general professional information and updation only. It
does not constitute professional advice or an offer or solicitation of any work. Readers should obtain
appropriate professional advice on their specific facts before acting. Figures, forms and dates are subject to
change in law."

## 10. Facts register (`FACTS.md`)

Row: `| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class |
status | used_in | notes |`. `id` is permanent (`F-####`, next = max + 1; never reuse). `class` V = volatile
(rates, thresholds, due dates, forms, fees, procedures), S = structural. `status` = `current` · `unverified`
(no primary text read yet — ⚠ in the pack) · `disputed` · `superseded` (+ `superseded_by` in notes). `partner`
= ☐ or ☑ `YYYY-MM-DD/SL`. `used_in` = `file@F-####` list. A changed value → new row + old row superseded.
Rows are written before prose. Sections: 1 renumbering map · 2 income-tax · 3 GST · 4 FEMA/FDI/RBI ·
5 Companies/MCA/DPIIT · 6 payroll & other · 7 open verification items · 8 superseded.

## 11. Bulletin ("Latest updates")

`insights.html` carries a `bg-paper` section between the page hero and the filter pills, generated between
`<!-- BULLETIN:START -->` and `<!-- BULLETIN:END -->` by `bin/render-bulletin.sh` from `BULLETIN.md` (newest
`bulletin_max_items`). Item: `<li class="update-item" data-audience="…">` → `<time datetime>` + audience pill +
one paragraph ≤ 80 words: what changed, from when, for whom, naming the instrument (number · date) with one link
to the official source (`target="_blank" rel="noopener"`). No firm services, no adjectives about the firm, no
CTA. Audit/attestation notes are fine on-site but `push: no`. Older notes stay in `BULLETIN.md` only. No JSON-LD
for notes. Bump `insights.html` `<lastmod>` when the block changes.

## 12. Review pack

The PR body is the review pack (`templates/PR-BODY-*.md`): summary · why now · audience/type/reviewer/service
link/push · **⚠ VERIFY table** (one row per registered fact: sentence as written, value, instrument, link,
excerpt, effective, ✅/⚠, checkbox) · judgments cited · self-check output verbatim · preview links · files
changed · bulletin notes · sources scanned · how to publish. The same text is committed as
`_pipeline/reviews/<slug>.md` so it survives after merge.

## 13. Definition of done; failure modes

Done: PR open with the pack; all checks pass; `BACKLOG.md`, `FACTS.md`, `BULLETIN.md` updated in the same PR;
diff ⊆ allowlist; run report lists sources scanned and the window; summary block printed.

| Situation | Behaviour |
|---|---|
| Nothing material and queue empty | bulletin/refresh only; else no PR; report "queue exhausted" |
| Primary source unreachable | ladder §6.3; still unreadable → claim removed or hedged; row `unverified` ⚠; note the outage; > half the scan list unreachable → skip the reactive path and take the queue item |
| Law ambiguous / sources conflict | write nothing on that point; describe the framework; row `disputed`; ⚠ Low |
| New-Act number unknown | old number with "successor provision under the Income-tax Act 2025"; flag ⚠ |
| Dedupe finds overlap | extend the existing article or park `duplicate-of`; never a near-duplicate page |
| Word range unreachable without padding | ship shorter, say so |
| Audit/attestation subject | write it (on-site is pull); `push: no`; `#audit` |
| Any hard fail unresolved after 3 iterations | draft PR titled `[NEEDS FIX]`; `STATUS: NEEDS-FIX` |
| Run interrupted mid-way | nothing is on `main`; the branch is disposable; the next run self-heals BACKLOG |

## 14. Summary block (always the last thing printed)
```
STATUS: DRAFTED | DRY-RUN | SKIPPED | NEEDS-FIX | EMPTY-BACKLOG | REFRESHED | NO-CHANGES | PAUSED | FAILED
Slug/branch: … | PR: … | Compare: … | Preview: …
Facts: n registered, n ✅ verified, n ⚠ for reviewer (top 5 listed) | Judgments cited: n
Checks: pass/fail one-liner | Env probe: gh=yes/no auth=yes/no token=yes/no | Portals readable: …
Sources scanned: … (window … → …) | Next queued: <slug>
```

## Appendix A — snippets

Index card:
```html
<article class="post-card" data-audience="nri">
  <span class="post-tag t-nri">NRI &amp; OCI</span>
  <h3><a href="insights-<slug>.html">Title</a></h3>
  <p>One-line excerpt under 160 characters &mdash; the reader&rsquo;s question, answered in a clause.</p>
  <div class="post-meta"><span>Guide</span><span class="dot"></span><a href="insights-<slug>.html" class="link-arrow">Read <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M13 6l6 6-6 6"/></svg></a></div>
</article>
```
Sitemap entry (2-space `<url>`, 4-space children): `<url><loc>https://www.skla.in/insights-<slug>.html</loc>
<lastmod>YYYY-MM-DD</lastmod><changefreq>monthly</changefreq><priority>0.7</priority></url>`.
Related card: `<article class="post-card" data-audience="…"><span class="post-tag t-…">…</span><h3><a href="…">…</a></h3>
<p>…</p><div class="post-meta"><span>Guide</span><span class="dot"></span><span>8 min read</span></div></article>`.

## Appendix B — seasonal calendar (candidates only; verify every date against its instrument before use)
Advance tax instalments 15 Jun / 15 Sep / 15 Dec / 15 Mar · TDS quarterly statements 31 Jul / 31 Oct / 31 Jan /
31 May · non-audit ITR 31 Jul · tax audit report 30 Sep · audit-case ITR 31 Oct · transfer-pricing ITR 30 Nov ·
belated/revised ITR 31 Dec · GSTR-9/9C 31 Dec · FLA return 15 Jul · DIR-3 KYC 30 Sep · AGM by 30 Sep · AOC-4
within 30 days of AGM · MGT-7 within 60 days of AGM · Budget 1 Feb · Income-tax Rules/forms notifications
typically Feb–Apr.

## Appendix C — environment probe commands
`command -v gh; gh auth status 2>&1 | head -1; [ -n "$GITHUB_TOKEN" ] && echo token=yes || echo token=no;`
`for u in https://www.rbi.org.in/Scripts/NotificationUser.aspx https://gstcouncil.gov.in/ https://cbic-gst.gov.in/
https://egazette.gov.in/ https://pib.gov.in/allRel.aspx https://www.incometaxindia.gov.in/notifications
https://www.mca.gov.in/; do printf "%s " "$u"; curl -s -k -o /dev/null -w "%{http_code}\n" -A "Mozilla/5.0"
--max-time 20 "$u"; done`
