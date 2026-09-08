## Summary
Monthly refresh, 8 September 2026 (first scheduled run of `skla-law-watch`). Scope was the 16 register rows still
`unverified` after the 5 September corrections pass; no `current` row was older than `reverify_after_days` (90) and
no article was 12 months old. Every row was read on a primary source through `WebFetch`: 12 confirmed and updated in
place, 3 superseded by corrected rows, 8 rows added (F-0204 to F-0211). Four articles corrected, three of them
receiving their first References block. One bulletin note. No thin-article expansion this month — the BACKLOG §D
schedule starts in October 2026 (row 1, `insights-nri-lower-tds-certificate.html`).

The material finding: `insights-gst-changes-2026.html` presented three rules as "January 2026" changes that in fact
date from 2023 (e-invoicing at &#8377;5 crore from 1 August 2023; the three-year return bar in force 1 October 2023;
bank-detail suspension from 4 August 2023). The article body, FAQ and JSON-LD now carry the real instruments and
dates; the `<h1>`/title were left as they are (the slug cannot change and the index card mirrors the title).
BACKLOG §D already suggests a 2027 successor for this piece.

## Changes
| article | change | instrument (number · date) | link | before → after | status | ☐ |
|---|---|---|---|---|---|---|
| gst-changes-2026 | e-invoicing threshold framed as a 2026 change → dated to its notification | Notification No. 10/2023–Central Tax · 10 May 2023 (w.e.f. 1 Aug 2023) | https://www.gstcouncil.gov.in/node/4365 | "has been lowered to ₹5 crore" (implied 2026) → "lowered … with effect from 1 August 2023" | ⚠ value confirmed on the GST Council's official listing line; the notification body itself was not readable (CBIC view-pdf robots-blocked) | ☐ |
| gst-changes-2026 | 30-day IRP reporting window stated for everyone → limited to AATO ≥ ₹10 crore, from 1 April 2025, hedged as "according to the e-invoice portal advisories" | e-invoice portal advisory · 27 Mar 2025 | https://einvoice6.gst.gov.in/content/revised-time-limit-for-e-invoice-reporting-for-businesses-with-aato-of-%E2%82%B910-crores-above/ | "businesses above the threshold must report … within 30 days" → "a business with aggregate turnover of ₹10 crore or more … within 30 days … since 1 April 2025" | ⚠ read on the IRIS IRP page (a GSTN-authorised IRP on gst.gov.in); the NIC advisory PDFs on einvoice1/einvoice2 timed out — reviewer to confirm on the portal (F-0207) | ☐ |
| gst-changes-2026 | "From 2026 … automatically suspended" → rule 10A / rule 21A(2A), Form GST REG-31, in force 4 August 2023; consequence of suspension re-sourced to rule 21A(3) | Notification No. 38/2023–Central Tax · 4 Aug 2023; CGST Rules rr. 10A, 21A | https://gstcouncil.gov.in/sites/default/files/2024-05/gst-ct-38-2023.pdf | "cannot file returns or generate e-way bills" → "may not make any taxable supply or issue a tax invoice (rule 21A(3))" | ✅ | ☐ |
| gst-changes-2026 | "From January 2026, GST returns older than three years … are time-barred" → ss.37(5), 39(11), 44(2), 52(15) CGST Act, in force 1 October 2023; portal enforcement mentioned without a date | Finance Act, 2023; Notification No. 28/2023–Central Tax · 31 Jul 2023 | https://taxinformation.cbic.gov.in/content/html/tax_repository/gst/acts/2017_CGST_act/active/chapter9/section37_v1.00.html | "From January 2026" → "in force from 1 October 2023 … the GST portal now enforces it" | ✅ statute; ⚠ GSTN advisory on the enforcement date (reported: July 2025 tax period) not readable — no date stated on site | ☐ |
| gst-changes-2026 | section 4 "automatic late fees … MFA mandatory across the portal" (no source) → one qualitative sentence on MFA "phased in by turnover band through portal advisories"; late-fee claim removed | GSTN advisory (Dec 2024) — not read | — | specific claims → qualitative | ⚠ F-0209 unverified; hedged | ☐ |
| gst-registration-2026 | thresholds "₹40 lakh goods / ₹20 lakh services; special-category ₹20 lakh / ₹10 lakh" → s.22: ₹20 lakh (₹10 lakh in Manipur, Mizoram, Nagaland, Tripura); ₹40 lakh only for exclusive suppliers of goods under Notification 10/2019, **not in Telangana**, Puducherry, Uttarakhand, Arunachal Pradesh, Meghalaya, Sikkim or the four ₹10 lakh states, nor for ice cream, pan masala, tobacco | CGST Act s.22; Notification No. 10/2019–Central Tax · 7 Mar 2019 (w.e.f. 1 Apr 2019) | https://gstcouncil.gov.in/sites/default/files/2024-05/notfctn-10-central-tax-english-2019.pdf | "₹40 lakh for goods" (unqualified) → "a Hyderabad trader registers at ₹20 lakh, the same as a service provider" | ✅ (body, callout, FAQ, JSON-LD, index-card blurb) | ☐ |
| gst-registration-2026 | "usually within about a week" sourced to rule 9 (7 working days; 30 days with physical verification); bank-details suspension sourced to rr. 10A / 21A(2A) | CGST Rules r. 9; Notification No. 38/2023–Central Tax | https://taxinformation.cbic.gov.in/content/html/tax_repository/gst/rules/cgst_rules/active/chapter3/rule9_v1.00.html | unsourced → sourced, same meaning | ✅ | ☐ |
| subsidiary-vs-branch-vs-liaison | prior-RBI-approval cases "applicants from countries sharing a land border with India, NGOs, and sensitive sectors" → regulation 5 list: Pakistan (all cases); Bangladesh, Sri Lanka, Afghanistan, Iran, China, Hong Kong, Macau **only for an office in J&K, the North-East or Andaman & Nicobar**; NGO/NPO/foreign government body; defence, telecom, private security, information & broadcasting. Form FNC named. | FEMA 22(R)/2016-RB · 31 Mar 2016 (amended to 21 Jan 2019), reg. 5 | https://www.rbi.org.in/scripts/BS_FemaNotifications.aspx?Id=10327 | "land border" test (not in the regulation; Nepal/Bhutan are not listed) → the regulation's own list | ✅ (body, FAQ, JSON-LD) | ☐ |
| subsidiary-vs-branch-vs-liaison | liaison-office activities re-worded to the regulation ("may not undertake any commercial, trading or industrial activity, directly or indirectly"; expenses "through normal banking channels") | FEMA 22(R)/2016-RB reg. 2; RBI Master Direction 10/2015-16 (updated 18 May 2021) | https://www.rbi.org.in/scripts/BS_ViewMasDirections.aspx?id=10404 | "cannot earn a single rupee" → regulation wording | ✅ | ☐ |
| subsidiary-vs-branch-vs-liaison | foreign-company paragraph: "reduced from 40% by the Finance (No. 2) Act, 2024" removed (not read this run); "For tax year 2026-27 the base rate is 35%" | Finance Act, 2026 s.3; Memorandum to the Finance Bill 2026; CBDT tax-rates page | https://www.incometaxindia.gov.in/documents/d/guest/finance-act-2026-pdf-1 | history clause dropped; rates unchanged (22%+10%+4%; 35%+2%/5%+4%) | ⚠ 35% rests on the Memorandum and the CBDT table — the First Schedule of FA 2026 could not be read (PDFs truncate) (F-0061) | ☐ |
| dpiit-startup-recognition | "Angel tax … was abolished for all investor classes from FY 2025-26" → "does not apply to share issues on or after 1 April 2025, by the Finance (No. 2) Act, 2024" (AY 2025-26; the site was a year late) | Finance (No. 2) Act, 2024 (15 of 2024), s.23 · 16 Aug 2024 | https://egazette.gov.in/WriteReadData/2024/256436.pdf | "from FY 2025-26" → "on or after 1 April 2025" | ✅ (body, FAQ, JSON-LD, References) | ☐ |

