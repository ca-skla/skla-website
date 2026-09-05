# COMPLIANCE.md — rules every article, bulletin note and email must satisfy

Source of authority: ICAI Code of Ethics, 13th edition (2026), Volume I, Chapter 3 (in force 1 April 2026).
Full study: `_pipeline/reference/ICAI-Website-Rules-Study.md`. Nothing below is optional. A hard-fail blocks the PR.

## A. What the website may carry (Ch. 3.3)
- Blogs, articles, professional information, bulletin boards and professional updation on matters of
  professional interest are expressly permitted (Ch. 3.3.10). Educational content is the permitted growth channel.
- Audit / attestation content may sit on the site (visitor "pull") but must never be pushed outward by
  e-mail, feed or advertising (Ch. 3.3.3–3.3.4). Such pieces carry `push: no` in BACKLOG.md and BULLETIN.md.
- No campaign that drives traffic to the site (Ch. 3.3.5). Nothing in the pipeline advertises.
- Outbound links only to ICAI, Government and regulatory bodies (Ch. 3.3.18) — see the allowlist in RUNBOOK §6.

## B. Hard-fail language (any hit fails the article unless it is inside a quoted statutory title)
Regex (case-insensitive), run on the body of the article (from `<body>` to `</body>`):

```
\b(best|leading|premier|foremost|top[- ]rated|most (trusted|experienced|reputed|respected))\s+(CA|CAs|chartered accountants?|firms?|advis[oe]rs?|consultants?|practice|tax (firm|advis[oe]rs?)|team)\b
\b(we|our (firm|team|practice)|SKLA|S K Lahoti Associates)\b[^.]{0,60}\b(the best|leading|premier|foremost|top[- ]rated|no\.? ?1|number one|most (trusted|experienced|reputed|respected))\b
\b(number one|no\.? ?1) (firm|CA|CAs|chartered accountants?|advis[oe]rs?|choice|practice)\b|\b(ranked|rated) (no\.? ?1|number one)\b|\b(top[- ]rated|most trusted|award[- ]winning)\b
\b(guarantee[ds]?|assured (refund|outcome|result)|we will (get|secure) you)\b
\b(testimonial|client review|rated \d|5-star|our awards?|awards? (to|for) (the firm|us|SKLA)|accredit(ed|ation)|ISO ?\d{4}|great place to work)\b
\b(deloitte|kpmg|pwc|ernst|wafra|ocorian)\b
\b(35\+? years|500\+? clients|6 nations|20\+? services)\b
\b(our (fee|fees|charges|rates|pricing)|fees? (start|starting|from)|charges? from|free consultation)\b
\b(book (a|your) (call|consultation|slot)|discuss your .* (needs|requirements)|talk to our experts?|let us handle|hire us|contact us today)\b
S\. ?K\. Lahoti
(97012 ?05369|\+31[ \d]+)
```
The superlative patterns target self-praise ("the leading firm", "we are the best"); generic usage in advice
("which structure is best for a founder who…") is allowed, as are government fees, stamp duty, statutory late
fees and "contracts awarded" — the regexes target the firm's own fees and awards.

## C. Hard-fail content rules
1. No client names, matters, amounts saved or identifiable engagements ("we helped a client…").
2. No attainments anywhere: years in practice, client counts, nations served, past employers, "expert",
   "specialist", rankings. Bylines carry designation + firm name only (Ch. 3.2 — books/articles).
3. No personalised advice ("you should opt for the old regime") and no outcome promises. Explain the rule,
   the choices and the consequences; end with "obtain advice on your facts".
4. Exactly one neutral pointer to the firm per article, if any: `…you can <a href="contact.html">reach the firm here</a>.`
   The single service link is descriptive, not a call to action.
5. No new contact details, images, logos or taglines. The CA India logo is the only mark on the site.
6. The disclaimer paragraph is verbatim on every article (text in RUNBOOK §9).
7. Every figure, rate, threshold, date, form number and section number is traceable to a primary instrument
   recorded in FACTS.md (accuracy is a Ch. 3.1.3 obligation: contents must be true to the best of the
   member's knowledge). Unverifiable ⇒ removed, never published.
8. Judgments are cited with court, date and citation; never characterised beyond what they held.
9. Bulletin notes are neutral summaries of official publications: what changed, from when, for whom, with the
   instrument number and one official link. No adjectives about the firm, no CTA.
10. E-mails sent by the pipeline go to `notify_email` only and contain no article text meant for onward
    circulation (the site is pull; distribution decisions are the partners').

## D. Firm conventions (also enforced)
- Firm name: `S K Lahoti Associates` — never with dots.
- Phone/WhatsApp on the site: `+91 98855 80871` only; emails `skla@skla.in`, `shashank@skla.in`.
- Income-tax Act 2025 numbering: first mention "section N of the Income-tax Act 2025 (section M of the 1961 Act)";
  forms "Form 128 (earlier Form 13)". State which regime governs the period discussed.
- Body copy uses HTML entities (`&mdash;` `&ndash;` `&rsquo;` `&#8377;` `&amp;`); `<title>`, meta and JSON-LD
  use raw UTF-8; never entities inside JSON-LD.
