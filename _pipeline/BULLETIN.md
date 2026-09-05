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