## Re-verified facts (no text change)
| fact id | article | value | instrument | link | verified |
|---|---|---|---|---|---|
| F-0005 | old-vs-new-section-numbers | ss.44AD/44ADA/44AE → one s.58 (table in s.58(2)); ₹2 cr/₹3 cr; ₹50 lakh/₹75 lakh; ≤ 10 goods carriages | Income-tax Act, 2025, s.58 | https://www.incometaxindia.gov.in/w/section-58-138 | 2026-09-08 ✅ |
| F-0044 | capital-gains-new-act; nri-inherited-property; nri-lower-tds-certificate | 12 months listed securities / equity-oriented fund units (also UTI units, zero-coupon bonds); 24 months everything else | Income-tax Act, 2025, s.2(101); Finance (No. 2) Act, 2024, s.3(b) | https://www.incometaxindia.gov.in/documents/d/guest/income_tax_act_2025_as_amended_by_fa_act_2026-pdf | 2026-09-08 ✅ |
| F-0061 | subsidiary-vs-branch-vs-liaison; pvt-ltd-vs-llp-vs-proprietorship | 22% + 10% + 4% ≈ 25.17%; foreign company 35% + 2%/5% + 4% ≈ 36.4–38.22% | Finance Act, 2026, s.3; Memorandum; CBDT tax rates | https://www.incometaxindia.gov.in/w/tax-rates%E2%80%8B | 2026-09-08 ✅ (35% ⚠ see above) |
| F-0066 | nri-dtaa-claim; nri-taxation-new-act | Form 41 (earlier 10F) filed only online, with the TRC uploaded; rule 75(1) | CBDT Form 41 FAQs; DGIT(S) Notification No. 03/2022 (16 Jul 2022) via DGIT(S) letter of 28 Mar 2023 | https://www.incometaxindia.gov.in/documents/d/guest/form-41-faqs | 2026-09-08 ✅ (rule 75 text not read — FAQ is explanatory) |
| F-0067 | nri-repatriation-15ca-15cb; new-act-tds-changes; old-vs-new; nri-taxation-new-act | 15CA/15CB filed for remittances before 1 April 2026 remain valid; Forms 145/146 thereafter | Income-tax Act, 2025, s.536(2)(a)–(b); CBDT transition FAQs Q4.24–4.25 | https://www.incometaxindia.gov.in/w/section-536-1 | 2026-09-08 ✅ |
| F-0080 | gst-registration-2026 | ₹20 lakh; ₹10 lakh in Manipur, Mizoram, Nagaland, Tripura | CGST Act s.22 (as amended 1 Feb 2019) | https://taxinformation.cbic.gov.in/content/html/tax_repository/gst/acts/2017_CGST_act/active/chapter6/section22_v1.00.html | 2026-09-08 ✅ |
| F-0085 | (not on site) | 5% / 18% / 40% from 22 Sep 2025 (28% schedule retained for deferred tobacco items); Notification 01/2026-CT(R), 30 Apr 2026, moved beverage entries only | Notification No. 9/2025-Integrated Tax (Rate), 17 Sep 2025; PIB 3 Sep 2025 | https://www.pib.gov.in/PressReleasePage.aspx?PRID=2163555&reg=48&lang=2 | 2026-09-08 ✅ (CGST(R) twin not read) |
| F-0086 | gst-registration-2026 | 7 working days; 30 days with physical verification | CGST Rules r. 9 | https://taxinformation.cbic.gov.in/content/html/tax_repository/gst/rules/cgst_rules/active/chapter3/rule9_v1.00.html | 2026-09-08 ✅ |
| F-0106 | fdi-automatic-approval-route | telecom 100% automatic; marketplace e-commerce 100% automatic; defence 74% automatic for new licences | DPIIT PN 4 (2021 Series) 6 Oct 2021; PN 2 (2018 Series) 26 Dec 2018; PN 4 (2020 Series) | https://www.dpiit.gov.in/static/uploads/2025/07/ac023f4ea2330b3a29be1b999dabf826.pdf | 2026-09-08 ✅ (PN 4 (2020) date line illegible; PIB 18 Sep 2020) |
| F-0108 | subsidiary-vs-branch-vs-liaison | Form FNC to an AD Category-I bank; LO no commercial activity; expenses from inward remittances | FEMA 22(R)/2016-RB regs. 2, 4; Master Direction 10/2015-16 | https://www.rbi.org.in/scripts/BS_FemaNotifications.aspx?Id=10327 | 2026-09-08 ✅ |
| F-0109 (spot check) | foreign-subsidiary-india; fc-gpr-filing | RBI Master Direction — Foreign Investment in India still "Updated as on June 15, 2026" | — | https://www.rbi.org.in/scripts/bs_viewmasdirections.aspx?id=11200 | 2026-09-08 ✅ (no re-issue after 15 Jun 2026) |

