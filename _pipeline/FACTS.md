# FACTS.md — facts register for the skla.in insight pages

Every figure, rate, threshold, date, form number, section number and judgment stated on an insight page has a
row here. Rules: RUNBOOK §6 and §10. `id` is permanent. `status` = current | unverified | disputed | superseded.
`verified` = the last date the value was read on the primary source by the pipeline (or the reviewer, noted in
`partner`). `used_in` = `file@F-####` (the element carries `data-fact="F-####"`).

**Seed note (2026-09-05):** rows below were carried over from the June 2026 facts sheet, whose sources were all
secondary (ClearTax, TaxGuru, EY alerts, press). They are therefore `unverified` until a primary instrument has
been read; the corrections pass (September 2026) verifies the P0/P1 rows first, the refresh lane clears the rest
(`reverify_after_days`). `used_in` lists the article(s) that state the value; `data-fact` markers are added as
each row is verified.

Columns: `| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class | status | used_in | notes |`

## 1. Renumbering map — Income-tax Act 2025 / Income-tax Rules 2026

Primary instruments to verify against: Income-tax Act, 2025 (assent 21 Aug 2025; in force 1 Apr 2026) — India
Code / incometaxindia.gov.in Act text; Income-tax Rules, 2026 — Notification No. 22/2026 [F. No. 370142/41/2025-TPL],
G.S.R. 198(E), 20 March 2026 (Gazette copy: search egazette.gov.in).

| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class | status | used_in | notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| F-0001 | Income-tax Act 2025 commencement | in force 1 April 2026; applies from tax year 2026-27 | all | Income-tax Act 2025, s.1(3) | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-income-tax-act-2025-vs-1961.html; insights-tax-year-explained.html; insights-first-itr-under-new-act.html | CBDT press release 1 Apr 2026 exists (incometaxindia.gov.in/documents/d/guest/press-release-income-tax-act-2025-comes-into-force-from-01-april-2026-pdf) |
| F-0002 | Income-tax Rules 2026 notified | Notification No. 22/2026, G.S.R. 198(E), 20 March 2026 | all | CBDT notification | https://www.incometaxindia.gov.in/w/notification-no.-22/2026-f.-no.-370142/41/2025-tpl-/-g.s.r.-198-e- | — | 2026-04-01 | — | ☐ | S | unverified | (to be cited in every form-renumbering article) | found via site: search 2026-09-05; portal blocks fetch — use Gazette copy |
| F-0003 | Tax audit section | s.44AB (1961) → s.63 (2025) | all | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-tax-audit-44ab.html; insights-old-vs-new-section-numbers.html | |
| F-0004 | Books of account section | s.44AA → s.62 | all | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-old-vs-new-section-numbers.html | |
| F-0005 | Presumptive taxation (residents) | s.44AD/44ADA/44AE → s.58 | all | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-old-vs-new-section-numbers.html | |
| F-0006 | Capital-gains exemption on residence | s.54 → s.82 | individuals/HUF | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-nri-inherited-property.html; insights-nri-taxation-new-act.html; insights-capital-gains-new-act.html | |
| F-0007 | Capital-gains exemption via bonds | s.54EC → s.85; bond cap ₹50 lakh | all | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-nri-inherited-property.html; insights-capital-gains-new-act.html; insights-nri-taxation-new-act.html | cap value is V-class — split on verification |
| F-0008 | Capital-gains exemption on investment in house | s.54F → s.86 | individuals/HUF | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-nri-inherited-property.html; insights-nri-taxation-new-act.html | |
| F-0009 | Capital-gains chapter and computation | ss.67–91; computation s.72 (earlier s.48) | all | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-capital-gains-new-act.html | |
| F-0010 | Deductions: 80C → s.123 (Schedule XV); 80D → s.126; 80G → s.133; 80-IAC → s.140 | as stated | all | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-income-tax-act-2025-vs-1961.html; insights-old-vs-new-section-numbers.html; insights-dpiit-startup-recognition.html | |
| F-0011 | Rebate section | s.87A → s.156 | resident individuals | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-income-tax-act-2025-vs-1961.html; insights-old-vs-new-section-numbers.html | |
| F-0012 | DTAA relief sections | ss.90/90A → s.159 | non-residents | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-nri-dtaa-claim.html; insights-old-vs-new-section-numbers.html | |
| F-0013 | Transfer-pricing sections and report | ss.92/92E → s.172; Form 3CEB → Form 48 | international transactions | Income-tax Act 2025; Rules 2026 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-old-vs-new-section-numbers.html | |
| F-0014 | Domestic company 22 % option | s.115BAA → s.200 | domestic companies | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-new-act-for-businesses.html; insights-subsidiary-vs-branch-vs-liaison.html; insights-pvt-ltd-vs-llp-vs-proprietorship.html (still cites 115BAA — fix) | |
| F-0015 | Default (new) regime section | s.115BAC → s.202 | individuals/HUF | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-income-tax-act-2025-vs-1961.html; insights-old-vs-new-section-numbers.html | |
| F-0016 | Return of income; updated return | s.139 → s.263; s.140B → s.267 | all | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-first-itr-under-new-act.html; insights-old-vs-new-section-numbers.html | |
| F-0017 | TDS on salary | s.192 → s.392 | employers | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-new-act-tds-changes.html; insights-old-vs-new-section-numbers.html | |
| F-0018 | TDS on other payments (residents / non-residents) | 194-series and s.195 → s.393(1) residents; s.393(2)/(3) non-residents | payers | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-new-act-tds-changes.html; insights-nri-tds-property-sale.html; insights-nri-taxation-new-act.html; insights-nri-lower-tds-certificate.html (still cites s.195 — fix) | |
| F-0019 | Lower/nil deduction certificate | s.197 → s.395; Form 13 → Form 128 | payees | Income-tax Act 2025; Rules 2026 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-nri-lower-tds-certificate.html; insights-nri-tds-property-sale.html; insights-nri-taxation-new-act.html; insights-new-act-tds-changes.html | |
| F-0020 | Foreign-remittance forms | Form 15CA → Form 145; Form 15CB → Form 146 | remitters | Income-tax Rules 2026 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-nri-repatriation-15ca-15cb.html; insights-new-act-tds-changes.html; insights-nri-taxation-new-act.html | |
| F-0021 | Other form renumbering | Form 16 → 130; 26AS → 168; 24Q → 138; 26QB/QC/QD/QE → 141; 10F → 42; 10E → 39 | as stated | Income-tax Rules 2026 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-new-act-tds-changes.html; insights-old-vs-new-section-numbers.html; insights-tax-year-explained.html; insights-nri-dtaa-claim.html; insights-nri-taxation-new-act.html | |
| F-0022 | Residential status section | s.6 (same number in both Acts) | individuals | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | S | unverified | insights-nri-residential-status-rnor.html; insights-resident-director-requirement.html | |

## 2. Income-tax — rates, thresholds, due dates (V-class)

| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class | status | used_in | notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| F-0040 | LTCG rate, land/building, transfers on/after 23 Jul 2024 | 12.5 % without indexation | all; NRIs cannot use the 20 %-with-indexation option | Finance (No. 2) Act 2024 | — | — | 2024-07-23 | — | ☐ | V | unverified | insights-nri-tds-property-sale.html; insights-capital-gains-new-act.html; insights-nri-inherited-property.html; insights-nri-lower-tds-certificate.html; insights-nri-taxation-new-act.html | |
| F-0041 | Grandfathering option for land/building acquired before 23 Jul 2024 | lower of 12.5 % un-indexed or 20 % indexed | resident individuals/HUF only | Finance (No. 2) Act 2024; carried into 2025 Act | — | — | 2024-07-23 | — | ☐ | V | unverified | insights-capital-gains-new-act.html | |
| F-0042 | Effective TDS on NRI LTCG by consideration band | 13.0 % (≤ ₹50 lakh) / 14.30 % (₹50 lakh–₹1 crore) / 14.95 % (> ₹1 crore) | s.393(2)/(3) + surcharge + 4 % cess | Finance Act rate schedule (surcharge on LTCG capped at 15 %) | — | — | 2024-07-23 | — | ☐ | V | unverified | insights-nri-tds-property-sale.html; insights-nri-inherited-property.html (₹17.9 lakh at 14.95 %) | was VERIFY comment (nri-tds l.135); FACTS-2026 §4 item 1 |
| F-0043 | STCG on property held ≤ 24 months (NRI seller) | slab rates + surcharge + cess ("around 30 %" stated) | NRIs | Finance Act rate schedule | — | — | — | — | ☐ | V | disputed | insights-nri-lower-tds-certificate.html; insights-nri-tds-property-sale.html | was VERIFY comment (nri-tds l.144): sources mix old-regime maths; do not quote a precise % |
| F-0044 | Holding periods | 12 months listed securities / 24 months everything else | all | Finance (No. 2) Act 2024 | — | — | 2024-07-23 | — | ☐ | V | unverified | insights-capital-gains-new-act.html; insights-nri-inherited-property.html; insights-nri-lower-tds-certificate.html | |
| F-0045 | Listed-equity LTCG exemption | ₹1.25 lakh per year; STCG on listed equity 20 % | all | Finance (No. 2) Act 2024 | — | — | 2024-07-23 | — | ☐ | V | unverified | insights-capital-gains-new-act.html; insights-nri-taxation-new-act.html | |
| F-0046 | TDS on purchase of property from a resident | 1 % where consideration or SDV ≥ ₹50 lakh; Form 141 (earlier 26QB); no TAN | buyers from residents | s.393(1) table; Rules 2026 | — | — | 2026-04-01 | — | ☐ | V | unverified | insights-new-act-tds-changes.html; insights-nri-tds-property-sale.html | |
| F-0047 | NRI-seller TDS basis | on full sale consideration; no ₹50 lakh threshold; buyer needs TAN | buyers from NRIs | s.393(2)/(3) | — | — | 2026-04-01 | — | ☐ | V | unverified | insights-nri-lower-tds-certificate.html; insights-nri-tds-property-sale.html | lower-TDS article claims "TAN needed until 30 Sep 2026; PAN-based mechanism from 1 Oct 2026" — **P0: verify or remove** |
| F-0048 | Form 146 threshold | CA certificate where taxable remittances to a non-resident exceed ₹5 lakh in the FY | remitters | Rules 2026 (successor to Rule 37BB) | — | — | 2026-04-01 | — | ☐ | V | unverified | insights-nri-repatriation-15ca-15cb.html; insights-new-act-tds-changes.html | |
| F-0049 | Dividend TDS to non-residents | 20 % + surcharge + cess; treaty rates typically 5–15 % | non-resident shareholders | s.393(2); DTAAs | — | — | — | — | ☐ | V | unverified | insights-nri-dtaa-claim.html; insights-nri-taxation-new-act.html | |
| F-0050 | Residential status day counts | 182 days; or 60 + 365 in preceding 4 years; 120-day rule for India-sourced income > ₹15 lakh; deemed residency > ₹15 lakh; RNOR 9/10 years or ≤ 729 days in 7 years | individuals | s.6 (both Acts); Finance Act 2020 | — | — | — | — | ☐ | V | unverified | insights-nri-residential-status-rnor.html; insights-nri-taxation-new-act.html | |
| F-0051 | New-regime slabs (FY 2025-26 onward) | nil to ₹4 lakh; 5 % 4–8; 10 % 8–12; 15 % 12–16; 20 % 16–20; 25 % 20–24; 30 % above ₹24 lakh | individuals, default regime | Finance Act 2025 | — | — | 2025-04-01 | — | ☐ | V | unverified | insights-income-tax-act-2025-vs-1961.html; insights-new-act-for-businesses.html; insights-first-itr-under-new-act.html | re-check after each Budget |
| F-0052 | Rebate and standard deduction | rebate up to ₹60,000 (income ≤ ₹12 lakh); standard deduction ₹75,000 | resident individuals, new regime | Finance Act 2025; s.156 | — | — | 2025-04-01 | — | ☐ | V | unverified | insights-income-tax-act-2025-vs-1961.html; insights-first-itr-under-new-act.html; insights-new-act-for-businesses.html; insights-old-vs-new-section-numbers.html | |
| F-0053 | 80C-type limit | ₹1.5 lakh (s.123) | individuals/HUF | Income-tax Act 2025 | — | — | 2026-04-01 | — | ☐ | V | unverified | insights-income-tax-act-2025-vs-1961.html; insights-new-act-for-businesses.html; insights-old-vs-new-section-numbers.html | |
| F-0054 | Updated-return window | 48 months (s.267) | all | Finance Act 2025; Income-tax Act 2025 | — | — | 2025-04-01 | — | ☐ | V | unverified | insights-first-itr-under-new-act.html; insights-new-act-for-businesses.html | |
| F-0055 | AY 2026-27 return due dates | 31 Jul 2026 non-audit; 31 Oct 2026 audit cases; 30 Nov 2026 transfer pricing; 31 Dec 2026 belated/revised | FY 2025-26 income (1961 Act) | s.139(1) 1961 Act; any CBDT extension circular | — | — | — | — | ☐ | V | unverified | insights-first-itr-under-new-act.html; insights-new-act-for-businesses.html; insights-tax-audit-44ab.html; insights-nri-taxation-new-act.html; insights-nri-tds-property-sale.html | **P1**: 31 Jul is past — reframe; watch for extension of 31 Oct |
| F-0056 | Alleged 31 Aug 2026 due date for non-audit business cases | not cited on site | — | — | — | — | — | — | ☐ | V | disputed | (deliberately not stated) | was VERIFY comments (first-itr l.143; new-act-for-businesses l.130); FACTS-2026 §4 item 2 |
| F-0057 | Tax audit thresholds | ₹1 crore business; ₹10 crore where cash receipts and payments each ≤ 5 %; ₹50 lakh profession, ₹75 lakh where cash receipts ≤ 5 % | businesses/professions | s.63 (earlier 44AB) | — | — | — | — | ☐ | V | unverified | insights-tax-audit-44ab.html; insights-new-act-for-businesses.html | |
| F-0058 | Tax-audit report forms | Forms 3CA/3CB/3CD apply for AY 2026-27; new-Act successors not confirmed | auditors | Rules 2026 | — | — | — | — | ☐ | V | unverified | insights-tax-audit-44ab.html; insights-first-itr-under-new-act.html | was VERIFY comments (tax-audit l.157; first-itr l.178); FACTS-2026 §4 item 5 |
| F-0059 | ITR form numbering for tax year 2026-27 | familiar ITR-1…7 stated for AY 2026-27; renaming under the new Act unconfirmed | all | Rules 2026 | — | — | — | — | ☐ | V | unverified | insights-old-vs-new-section-numbers.html; insights-first-itr-under-new-act.html; insights-new-act-for-businesses.html | was VERIFY comment (old-vs-new l.182) |
| F-0060 | ICAI cap on tax audits per partner | 60 per year from FY 2026-27 | CAs in practice | ICAI Council decision / announcement | — | — | 2026-04-01 | — | ☐ | V | unverified | insights-tax-audit-44ab.html | ICAI announcement is the primary source |
| F-0061 | Corporate rates: domestic 22 % option; foreign company 35 % | 22 % + 10 % surcharge + 4 % cess ≈ 25.17 %; foreign company 35 % (from 40 %, Finance (No. 2) Act 2024) + surcharge 2 %/5 % + cess ≈ 36.4–38.22 % | companies | Finance Acts; s.200 | — | — | 2024-04-01 | — | ☐ | V | unverified | insights-subsidiary-vs-branch-vs-liaison.html; insights-pvt-ltd-vs-llp-vs-proprietorship.html | |
| F-0062 | LLP tax rate | flat 30 % + surcharge + cess | LLPs | Finance Act rate schedule | — | — | — | — | ☐ | V | unverified | insights-pvt-ltd-vs-llp-vs-proprietorship.html | |
| F-0063 | Structural counts of the 2025 Act | 536 sections, 23 chapters, 16 schedules (from 819 / 47 / 14) | — | Income-tax Act 2025 (as enacted) | — | — | 2025-08-21 | — | ☐ | S | unverified | insights-income-tax-act-2025-vs-1961.html | drifts with amendments |
| F-0064 | Angel tax abolished | s.56(2)(viib) not applicable from FY 2025-26; not re-enacted in the 2025 Act | closely held companies | Finance (No. 2) Act 2024 | — | — | 2025-04-01 | — | ☐ | V | unverified | insights-dpiit-startup-recognition.html | |
| F-0065 | Startup tax holiday | 100 % of profits, 3 consecutive years out of first 10 (s.140, earlier 80-IAC); incorporation window to 1 Apr 2030 | DPIIT-recognised startups | Finance Act 2025; Income-tax Act 2025 | — | — | 2025-04-01 | — | ☐ | V | unverified | insights-dpiit-startup-recognition.html | |
| F-0066 | Form 10F / Form 42 e-filing | mandatory electronic filing; TRC required | non-residents claiming treaty relief | Rules; CBDT notification on e-filing of Form 10F | — | — | — | — | ☐ | V | unverified | insights-nri-dtaa-claim.html; insights-nri-taxation-new-act.html | |
| F-0067 | Transitional validity of old 15CA/15CB | forms filed for remittances completed on or before 31 Mar 2026 remain valid | remitters | Rules 2026 transitional provision | — | — | 2026-04-01 | — | ☐ | V | unverified | insights-nri-repatriation-15ca-15cb.html; insights-new-act-tds-changes.html; insights-old-vs-new-section-numbers.html; insights-nri-taxation-new-act.html | demote after the 2027 filing season |

