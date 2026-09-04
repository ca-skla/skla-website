# S K Lahoti Associates — Website

Static marketing site for SKLA, Chartered Accountants (Hyderabad, since 1989). Live at https://www.skla.in.

## Preview
Open `index.html` in any browser. No build step or server required (web fonts and the contact-page map need an
internet connection).

## Pages
`index.html` Home · `about.html` · `services.html` (6 pillars) · `industries.html` · `team.html` · `careers.html` ·
`contact.html` · `insights.html` (Resources index) + `insights-*.html` (articles) · `404.html`

## Assets
`assets/css/style-v2.css` — all styles (theme via CSS variables in `:root`) · `assets/js/main-v2.js` — nav,
scroll reveal, insights filter, FAQ, form · `assets/img/` — CA India logo, favicons, OG image, team photos

## Deploy
`main` deploys automatically to Netlify (`netlify.toml`: `publish = "."`, redirects from the old WordPress URLs,
forced 404 for `/_pipeline/*`, `/CLAUDE.md` and `/README.md`). Nothing lands on the live site without a merge.

## Insights pipeline
`_pipeline/` holds the runbook, backlog, facts register and lint scripts used by two cloud routines that draft a
new article every fortnight and re-verify existing ones monthly, each as a pull request for partner review.
Start at `_pipeline/RUNBOOK.md`. Lint an article with `bash _pipeline/bin/check-article.sh <slug>`.

See `CLAUDE.md` for the full project brief and conventions.