Rows now `unverified` (⚠ for the reviewer): **F-0207** (30-day IRP window — IRIS IRP page only), **F-0209** (MFA
bands — secondary only; site sentence is qualitative), **F-0211** (Press Note 3 (2026 Series) — PIB release only;
used for the bulletin note, not for any article).

## Watchlist (found, not actionable yet — no primary source or not in force)
- **DPIIT Press Note No. 3 (2026 Series)** (reported 23 Jul 2026) — inventory-based e-commerce permitted **for exports only**; the NDI Rules amendment is reported as S.O. 4870(E), 2 Sep 2026. PIB (5 Aug 2026) confirms the effect; the press-note PDF never surfaced in search (PROVENANCE) and the Gazette is robots-blocked. `insights-fdi-automatic-approval-route.html` still says "FDI cannot fund" the inventory model — **EDIT once the press note is read** (§7 item 16). Where to look: dpiit.gov.in → Press Notes (2026 Series); egazette.gov.in S.O. 4870(E).
- **MCA General Circular No. 04/2026, 31 Aug 2026** — Companies Compliance Facilitation Scheme, 2026 extended to 15 September 2026 (secondary only; mca.gov.in returns 403 to the fetcher). Reviewer may confirm on the MCA circulars page; too short-lived for a bulletin note by the time this PR merges.
- **GST rule 14A simplified registration** (reported Notification No. 18/2025-Central Tax, 31 Oct 2025: 3 working days, output tax ≤ ₹2.5 lakh/month) — not on any primary domain reachable this run; nothing stated on site.
- **57th GST Council meeting reported for 12 September 2026** (secondary). NEW-item candidate for the 15 September draft run if a rate/procedure package is notified.
- **Draft FEMA (Foreign Investment) Rules, 2026** (RBI press release 2026-2027/726, 21 Jul 2026; comments to 31 Aug 2026) — draft, not in force; bulletin at most once read on rbi.org.in.
- **CBDT Notifications 116/2026 and 117/2026, 25 Aug 2026** (s.10(46A) exemptions — reported on a secondary site; out of scope). No Circular after 6/2026 found.
- **A.P. (DIR Series) Circular No. 20, 2 Sep 2026** — accounts of non-resident banks (AD-bank reporting); not client-relevant; ignored.
- Finance Act, 2026 First Schedule (foreign-company 35%) and the repeal-and-savings rule of the Income-tax Rules, 2026 — not readable this run (§7 items 17–18).

