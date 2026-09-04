# SKLA Website — Project Brief

Marketing website for **S K Lahoti Associates** (abbreviation: **SKLA**), a Chartered
Accountant firm in Hyderabad / Secunderabad, India, established 1989. Live domain: **www.skla.in**.

> Note: the firm name is written **without dots** — "S K Lahoti Associates", not "S. K.".

## Goal
Win business from Indian clients and foreign clients (foreign investors entering India +
NRIs/OCIs). Premium / advisory positioning, warm but precise voice, short sentences.

## Stack
Plain static site — hand-written HTML, one shared CSS file, one vanilla JS file. No build
step, no framework, no dependencies. Just open `index.html` in a browser.

## Structure (the live v2 site, at the repo root)
```
index.html        Home
about.html        About / firm story
services.html     Services — 6 pillars in an editorial two-column layout + "Beyond business"
industries.html   Industries served + charitable organisations  (replaced the old clientele page)
team.html         Partners + team (real photos)
careers.html      Employment + ICAI-aligned internship
contact.html      Contact form + Google map
insights.html     Resources index + 26 insight articles (insights-*.html)
404.html          Not-found page
sitemap.xml, robots.txt, site.webmanifest, netlify.toml
assets/css/style-v2.css   All styles (CSS variables at top control theme)
assets/js/main-v2.js      Nav, scroll reveal, form, year
assets/img/               logo.svg/png, favicon.*, apple-touch-icon.png, og-image.png,
                          team-sunil.jpg, team-shradha.jpg, team-sunny.jpg
```
Older site versions and working files are archived under `Backups/archive-2026-06-27/`.
Source partner photos + Shradha's CV live in `partner Info/` (not deployed).

## Firm facts (keep accurate)
- Founded 1989 by CA. Sunil Kumar Lahoti. Now a partnership.
- Partners: **CA. Sunil Kumar Lahoti** (Founding Partner); **CA. Shradha Lahoti**
  (Partner — international & cross-border; ex-Deloitte / Wafra / Ocorian; US & Dutch GAAP, IFRS).
- Team: **Sunny Agarwal** (Compliance & Risk Advisor — financial crime / AML / digital assets,
  ex-Deloitte, Netherlands); **Shashank Lahoti** (SOP & audit specialist, not a CA).
- ~~Claims in use: 35+ years, 6 nations, 500+ clients, 20+ services~~ — **REMOVED July 2026 for
  ICAI compliance.** Do not reintroduce client counts, nation counts or attainment counters.
  Permitted stat particulars: year of establishment (1989), no. of partners (2), service pillars (6).
- Phone/WhatsApp: **+91 98855 80871 only** — the second India number (97012 05369) and the
  Amsterdam number were removed from the site in Aug 2026 at the user's request. Do not re-add.
- Email: skla@skla.in (primary), shashank@skla.in (secondary)
- Address: **7003, Emerald House, S D Road, Secunderabad, Telangana 500003**.
  Maps: https://www.google.com/maps/place/S+K+LAHOTI+ASSOCIATES/@17.4412474,78.4895492,17z
- LinkedIn: https://www.linkedin.com/company/132164358/  (numeric URL — set a vanity slug in
  LinkedIn admin when ready, then update it in every footer.)

## The 6 service pillars
1. Audit & Assurance  2. Direct, Indirect & International Tax
3. India Entry · FEMA/FDI (foreign investors)  4. NRI & Expatriate Services
5. Accounting & Outsourcing  6. Corporate Law & Business Advisory

## Income-tax Act, 2025 (effective 1 April 2026 — tax year 2026-27)
The site reflects the new Act alongside the familiar old references. Key mappings used:
44AB → **63** (tax audit); 197 → **395** (lower/nil TDS; Form 13 → **Form 128**);
195 / 194-series → **393**; 92E → **172** with Form 3CEB → **Form 48** (transfer pricing);
Forms 15CA/15CB → **145/146**. Full table: `insights-old-vs-new-section-numbers.html`.
Old numbers/forms still apply to periods up to 31 March 2026.

## Conventions
- Header/footer markup is duplicated across pages. Main nav (8 links): Home, About, Services,
  Industries, Team, Insights, Careers, Contact (Insights added Sep 2026; insights pages carry
  `class="active"` on it). The nav collapses to the hamburger at ≤1100px — its own media block
  in style-v2.css; page-layout breakpoints stay at 940px. If you change nav/footer, change ALL
  pages (incl. the 26 insights articles + insights-article-template.html).
- Footer carries: WhatsApp (wa.me/919885580871), LinkedIn, and the minimum ICAI
  no-solicitation line. Body copy keeps no solicitation disclaimers.
- Every page: one `<h1>`, full SEO head (title, meta description, canonical, OG/Twitter,
  geo tags) + JSON-LD (Organization/AccountingService, BreadcrumbList; services has ItemList;
  contact has LocalBusiness + FAQPage).
