# BACKLOG.md — Insights backlog, state and publication log

Machine-read by the routines. Humans may reorder or add rows in §A at any time (GitHub web editor is fine); the
routines only change `status`, `PR` and dates. See RUNBOOK §4.3 and §7.

## State
```
last_run: 2026-09-05 (corrections pass, interactive)
last_scanned: 2026-09-05
next_audience: business        # rotation: nri -> investor -> business -> nri
featured_slug: insights-income-tax-act-2025-vs-1961.html
pillars_live: none
```

## A. Backlog (ordered)
Take the first `queued`, unblocked row matching `next_audience`; one seasonal override per run when another
row's `publish_by` is within 30 days. `audience` = nri | investor | business | newact (primary first).
`push` = may the piece be distributed outward later (`no` for audit/attestation subjects, ICAI Ch. 3.3.3–3.3.4).
`status` = queued | in-review (PR #) | parked (reason) | published (moved to §B).

| # | id | working title | audience | type | pillar | brief / source | service | words | publish_by | blocked_by | push | status | PR | dates |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0 | Q-00 | The Foreign Assets of Small Taxpayers Disclosure Scheme, 2026: who can use the window before 31 December 2026 | nri newact | Update | A | reactive: Finance Act 2026 Ch. IV; Rules G.S.R. 732(E), 14 Aug 2026 (FACTS F-0201) | nri | 900–1,400 | 2026-09-20 | — | yes | queued | | material NEW item found by the corrections pass, 2026-09-05 |
| 1 | Q-01 | ROC annual compliance: AGM, AOC-4, MGT-7, DIR-3 KYC, ADT-1 — what every company files each year | business | Reference | D | STRATEGY Pillar D ("ROC annual compliance"); MCA-filings gap | advisory | 1,500–1,800 | 2026-09-20 | — | yes | queued | | |
| 2 | Q-02 | How an NRI files an income-tax return in India (and when one is required) | nri | How-to | A | STRATEGY Pillar A; Week 8 | nri | 1,800–2,200 | — | — | yes | queued | | |
| 3 | Q-03 | Transfer pricing in India: who it applies to, Form 48 (earlier Form 3CEB) and the report deadline | investor | Guide | E | STRATEGY Pillar E | tax | 1,800–2,200 | 2026-10-15 | — | yes | queued | | |
| 4 | Q-04 | Income-tax return deadlines for companies, LLPs and firms | business | Reference | C | STRATEGY Pillar C; Week 8 | tax | 1,200–1,600 | 2026-10-15 | — | yes | queued | | |
| 5 | Q-05 | Repatriating profits out of India: dividends, royalties and the tax on each | investor | Guide | B | STRATEGY Pillar B; Week 11 | fema | 1,800–2,200 | — | — | yes | queued | | |
| 6 | Q-06 | Advance tax: instalment dates, the 15/45/75/100 % ladder and interest for shortfall | business | Reference | C | service-pillar gap (tax) | tax | 1,200–1,500 | 2026-12-01 | — | yes | queued | | |
| 7 | Q-07 | NRI tax guide for residents of the UAE | nri | Guide | A | STRATEGY "country-specific NRI guides"; builds on Brief 5 | nri | 1,600–2,000 | — | — | yes | queued | | |
| 8 | Q-08 | Permanent establishment risk in India for foreign companies | investor | Guide | E | STRATEGY Pillar E | tax | 1,600–2,000 | — | — | yes | queued | | |
| 9 | Q-09 | TDS and TCS compliance calendar for a small business: monthly deposits, quarterly statements, certificates | business | Reference | C | STRATEGY Pillar C; Week 10 | tax | 1,400–1,800 | 2027-01-15 | — | yes | queued | | |
| 10 | Q-10 | NRI tax guide for residents of the United States | nri | Guide | A | as Q-07 | nri | 1,600–2,000 | — | — | yes | queued | | |
| 11 | Q-11 | DTAA and treaty benefits for cross-border businesses | investor | Guide | E | STRATEGY Pillar E | tax | 1,600–2,000 | — | — | yes | queued | | |
| 12 | Q-12 | Input Tax Credit: claiming it, reconciling it, the common traps | business | Guide | C | STRATEGY queue #18 | tax | 1,500–1,800 | 2027-03-15 | — | yes | queued | | |
| 13 | Q-13 | NRI tax guide for residents of the United Kingdom | nri | Guide | A | as Q-07 | nri | 1,600–2,000 | — | — | yes | queued | | |
| 14 | Q-14 | ESOPs for Indian startups: how founders structure them | business investor | Guide | D | STRATEGY Pillar D | advisory | 1,600–2,000 | — | — | yes | queued | | |
| 15 | Q-15 | PF and ESI for a small employer: registration thresholds and monthly compliance | business | Guide | C | service-pillar gap (accounting / payroll) | accounting | 1,400–1,800 | — | — | yes | queued | | |
| 16 | Q-16 | Books of account and record-keeping: what the Companies Act and section 62 (earlier 44AA) require | business | Explainer | C | service-pillar gap (accounting / outsourcing) | accounting | 1,200–1,600 | — | — | yes | queued | | |
| 17 | Q-17 | Statutory audit applicability for private companies and the auditor-appointment process | business | Explainer | — | service-pillar gap (audit) — informational only | audit | 1,200–1,600 | — | — | no | queued | | |
| 18 | Q-P-A | PILLAR A — NRI tax and property in India | nri | Pillar guide | A | BRIEFS "Pillars"; links down to Briefs 1–6 + Q-02 + one of Q-07/10/13 | nri | 2,500–4,000 | — | Q-02, Q-07 | yes | queued | | |
| 19 | Q-P-B | PILLAR B — Setting up and running a business in India | investor | Pillar guide | B | Briefs 7–12 + Q-05 | fema | 2,500–4,000 | — | Q-05 | yes | queued | | |
| 20 | Q-P-C | PILLAR C — GST and tax compliance for Indian businesses | business | Pillar guide | C | Briefs 13, 14, 16 + Q-04, Q-09, Q-12 | tax | 2,500–4,000 | — | Q-04, Q-09, Q-12 | yes | queued | | |
| 21 | Q-P-D | PILLAR D — Starting and structuring a company in India | business | Pillar guide | D | Briefs 15, 17, 18 + Q-01, Q-14 | advisory | 2,500–4,000 | — | Q-01, Q-14 | yes | queued | | |
| 22 | Q-P-E | PILLAR E — International tax and transfer pricing | investor | Pillar guide | E | Brief 5 + Q-03, Q-08, Q-11 | tax | 2,500–4,000 | — | Q-03, Q-08, Q-11 | yes | queued | | |

Seasonal notes (verify each date against its instrument before relying on it): Q-01 before the 30 Sep
AGM / DIR-3 KYC window · Q-03 before the transfer-pricing report date · Q-04 before the audit-case ITR date ·
Q-06 before the 15 Dec instalment · Q-09 before the Q3 TDS statement · Q-12 before year-end ITC reconciliation.
Rotation starts at `business` because Q-01 is the most time-critical topic for the 15 Sep run.

## B. Published log (newest first)
| date | slug | title | audience | type | source | PR | reviewer |
|---|---|---|---|---|---|---|---|
| 2026-06-15 | insights-nri-tds-property-sale.html | TDS on Sale of Property by an NRI: The Full 2026 Guide | nri | Guide | Brief 2 | pre-pipeline | Sunil |
| 2026-06-15 | insights-nri-repatriation-15ca-15cb.html | Repatriating Money from India: Forms 145/146, NRO/NRE Limits, USD 1 Million Scheme | nri | How-to | Brief 3 | pre-pipeline | Sunil |
| 2026-06-15 | insights-nri-residential-status-rnor.html | NRI Residential Status & RNOR Explained: the 2026 Day-Count Rules | nri | Guide | Brief 4 | pre-pipeline | Sunil |
| 2026-06-15 | insights-nri-dtaa-claim.html | DTAA for NRIs: How to Actually Claim It (Form 10F + TRC) | nri | How-to | Brief 5 | pre-pipeline | Sunil |
| 2026-06-15 | insights-nri-inherited-property.html | Selling Inherited Property in India as an NRI | nri | Guide | Brief 6 | pre-pipeline | Sunil |
| 2026-06-13 | insights-income-tax-act-2025-vs-1961.html | The Income-tax Act 2025 vs the 1961 Act: What Actually Changed | newact | Pillar guide | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-old-vs-new-section-numbers.html | Old vs New Section Numbers Under the Income-tax Act 2025 | newact | Reference | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-tax-year-explained.html | The "Tax Year": How the New Act Ends PY/AY Confusion | newact | Explainer | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-first-itr-under-new-act.html | Filing Your First Return Under the Income-tax Act 2025 | newact | Guide | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-capital-gains-new-act.html | Capital Gains Under the Income-tax Act 2025 | business newact | Guide | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-new-act-for-businesses.html | What the Income-tax Act 2025 Means for Your Business | business newact | Guide | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-new-act-tds-changes.html | TDS Under the Income-tax Act 2025: New Section Numbers, New Forms | business newact | Update | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-tax-audit-44ab.html | Tax Audit in 2026: Section 63 (earlier 44AB) | business | Guide | Brief 16 | pre-pipeline | Sunil |
| 2026-06-13 | insights-dpiit-startup-recognition.html | DPIIT / Startup India Recognition: Benefits & How to Apply (2026) | business | Guide | Brief 18 | pre-pipeline | Sunil |
| 2026-06-13 | insights-company-incorporation-india.html | Company Incorporation in India: Process, Cost, Timeline (2026) | business investor | Guide | Brief 17 | pre-pipeline | Sunil |
| 2026-06-13 | insights-nri-taxation-new-act.html | NRI Taxation Under the Income-tax Act 2025 | nri newact | Guide | new-Act series | pre-pipeline | Sunil |
| 2026-06-13 | insights-fdi-automatic-approval-route.html | FDI in India: Automatic vs Approval Route & Sector Caps (2026) | investor | Guide | Brief 11 | pre-pipeline | Sunil |
| 2026-06-13 | insights-fla-return-rbi.html | FLA Return to RBI: Who Files, the July 15 Deadline, Dormant Companies | investor | How-to | Brief 10 | pre-pipeline | Sunil |
| 2026-06-13 | insights-subsidiary-vs-branch-vs-liaison.html | Subsidiary vs Branch vs Liaison Office in India | investor | Comparison | Brief 9 | pre-pipeline | Sunil |
| 2026-06-13 | insights-resident-director-requirement.html | The Resident-Director Requirement | investor | Guide | Brief 12 | pre-pipeline | Sunil |
| 2026-06-08 | insights-gst-changes-2026.html | What Changed in GST from January 2026 | business | Update | Brief 14 | pre-pipeline | Shradha |
| 2026-06-08 | insights-gst-registration-2026.html | GST Registration in 2026: Who Must Register & New Rules | business | Guide | Brief 13 | pre-pipeline | Sunil |
| 2026-06-08 | insights-pvt-ltd-vs-llp-vs-proprietorship.html | Private Limited vs LLP vs Proprietorship: How to Choose | business | Comparison | Brief 15 | pre-pipeline | Sunil |
| 2026-06-08 | insights-nri-lower-tds-certificate.html | Lower / NIL TDS Certificate for NRIs Selling Property in India | nri | Guide | Brief 1 | pre-pipeline | Sunil |
| 2026-06-08 | insights-fc-gpr-filing.html | FC-GPR Filing: Documents, Deadline & Valuation | investor | How-to | Brief 8 | pre-pipeline | Sunil |
| 2026-06-08 | insights-foreign-subsidiary-india.html | How a Foreign Company Opens a Subsidiary in India | investor | How-to | Brief 7 | pre-pipeline | Sunil |

## C. Parked / rejected (do not re-propose without a reason change)
| id | title | reason | date |
|---|---|---|---|

## D. Thin-article expansion schedule (refresh lane; one per month, RUNBOOK §5.4)
Prose word counts measured 2026-09-05; target = the type's range in RUNBOOK §8. Read-time label corrected with
the expansion.

| order | slug | words now | claimed read time | target | month | status |
|---|---|---|---|---|---|---|
| 1 | insights-nri-lower-tds-certificate.html | 704 | 8 min | 1,500–1,800 | 2026-10 | queued |
| 2 | insights-gst-registration-2026.html | 376 | 7 min | 1,500–1,800 | 2026-11 | queued |
| 3 | insights-foreign-subsidiary-india.html | 466 | 9 min | 1,800–2,500 | 2026-12 | queued |
| 4 | insights-fc-gpr-filing.html | 456 | 7 min | 1,800–2,500 | 2027-01 | queued |
| 5 | insights-pvt-ltd-vs-llp-vs-proprietorship.html | 458 | 7 min | 1,600–1,800 | 2027-02 | queued |
| 6 | insights-gst-changes-2026.html | 386 | 6 min | 900–1,400 (Update; consider a 2027 successor instead) | 2027-03 | queued |