## 3. GST (V-class)

| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class | status | used_in | notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| F-0080 | Registration thresholds | ₹40 lakh goods / ₹20 lakh services; special-category states ₹20 lakh / ₹10 lakh | suppliers | CGST Act s.22; notifications | — | — | — | — | ☐ | V | unverified | insights-gst-registration-2026.html | |
| F-0081 | E-invoicing threshold | ₹5 crore aggregate turnover (any FY from 2017-18); article says "lowered from ₹10 crore" | registered persons | CBIC Notification (Central Tax) — number to cite | — | — | 2023-08-01 | — | ☐ | V | unverified | insights-gst-changes-2026.html | June sheet says ₹5 crore since 1 Aug 2023 — the article's "January 2026" framing needs checking |
| F-0082 | IRN reporting window | invoices/credit-debit notes to be reported within 30 days | e-invoicing taxpayers | GSTN advisory / notification | — | — | — | — | ☐ | V | unverified | insights-gst-changes-2026.html | |
| F-0083 | Three-year time bar on returns | returns older than 3 years from due date cannot be filed | all | Finance Act 2023 amendments (ss.37/39/44/52); GSTN advisory | — | — | — | — | ☐ | V | unverified | insights-gst-changes-2026.html | |
| F-0084 | Auto-suspension for unverified bank details; MFA on portal | as stated | registered persons | CGST Rules (rule 10A/21A); GSTN advisories | — | — | — | — | ☐ | V | unverified | insights-gst-changes-2026.html; insights-gst-registration-2026.html | |
| F-0085 | GST 2.0 rate structure | 5 % / 18 % plus 40 % demerit rate; effective date reported 22 Sep 2025 | all | CBIC rate notifications following the 56th GST Council meeting | — | — | 2025-09-22 | — | ☐ | V | unverified | (not stated on site — bulletin/refresh candidate) | FACTS-2026 §3; verify effective date and notification numbers |
| F-0086 | Registration processing time | "usually within about a week" | applicants | CGST Rules rule 9 timelines | — | — | — | — | ☐ | V | unverified | insights-gst-registration-2026.html | |