NEW items for the draft lane: none in the 5–8 September window. Q-00 (FAST-DS) is already in review as PR #1.

## Bulletin notes added
2026-08-05 · investor · "DPIIT Press Note No. 3 (2026 Series) amends the FDI policy to permit inventory-based e-commerce operations exclusively for exports; the DGFT has operationalised the export framework under the Foreign Trade Policy 2023 through Notification No. 27/2026-27 and Public Notice No. 25/2026-27, both dated 5 August 2026 …" · PIB release, Ministry of Commerce & Industry, 5 Aug 2026 (⚠ F-0211 — PIB is explanatory; reviewer may prefer to hold this note until the press note is read). The 20 March 2026 note on the 2026 Rules drops off the page (6-item cap) and stays in BULLETIN.md.

## Self-check
```
== check-site: lane=refresh
ok    on branch refresh/2026-09
ok    diff audited (8 file(s))
ok    all 36 html files end with </html>
ok    sitemap has no duplicate <loc>
ok    sitemap envelope well-formed
ok    index/sitemap/article set consistent
ok    netlify shadows /_pipeline/
RESULT: 0 fail(s) — lane refresh
== check-article: insights-gst-changes-2026.html
RESULT: 0 fail(s), 0 warning(s) — insights-gst-changes-2026.html
== check-article: insights-gst-registration-2026.html
RESULT: 0 fail(s), 0 warning(s) — insights-gst-registration-2026.html
== check-article: insights-subsidiary-vs-branch-vs-liaison.html
WARN  <title> length 61 (> 60)
WARN  read time label 9 min vs ~2018 words (expected ~13 min)
RESULT: 0 fail(s), 2 warning(s) — insights-subsidiary-vs-branch-vs-liaison.html
== check-article: insights-dpiit-startup-recognition.html
WARN  <title> length 68 (> 60)
WARN  meta description length 169 (target 150–160)
WARN  read time label 7 min vs ~1541 words (expected ~10 min)
RESULT: 0 fail(s), 3 warning(s) — insights-dpiit-startup-recognition.html
```
(The warnings pre-date this run. Read-time labels are mirrored on index and related cards, which this lane may not
edit; a human PR can re-stamp them.)

