## Summary
Corrections pass across the Insights section, done interactively on 5 September 2026 (the first `refresh/` PR;
the routines take over from here). Every changed figure was read on its primary instrument — the Income-tax Act
2025 (Gazette), the Income-tax Rules 2026 and CBDT's own form-mapping table, the Finance Act 2026 (Gazette), the
Finance (No. 2) Act 2024 (Gazette), CBDT's Tax Reference Tables and Rule 220, FEMA 395/2019-RB, RBI's FLA FAQs
(1 July 2026) and LSF circular, FEMA 13(R)/2016-RB, DPIIT G.S.R. 108(E) and Press Notes 1 and 2 (2026 Series),
Companies Act sections 4 and 149 (India Code), and the ICAI tax-audit Guidelines 2025 (Gazette). 21 articles
touched; 20 References blocks added; 59 register rows verified; 6 bulletin notes; 15 rows left `unverified` for the
monthly run. Stacked on `chore/pipeline-bootstrap` (merge that first; GitHub retargets this PR automatically).

## Changes — errors corrected (what the site said → what the source says)
| article | change | instrument | link | status |
|---|---|---|---|---|
| lower-tds-certificate | "buyer needs a TAN until 30 Sep 2026; PAN-based mechanism from 1 Oct 2026" → from 1 Oct 2026 no TAN only for **resident individual/HUF** buyers (companies/firms still need one; no PAN challan procedure prescribed yet) | Finance Act 2026 s.87 (substituting s.397(1)(c)); Memorandum cl. 75 | [Gazette 271439](https://egazette.gov.in/WriteReadData/2026/271439.pdf) | ✅ |
| lower-tds-certificate; nri-tds-property-sale; new-act-tds-changes; nri-taxation-new-act; old-vs-new | NRI-seller deductions cited as "s.393(2)/(3)" or "s.195" → **s.393(2), Table Sl. No. 17** (s.393(3) is payments to any person) | Income-tax Act 2025 s.393; CBDT TDS Rates table | [Act](https://www.incometaxindia.gov.in/income-tax-act-2025) · [Tables](https://www.incometaxindia.gov.in/income-tax-act-20251) | ✅ |
| lower-tds-certificate; nri-tds-property-sale | "buyer files Form 27Q" → **Form 144 (earlier 27Q)**; Form 141 only for resident sellers; Form 128 filed "online" (TRACES claim removed as unverified) | Rules 2026 — CBDT forms table ("144 ← 27Q."; "141 ← 26QB…"; "128 ← 13") | [forms table](https://www.incometaxindia.gov.in/faqs-and-guidance-notes-on-forms-as-per-income-tax-rules-2026) | ✅ |
| lower-tds-certificate | worked example "12.5% of ₹1.5 crore ≈ ₹18.75 lakh" → **14.95% ≈ ₹22.4 lakh** (surcharge 15% above ₹1 crore + 4% cess); STCG "slab rate ~30%" → "any other income" 30% + surcharge + cess | FA 2026 First Schedule Pt I-B Para F, s.3(15); CBDT Tax Rates note (1); TDS Rates row (l) | [Gazette 271439](https://egazette.gov.in/WriteReadData/2026/271439.pdf) | ✅ |
| nri-dtaa-claim; nri-taxation-new-act; new-act-tds-changes; old-vs-new; repatriation; residential-status | "Form 10F → **Form 42**" → **Form 41** (Form 42 = application for certificate of residence, earlier 10FA; Form 43 = certificate, earlier 10FB) | CBDT forms table: "41 ← 10F", "42 ← 10FA", "43 ← 10FB" | [forms table](https://www.incometaxindia.gov.in/faqs-and-guidance-notes-on-forms-as-per-income-tax-rules-2026) | ✅ |
| nri-dtaa-claim | "most treaties cap dividends at 5–15%" → UAE 10%; UK 10%/15%; **US 25% for an individual shareholder** (15% only for a ≥10% corporate holder) — above India's 20%+ domestic rate; interest rates added | CBDT "Withholding tax rates" (treaty) and "TDS Rates" tables | [Tables](https://www.incometaxindia.gov.in/income-tax-act-20251) | ✅ |
| fla-return-rbi | "revised return by 30 September" → revise after audit **with RBI approval on FLAIR, no fixed date**; wrong-season "15 July deadline is already close" removed; LSF ₹7,500 sourced | FEMA 395/2019-RB reg. 4(2); RBI FLA FAQs (updated 1 Jul 2026) Q6/Q35; A.P. (DIR Series) Cir. 16/2022 | [FAQ](https://www.rbi.org.in/commonman/english/scripts/FAQs.aspx?Id=1171) · [LSF](https://rbi.org.in/Scripts/NotificationUser.aspx?Id=12393&Mode=0) | ✅ |
| tax-audit-44ab | "profession ₹50 lakh, raised to **₹75 lakh** with the cash test" → ₹50 lakh; no ₹75 lakh threshold in s.63 (that figure belongs to the presumptive scheme) | Income-tax Act 2025 s.63 (Gazette) | [Gazette 265620](https://egazette.gov.in/WriteReadData/2025/265620.pdf) | ✅ |
| tax-audit-44ab; first-itr; old-vs-new; new-act-tds-changes | "new-Act audit report forms not yet notified" → **Form 26** replaces Forms 3CA/3CB/3CD for tax year 2026-27 audits | Rules 2026, Form 26 (rule 47) | [forms table](https://www.incometaxindia.gov.in/faqs-and-guidance-notes-on-forms-as-per-income-tax-rules-2026) | ✅ |
| tax-audit-44ab | "ICAI capped tax audits at 60 per partner from FY 2026-27" → cited to the Guidelines (in force 1 Apr 2026; presumptive-case audits excluded; no pooling) | CA (Limit on Number of Tax Audits) Guidelines 2025, 25 Jul 2025 | [Gazette (ICAI)](https://resource.cdn.icai.org/87307dtc-aps1799-gazette-notification.pdf) | ✅ |
| first-itr; new-act-for-businesses; income-tax-act pillar; old-vs-new | "updated return: **s.267**, 48 months" → window is **s.263(6)**; s.267 = additional tax | Income-tax Act 2025 ss.263(6), 267 (Gazette) | [Gazette 265620](https://egazette.gov.in/WriteReadData/2025/265620.pdf) | ✅ |
| first-itr; new-act-for-businesses; tax-audit; nri-taxation; nri-tds-property-sale | "31 July 2026" stated as a live deadline → past (belated to 31 Dec 2026); 31 Oct / 30 Nov 2026 still statutory; **no CBDT extension as of 5 Sep 2026** (2025 precedent noted) | s.139(1) 1961 Act; s.263 table; CBDT circulars 1–6/2026 | [Circulars](https://www.incometaxindia.gov.in/circulars) | ✅ |
| first-itr; old-vs-new | "ITR forms for 2027 yet to be notified — we will update" → AY 2026-27 continues ITR-1–7 (+ITR-U); new-Act return forms not notified as at 5 Sep 2026 (stated as fact, promise removed) | CBDT Income Tax Returns (2026) | [ITR forms](https://www.incometaxindia.gov.in/income-tax-returns) | ✅ |
| income-tax-act pillar | "536 sections" → 536 as enacted; **553** in CBDT's consolidated text as amended by the Finance Act 2026; "Budget 2026 already does" → Finance Act 2026 (assent 30 Mar 2026) | Gazette 265620 (s.536); CBDT Act browser | [Act browser](https://www.incometaxindia.gov.in/income-tax-act-2025) | ✅ |
| fdi-automatic-approval-route | insurance 100% "effective February 2026" → **Press Note 1 (2026 Series), 9 Feb 2026, effective from the FEMA notification**; "Press Note 3 of 2020 still in force" → restated by **Press Note 2 (2026 Series), 15 Mar 2026** (PMLA-based beneficial-owner test; reporting route) | DPIIT PN1, PN2 (2026) | [PN1](https://www.dpiit.gov.in/static/uploads/2026/02/4eddf849f19d658e3a74dc32d344b5f9.pdf) · [PN2](https://www.dpiit.gov.in/static/uploads/2026/03/b9da5830b052c2f2d788593e97d07c63.pdf) | ✅ |
| dpiit-startup-recognition | "DPIIT notification of 4 February 2026" → **G.S.R. 108(E)**, in supersession of G.S.R. 127(E) (2019); ₹200 crore / cooperatives / deep-tech confirmed on the Gazette text | DPIIT G.S.R. 108(E), 4 Feb 2026 | [Gazette copy](https://www.dpiit.gov.in/static/uploads/2026/02/119e52e2a36f652215a32c3ccc5f9c66.pdf) | ✅ |
| company-incorporation | "name reservation ₹1,000" → figure removed (not verified); nil fee ≤ ₹15 lakh cited to rule 38(2) (w.e.f. 18 Mar 2019) | Companies (Incorporation) Second Amendment Rules 2019, G.S.R. 180(E) | [India Code](https://indiacode.gov.in/server/api/core/bitstreams/6ff2ef4d-d47c-4bc1-a2c9-1a5391d468f3/content) | ✅ |
| resident-director | "unchanged as of mid-2026" → s.149(3) as substituted by Act 1 of 2018 w.e.f. 7 May 2018, unamended (checked 5 Sep 2026) | Companies Act 2013 s.149(3) | [India Code](https://indiacode.gov.in/server/api/core/items/55edce91-640d-4de6-9124-7862d769011b) | ✅ |
| nri-repatriation | "NRIs and OCIs may remit USD 1 million" → regulation's terms (NRI or PIO); Form 146 threshold cited to rule 220 (Parts A–D of Form 145) | FEMA 13(R)/2016-RB reg. 4(2); Rules 2026 rule 220 | [FEMA 13(R)](https://www.rbi.org.in/Scripts/BS_FemaNotifications.aspx?Id=10326) · [Rule 220](https://www.incometaxindia.gov.in/w/rule-220-1) | ✅ |
| pvt-ltd-vs-llp | table cell "115BAA" → "section 200 of the 2025 Act, earlier 115BAA"; LLP 30% + 12% surcharge > ₹1 crore sourced | Act s.200; CBDT Tax Rates ("Partnership Firm") | [Tables](https://www.incometaxindia.gov.in/income-tax-act-20251) | ✅ |
| tax-year-explained; residential-status | worked examples set in "July 2026" → undated | — | — | ✅ |
| all 25 legacy articles | HTML entities inside JSON-LD (`&amp;`, `&mdash;`, `&#8377;`) → raw UTF-8 (JSON parsers do not decode entities) | — | — | ✅ |
| 6 thin articles + lower-tds | read-time labels recomputed (`max(4, round(words/160))`, References excluded) | — | — | ✅ |
| 20 articles | References block added ("Position stated as on 5 September 2026 · sources checked 5 September 2026"); `Updated September 2026`; `dateModified` and sitemap `lastmod` 2026-09-05 | — | — | ✅ |

## Re-verified with no text change (register rows now `current`)
Slabs of s.202(1), rebate s.156(2) ₹60,000/₹12 lakh, standard deduction s.19(1) ₹75,000 (Finance Act 2026 leaves
them unchanged); s.6 day-count rules; s.63 business thresholds; ss.82/85/86 (₹50 lakh bond cap); s.123 ₹1.5 lakh;
s.140 (2030 window); ss.196/197/198 rates and the s.197(3) cap for pre-23 July 2024 land/building; s.393(1) resident
property TDS (1%, ₹50 lakh, no TAN, Form 141); FC-GPR 30 days / FC-TRS 60 days; valuation certificate (CA / merchant
banker / cost accountant, ≤ 90 days); USD 1 million NRO limit; s.149(3); 20-day name reservation (s.4(5)(i)).

## ⚠ For the reviewer (hedged in the text; tick when confirmed)
| # | article | item | why | ☐ |
|---|---|---|---|---|
| 1 | fla-return-rbi (body + FAQ) | FEMA 1999 s.13 penalty figures (up to 3× the sum; ₹2 lakh if not quantifiable; daily amount for continuing contravention) | statute not re-read today; text now cites s.13 and drops the "₹5,000 per day" figure | ☐ |
| 2 | company-incorporation; foreign-subsidiary | "7–15 working days", "name approval 1–2 working days", DSC ₹1,500–3,000 | practice/market figures, not statutory; kept with "market rates" wording | ☐ |
| 3 | fdi-automatic-approval-route | effective dates of Press Notes 1 and 2 (2026) = the FEMA (Non-debt Instruments) Rules amendments — dates not verified | text says "effective from the corresponding FEMA notification" | ☐ |
| 4 | lower-tds; nri-tds-property-sale; new-act-tds-changes | deposit/statement procedure for TAN-less resident individual/HUF buyers after 1 Oct 2026 | not yet prescribed by CBDT (searched FA 2026, Memorandum, Rules 2026, 2026 notifications) — text says so | ☐ |
| 5 | gst-changes-2026; gst-registration-2026 | e-invoicing "lowered to ₹5 crore from January 2026", 30-day IRN, 3-year bar, thresholds | untouched this pass (expansion scheduled Nov 2026 / Mar 2027); register rows remain `unverified` | ☐ |
| 6 | subsidiary-vs-branch; foreign-subsidiary; fc-gpr | foreign-company 35% rate; FEMA 22(R) framework; FC-GPR LSF formula | untouched this pass; rows `unverified` for the monthly run | ☐ |

## Watchlist (not actionable yet)
- CBDT extension of the AY 2026-27 audit-case (31 Oct 2026) / TP (30 Nov 2026) dates — none as of 5 Sep 2026; 2025 precedent: Circulars 14/2025, 15/2025.
- Return forms under the Income-tax Rules 2026 for tax year 2026-27 — not notified.
- Rules for TAN-less deductors under s.397(1)(c)(iii) (from 1 Oct 2026).
- FEMA (NDI) Rules amendments giving effect to DPIIT Press Notes 1 and 2 (2026 Series).
- Income-tax (Amendment) Ordinance, 2026 (No. 2 of 2026, 5 Jun 2026) — Schedule IV exemptions (FIIs / BIS); not relevant to any article.
- FAST-DS 2026 window closes 31 Dec 2026 — reactive article queued as BACKLOG Q-00 for the 15 Sep run.

## Bulletin notes added (rendered on insights.html)
18 Aug 2026 verification of suspicious foreign remittances (press release) · 14 Aug 2026 FAST-DS rules and forms
(Notification 114/2026, G.S.R. 732(E)) · 2 Jul 2026 Circular 6/2026 (Form 10AB condonation) · 30 Mar 2026 Finance
Act 2026 — TAN relaxation from 1 Oct 2026 · 30 Mar 2026 Finance Act 2026 — slabs/rebate/standard deduction
unchanged · 20 Mar 2026 Income-tax Rules 2026 form renumbering.

## Self-check
`bash _pipeline/bin/check-article.sh` — 0 failures on all 27 article files (legacy warnings only: References
block missing on the 6 untouched articles; long `<title>` on a few). `bash _pipeline/bin/check-site.sh refresh` —
site integrity ok; the allowlist audit flags the bootstrap files because this branch stacks on
`chore/pipeline-bootstrap`; against that base the diff is the 21 articles, insights.html, sitemap.xml, the three
registers, plus two hand-maintained pipeline files (COMPLIANCE.md regex refinement; check-article.sh column fix).

## Preview
Netlify deploy preview: (appears on the PR once opened) — check `/insights.html` (bulletin panel) and
`/insights-nri-lower-tds-certificate.html`, `/insights-fla-return-rbi.html`, `/insights-nri-dtaa-claim.html`.

## How to publish
Merge `chore/pipeline-bootstrap` first, then confirm the ⚠ rows above and merge this PR (squash). Netlify deploys
`main`; then say "sync mirror" in the desktop app.