## 4. FEMA / FDI / RBI (V-class)

| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class | status | used_in | notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| F-0100 | FC-GPR timeline | within 30 days of allotment, on SMF via FIRMS through the AD bank | Indian companies issuing to non-residents | FEMA (Non-debt Instruments) Rules 2019; RBI Master Direction on Reporting | — | — | — | — | ☐ | V | unverified | insights-fc-gpr-filing.html; insights-foreign-subsidiary-india.html; insights-fdi-automatic-approval-route.html; insights-company-incorporation-india.html | |
| F-0101 | FC-TRS timeline | within 60 days of transfer | transfers | as F-0100 | — | — | — | — | ☐ | V | unverified | insights-fdi-automatic-approval-route.html; insights-fla-return-rbi.html | |
| F-0102 | FLA return | due 15 July on FLAIR; provisional then revised by 30 September on audited numbers | entities with FDI/ODI outstanding on 31 March | RBI A.P. (DIR Series) circular / FLA FAQs | — | — | — | — | ☐ | V | unverified | insights-fla-return-rbi.html; insights-fdi-automatic-approval-route.html; insights-subsidiary-vs-branch-vs-liaison.html; insights-company-incorporation-india.html | **P0**: article's wrong-season lines |
| F-0103 | Late Submission Fee | ₹7,500 (+ 0.025 % × amount × years for FC-GPR per uniform LSF); compounding up to 3× amount; ₹2 lakh if unquantifiable + ₹5,000/day | FEMA contraventions | RBI A.P. (DIR Series) Circular on LSF (2022); FEMA s.13 | — | — | — | — | ☐ | V | unverified | insights-fla-return-rbi.html; insights-fc-gpr-filing.html | |
| F-0104 | NRO repatriation limit | USD 1 million per financial year | NRIs/OCIs | FEMA (Deposit) Regulations / Master Direction on Remittance of Assets | — | — | — | — | ☐ | V | unverified | insights-nri-repatriation-15ca-15cb.html | |
| F-0105 | Insurance FDI cap | 100 % automatic route (from 74 %), reported as Press Note 1 of 2026 effective 9 Feb 2026; LIC 20 %; resident chairperson/MD/CEO | insurers | DPIIT press note (number/date to verify) | — | — | 2026-02-09 | — | ☐ | V | unverified | insights-fdi-automatic-approval-route.html | was VERIFY comment (fdi l.154); FACTS-2026 §4 item 4 |
| F-0106 | Sector caps table | telecom 100 % automatic; e-commerce marketplace 100 % automatic; defence 74 % automatic / beyond government | investors | Consolidated FDI Policy + press notes | — | — | — | — | ☐ | V | unverified | insights-fdi-automatic-approval-route.html | |
| F-0107 | Land-border approval requirement | Press Note 3 of 2020 in force | investors from land-border countries | DPIIT Press Note 3 (2020) | — | — | 2020-04-17 | — | ☐ | V | unverified | insights-fdi-automatic-approval-route.html; insights-subsidiary-vs-branch-vs-liaison.html | "still in force in 2026" phrasing needs rolling check |
| F-0108 | Branch/liaison/project office framework | AD Category-I bank approval under FEMA 22(R); LO cannot earn income | foreign entities | FEMA 22(R)/2016 regulations; RBI Master Direction on establishment of BO/LO/PO | — | — | — | — | ☐ | S | unverified | insights-subsidiary-vs-branch-vs-liaison.html | |
| F-0109 | Share valuation for issue to non-residents | by SEBI-registered merchant banker or chartered accountant | issuers | FEMA NDI Rules pricing guidelines | — | — | — | — | ☐ | S | unverified | insights-foreign-subsidiary-india.html; insights-fc-gpr-filing.html | |