## Preview
Deploy preview: https://deploy-preview-<PR#>--skla-associates.netlify.app — /insights.html, /insights-gst-changes-2026.html,
/insights-gst-registration-2026.html, /insights-subsidiary-vs-branch-vs-liaison.html, /insights-dpiit-startup-recognition.html

## Files changed
`insights-gst-changes-2026.html` · `insights-gst-registration-2026.html` · `insights-subsidiary-vs-branch-vs-liaison.html` ·
`insights-dpiit-startup-recognition.html` · `insights.html` (bulletin block; one card blurb) · `sitemap.xml` (5 lastmods) ·
`_pipeline/FACTS.md` · `_pipeline/BULLETIN.md` · `_pipeline/reviews/refresh-2026-09.md`

## Sources scanned (window 2026-09-05 → 2026-09-08)
Readable: incometax.gov.in Latest Updates (newest item 1 Sep 2026: Notification 114/2026); icai.org announcements (to 2 Sep); pib.gov.in
all-releases 1–8 Sep (no MoF/MCA instrument); rbi.org.in press releases, A.P. (DIR Series) index, FEMA notifications, Master Directions;
gstcouncil.gov.in press releases ("No Data Found", page updated 7 Sep); cbic-gst.gov.in What's New (stale, 9 Jul); dpiit.gov.in press-note
PDFs (2025–2026 series). Not readable: incometaxindia.gov.in notifications / circulars / what's-new / press-release (script-rendered);
mca.gov.in (all four pages 403); egazette.gov.in (home stale; PDFs robots-blocked); gst.gov.in News & Updates (script-rendered);
cbic.gov.in view-sticker and taxinformation.cbic.gov.in view-pdf (robots/JS); einvoice1/einvoice2.gst.gov.in advisory PDFs (timeouts).
Nothing dated 5–8 September 2026 required a site change.

## How to publish
Confirm every ⚠ row → Merge pull request (squash). Netlify deploys `main` automatically. Independent of PR #1 (different files).
