# Contributing

Thanks for helping keep Awesome Video to Slides useful and verifiable.

## Curation standard

This is a small, evidence-backed catalog, not a directory or backlink list. A
resource belongs when it is directly useful for one of these jobs:

1. Recovering original slides or shared-screen frames from video.
2. Generating a new presentation from a video's transcript or content.
3. Implementing a slide-extraction pipeline: detection, OCR, transcription, or
   PPTX/PDF export.

For a hosted tool, the product must be accessible and have a first-party page
that documents its video input and output. For open source, the repository must
have a license and enough setup or API documentation to reproduce its role.

## What does not belong

- Generic presentation makers with no documented video or video-URL input.
- Generic screen recorders or editors with no extraction role.
- Affiliate roundups, coupon pages, thin SEO pages, or copied documentation.
- Abandoned demos with no usable code, license, or public product.
- Near-duplicate tools that add no clear input, output, processing, platform, or
  implementation difference.
- Paid placements, backlink exchanges, undisclosed self-promotion, or ranking
  claims such as “best”, “#1”, or “100% accurate”.

## Required evidence

Use first-party product documentation, an official store listing, source code,
or an official repository. Do not use a review or affiliate page to establish a
feature claim.

For each core tool, provide:

- Category: `original-slide-recovery` or `ai-deck-generation`.
- Supported video input: local formats, URL source, recording, or extension.
- Output: PPTX, PDF, images, transcript, or another documented format.
- Processing location: browser/local, server, mixed, or `not stated`.
- Editability evidence: image-based, OCR text layer, regenerated deck, native
  objects demonstrated in source, vendor claim only, or `not stated`.
- `last_verified` date in `YYYY-MM-DD` format.
- One or more primary-source URLs supporting those fields.

“Editable PPTX” alone is ambiguous. If the source does not explain whether the
file contains a slide image, OCR overlay, or native objects, write `vendor says
editable; structure not stated`.

## Submission format

Update both the README table and [`data/video-tools.json`](data/video-tools.json)
for hosted tools. Keep the table cell short; put detailed source notes in
[`docs/verification-notes.md`](docs/verification-notes.md).

Suggested pull request body:

```md
## Resource

- Name:
- Category:
- Why it adds a distinct capability:
- Input:
- Output:
- Processing:
- Editability evidence:
- Last verified:
- Primary sources:
- Submitter affiliation: none / maintainer / employee / affiliate / other

## Checks

- [ ] I opened the product or repository page on the verification date.
- [ ] Every feature claim is supported by a first-party source.
- [ ] I updated README.md and data/video-tools.json consistently.
- [ ] I disclosed any relationship with the submitted resource.
```

## Maintainer and submitter disclosures

The list maintainer also maintains Video2Any and video-slide-extractor. Those
entries are labeled **Maintainer project** in the README and `affiliation` in the
data file. Maintainer projects receive no guaranteed position, recommendation,
or softer evidence standard.

Anyone submitting their own product is welcome to do so, but must disclose the
relationship. Undisclosed promotional submissions may be removed.

## Review policy

- Categories are functional, not rankings.
- In the original-slide recovery table, rows are grouped by where processing
  happens: tools that can convert a local video inside the browser come before
  those that upload it or do not say. Within a group, rows are alphabetical.
  The grouping is a fact about each tool, applied to every entry including the
  maintainer's own, and it is not a ranking — a server workflow is the right
  answer for anyone converting from a phone or a Chromebook.
- Elsewhere, table rows are alphabetical except when two modes of one product
  need to stay together for clarity.
- Corrections with stronger first-party evidence take precedence over existing
  wording.
- Pricing, usage limits, and performance numbers are omitted unless they are
  essential to the distinction and stable enough to maintain.
- Stale rows may be marked unverified or removed if the product, documentation,
  or repository is no longer accessible.