## 5. Companies Act / MCA / DPIIT (V-class)

| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class | status | used_in | notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| F-0120 | Resident director | at least one director resident ≥ 182 days in the FY (s.149(3)) | every company | Companies Act 2013 s.149(3) | — | — | — | — | ☐ | S | unverified | insights-resident-director-requirement.html; insights-foreign-subsidiary-india.html; insights-company-incorporation-india.html | "unchanged as of mid-2026" phrasing to be replaced by instrument + verified date |
| F-0121 | Incorporation fee | nil for authorised capital up to ₹15 lakh; name reservation ₹1,000; DSC ₹1,500–3,000 market | applicants | Companies (Registration Offices and Fees) Rules 2014 (as amended) | — | — | — | — | ☐ | V | unverified | insights-company-incorporation-india.html | was VERIFY comment (incorporation l.199) |
| F-0122 | Incorporation timeline; name reservation validity | 7–15 working days; reserved name valid 20 days; name approval 1–2 working days | applicants | Companies (Incorporation) Rules 2014 rule 9; MCA practice | — | — | — | — | ☐ | V | unverified | insights-company-incorporation-india.html; insights-foreign-subsidiary-india.html | |
| F-0123 | DPIIT recognition criteria (classic) | entity < 10 years; turnover < ₹100 crore | startups | DPIIT notification G.S.R. 127(E), 19 Feb 2019 | — | — | 2019-02-19 | — | ☐ | V | unverified | insights-dpiit-startup-recognition.html | |
| F-0124 | DPIIT February 2026 changes | turnover ceiling ₹200 crore; cooperative societies eligible; deep-tech category 20-year window / ₹300 crore | startups | DPIIT notification dated 4 Feb 2026 (number to cite) | — | — | 2026-02-04 | — | ☐ | V | unverified | insights-dpiit-startup-recognition.html | was VERIFY comment (dpiit l.156); FACTS-2026 §4 item 3 |

