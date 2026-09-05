# BULLETIN.md — canonical log of "Latest updates" notes shown on insights.html

Newest first. The page shows the newest `bulletin_max_items` (config.yml, default 6); this file keeps all of them.
`bin/render-bulletin.sh` regenerates the HTML block between `<!-- BULLETIN:START -->` and `<!-- BULLETIN:END -->`
in `insights.html` from the rows below. Rules for a note: ≤ 80 words, neutral, names the instrument (number and
date), one link to the official source, one audience token (`nri|investor|business|newact`), `push: no` for
audit/attestation subjects. See RUNBOOK §11.

Columns: `date` (YYYY-MM-DD) · `audience` (nri|investor|business|newact) · `push` (yes|no) · `note` (HTML entities,
≤ 80 words, no link inside) · `source_label` (e.g. `Notification No. 22/2026 (CBDT)`) · `source_url` (allowlisted
domain, https) · `fact_ids` (F-#### list or —) · `pr`.

| date | audience | push | note | source_label | source_url | fact_ids | pr |
|---|---|---|---|---|---|---|---|
| 2026-08-18 | nri | yes | The Income Tax Department announced a verification exercise covering suspicious foreign remittances (press release of 18 August 2026). | Press release, 18 August 2026 (CBDT) | https://www.incometaxindia.gov.in/press-release | — | corrections-2026-09 |
| 2026-08-14 | nri | yes | CBDT has notified the rules and forms for the Foreign Assets of Small Taxpayers Disclosure Scheme, 2026 (Chapter IV, sections 130&ndash;144 of the Finance Act, 2026): the scheme runs from 16 August to 31 December 2026, with 31 March 2026 as the valuation date and declarations in Form 1. | Notification No. 114/2026, G.S.R. 732(E), 14 August 2026 (Gazette) | https://egazette.gov.in/WriteReadData/2026/275490.pdf | F-0201 | corrections-2026-09 |
| 2026-07-02 | business | yes | CBDT Circular No. 6/2026 of 2 July 2026 condones delay in the electronic filing of Form No. 10AB for approval under clause (ii) of the first proviso to section 80G(5) of the Income-tax Act, 1961. | Circular No. 6/2026 (CBDT) | https://www.incometaxindia.gov.in/circulars | — | corrections-2026-09 |
| 2026-03-30 | nri | yes | From 1 October 2026 a resident individual or HUF buying immovable property from a non-resident seller no longer needs a tax deduction account number (Finance Act, 2026, section 87, substituting section 397(1)(c) of the Income-tax Act, 2025); companies and firms still need one, and the deposit procedure for TAN-less deductors is yet to be prescribed. | Finance Act, 2026, section 87 (Gazette, 31 March 2026) | https://egazette.gov.in/WriteReadData/2026/271439.pdf | F-0200 | corrections-2026-09 |
| 2026-03-30 | newact | yes | The Finance Act, 2026 (4 of 2026) received assent on 30 March 2026 &mdash; the first Finance Act to amend the Income-tax Act, 2025. For tax year 2026-27 the default-regime slabs, the &#8377;60,000 rebate and the &#8377;75,000 standard deduction are unchanged; surcharge on capital-gains income remains capped at 15%. | Finance Act, 2026 (Gazette, 31 March 2026) | https://egazette.gov.in/WriteReadData/2026/271439.pdf | F-0051 | corrections-2026-09 |
| 2026-03-20 | newact | yes | The Income-tax Rules, 2026 (Notification No. 22/2026, G.S.R. 198(E), 20 March 2026) prescribe 191 renumbered forms from 1 April 2026: Form 128 (earlier 13), Forms 145 and 146 (earlier 15CA and 15CB), Form 141 (earlier the 26QB family), Form 144 (earlier 27Q), Form 41 (earlier 10F) and a single Form 26 in place of Forms 3CA, 3CB and 3CD. | CBDT table of forms under the 2026 Rules | https://www.incometaxindia.gov.in/faqs-and-guidance-notes-on-forms-as-per-income-tax-rules-2026 | F-0021 | corrections-2026-09 |