- Design is editorial: **Newsreader** (display serif) + **Inter** (body). Palette is
  ink-navy (--ink #0d1b2a), gold (--gold #b08423), warm paper (--paper #f7f9fb). All theming
  via CSS variables in `:root` at the top of `style-v2.css` — change colours there, not inline.
- Use real HTML entities (&mdash; &amp; &rsquo;) — avoid raw non-ASCII where possible.

## ICAI compliance (Code of Ethics, 13th ed., w.e.f. 1 Apr 2026)
Full study: `../ICAI-Website-Rules-Study.md`. Hard rules for ALL site copy:
- No taglines/slogans ("catch words"), no superlatives ("best/leading/most experienced"),
  no comparisons, no exaggerated claims [Ch 3.1.3 B/C/G].
- No client counts / nations-served counters; no fees ever; no testimonials/ratings;
  no awards or accreditations except Govt/regulator ones [Ch 3.1.3 E/F, 3.3.7(xiii)].
- No past-employer name-drops in bios (Deloitte etc.) — describe area of experience instead
  [Ch 3.1.3 F]. No firm logo — CA India logo only (current logo.svg IS the CA India logo).
- CTAs stay neutral ("Contact the firm"), never service-soliciting ("Discuss your audit
  needs") [Ch 3.3.14]. Never run ads/boosts driving traffic to the site [Ch 3.3.5];
  audit/attestation content must never be pushed outward (email/ads) [Ch 3.3.3-3.3.4].
- Compliance edits applied July 2026 in commit `b7e452b`.

## Deployment / launch
- **GitHub repo: https://github.com/ca-skla/skla-website** (account `ca-skla`, branch `main`,
  public). Netlify auto-deploys on push. Credentials are in Windows Credential Manager.
  **Canonical working clone: `C:\Users\shash\src\skla-website`** (non-OneDrive). The OneDrive folder
  `Desktop\Website\SKLA Website` is a derived mirror refreshed by `_pipeline/bin/sync-mirror.ps1`
  ("sync mirror") — never edit it directly, and never run git there.
- Host: **Netlify** (`netlify.toml`, `publish = "."`, 301 redirects from old WordPress URLs
  incl. /clientele/ → industries.html; forced 404 for `/_pipeline/*`, `/CLAUDE.md`, `/README.md`).
  `skla.in` DNS is pointed at Netlify. Nothing reaches the live site without a merge into `main`.
- `skla-site-final.zip` (Netlify drag-and-drop fallback) is rebuilt from the clone by `sync-mirror.ps1`;
  normal go-live is a merge into `main`.

## Insights pipeline (Sep 2026)
- `_pipeline/` holds everything the automation needs: `RUNBOOK.md` (the procedure — read it first),
  `config.yml` (kill switch `paused`, `mode: dry-run|live`), `BACKLOG.md`, `FACTS.md` (facts register —
  every figure on an insight page has a row with its primary instrument), `BULLETIN.md`, `COMPLIANCE.md`,
  `templates/`, `routines/PROMPT-*.md` (the cloud-routine prompts), `bin/` (lint + render scripts),
  `reviews/` (review packs, one per PR).
- Two cloud routines open pull requests: `skla-insight-draft` (1st & 15th, 07:00 IST — one new article)
  and `skla-law-watch` (8th monthly — re-verification, corrections, one thin-article expansion, bulletin).
  A partner reviews the PR (facts table + Netlify preview) and merges. Never auto-merge.
- Accuracy rule: no figure, date, form, section or judgment without a `FACTS.md` row citing the Act,
  rule, notification/circular (number + date), press note or court order actually read. Secondary sites
  are for discovery only. Unverifiable ⇒ removed. See RUNBOOK §6.
- Desktop-app commands that exist for this project: "sync mirror" (run `sync-mirror.ps1`), "publish PR #n"
  (merge locally with `--no-ff` and push), "apply the review comments on PR #n" (edit the branch, re-lint,
  push).
- Lint an article: `bash _pipeline/bin/check-article.sh <slug>`; site: `bash _pipeline/bin/check-site.sh <lane>`.

## TODO / open items (none block launch)
- **Activate the contact form:** it POSTs to FormSubmit (skla@skla.in). The first live
  submission triggers a confirmation email to skla@skla.in — click it once and all future
  enquiries arrive. Has honeypot + client-side validation.
- Set a LinkedIn vanity URL and swap it into the footers.
- Confirm Sunny Agarwal's title ("Compliance & Risk Advisor") and whether a "CA." prefix applies.
- Partner sign-off on the flagged article figures — now tracked as `unverified` rows in
  `_pipeline/FACTS.md` (§7 open items); cleared by the corrections pass and the monthly refresh.

## Note
This project once lived under OneDrive, where the sync layer occasionally truncated large file
writes and corrupted `.git`. The canonical tree is now the non-OneDrive clone above; the OneDrive copy is a
mirror. `check-site.sh` verifies every page still ends with `</html>` before any PR.