## 6. Payroll and other
| id | fact | value | applies to | instrument | url | excerpt | effective | verified | partner | class | status | used_in | notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

## 7. Open verification items (carried from the 12 in-page VERIFY comments, removed from the HTML 2026-09-05)

| # | article | item | linked rows |
|---|---|---|---|
| 1 | insights-company-incorporation-india.html | current MCA fee slabs and state-wise stamp duty before quoting exact rupee totals | F-0121 |
| 2 | insights-dpiit-startup-recognition.html | 4 Feb 2026 DPIIT notification details (₹200 cr ceiling, cooperative societies, deep-tech 20-year window / ₹300 cr) — confirm notification text | F-0124 |
| 3 | insights-fdi-automatic-approval-route.html | exact press-note number and effective date for 100 % insurance FDI (reported Press Note 1 of 2026, 9 Feb 2026) | F-0105 |
| 4 | insights-first-itr-under-new-act.html | one source claims a 31 Aug 2026 due date for non-audit business cases — deliberately not cited | F-0055, F-0056 |
| 5 | insights-first-itr-under-new-act.html | ITR form renaming/renumbering for tax year 2026-27 and new-Act successors to Forms 3CA/3CB/3CD | F-0058, F-0059 |
| 6 | insights-new-act-for-businesses.html | 31 Aug 2026 conflict; ITR renumbering ("familiar ITRs" for AY 2026-27 only) | F-0055, F-0056, F-0059 |
| 7 | insights-nri-dtaa-claim.html | country-specific treaty rates (US dividend 25 %/15 %, UK, UAE Art. 13) kept qualitative — add only with the treaty text | F-0049 |
| 8 | insights-nri-inherited-property.html | pre-1 April 2001 FMV substitution as cost — standard position, not yet stated | (new row on verification) |
| 9 | insights-nri-tds-property-sale.html | effective TDS tier table 13 % / 14.30 % / 14.95 % — confirm bands | F-0042 |
| 10 | insights-nri-tds-property-sale.html | exact effective STCG deduction rates — avoid a precise % until confirmed | F-0043 |
| 11 | insights-old-vs-new-section-numbers.html | ITR form numbering (ITR-1…7) for tax year 2026-27 under the new Act | F-0059 |
| 12 | insights-tax-audit-44ab.html | new-Act successor numbers for Forms 3CA/3CB/3CD (tax year 2026-27 audits, filed 2027) | F-0058 |

## 8. Superseded
| id | fact | old value | superseded_by | date | notes |
|---|---|---|---|---|---|
