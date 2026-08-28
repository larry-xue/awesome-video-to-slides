# Verification Notes

Last source review: **2026-08-28**.

This file records the evidence behind the core comparison tables. It is a source
log, not a performance test. Product behavior can change after the review date.

## Method

1. Open the product's own page, official store listing, documentation, or source
   repository.
2. Record only input, output, processing, and editability claims supported by
   that source.
3. Confirm the evidence URL is a real page before trusting it. A single-page app
   can answer `200` for every path it does not know, so an HTTP check alone
   proves nothing: fetch the evidence URL and a deliberately non-existent path on
   the same host, and treat the source as unusable when the two responses are
   identical.
4. Use `not stated` rather than infer a processing location or file structure.
5. Label vendor claims as vendor claims when no public implementation or sample
   file independently demonstrates them.
6. Keep original-slide recovery separate from transcript/content-driven deck
   generation.

`Verified` in the README means the evidence page was reachable and supported the
listed fields. It does not mean the maintainers uploaded a test video, audited
network traffic, inspected every exported object, or verified marketing claims.

## Original-slide recovery sources

- **CopySlides:** the official
  [Video to Slides page](https://copyslides.com/video-to-slides) documents local
  video input, PPTX and Google Slides output, reconstructed editable text boxes
  and layouts, and an online workflow. The product home page also advertises a
  paid desktop conversion option. The page now enumerates the accepted formats
  (MP4, MOV, AVI, MKV, WebM) and caps clip length by plan. These are vendor
  claims; no export was inspected in this review.
- **MagicSlides, Direct mode:** the official
  [Video to PPT page](https://www.magicslides.app/tools/video-to-ppt) documents
  direct local-video input, slide selection, and PPTX output. It now names the
  split explicitly: MP4, MOV, and WebM are captured in the browser and "never
  leave your device", while "other formats are processed securely on our server
  and deleted after conversion". AVI is an accepted format that falls on the
  server side, so the earlier phrasing of "supported formats" was too generous.
  The same page also offers an AI mode, which is listed separately.
- **SlideStream AI:** the official [product page](https://slidestream.ai/)
  documents slide extraction, enhancement, OCR text, download, Google Drive, and
  share links. It does not name an accepted input format or the word upload, nor
  does it document where processing occurs or the internal deck object
  structure, so input is now recorded as `not stated`.
- **SyncSlide:** the official [product page](https://syncslide.com/),
  [demo](https://syncslide.com/demo/), and
  [privacy page](https://syncslide.com/privacy/) document supported video
  formats, screen recording, server-side processing, PPTX/PDF/Google Slides and
  narrated-video outputs, and editable speaker notes. The sources emphasize
  image-faithful visuals and do not establish native-object reconstruction.
- **Video to Slides Chrome extension:** the official
  [Chrome Web Store listing](https://chromewebstore.google.com/detail/video-to-slides/nldgdhfmnpbmdpaobpgaplhdgojdgllh)
  documents in-page video capture, frame comparison, PDF/image/HTML exports, and
  the developer's no-data-collection declaration.
- **Video to Slides:** the official [product page](https://videotoslides.org/)
  documents supported local formats, slide detection and review, OCR rebuilding,
  PPTX/PDF/image export, and server-side deletion after processing ("Uploaded
  videos are processed securely and removed after processing is completed"). It
  now also accepts a YouTube URL and states a 500 MB / 30 minute limit.
- **Video2Any:** the official [product page](https://video2any.com/) and
  [pricing details](https://video2any.com/pricing-details) document local video
  processing and PPTX/PDF/Word/Markdown/image/subtitle/audio outputs. The home
  page no longer describes the optional local-OCR text layer, so that field now
  rests on the pricing page and the maintainer's own knowledge rather than the
  headline product page. The list maintainer has direct access to the implementation and
  discloses the relationship in the README.
- **Video2PPT:** the official [product page](https://video2ppt.com/) documents
  local video, online link, and screen-recording inputs; local/no-upload
  processing paths; PPTX/PDF/HTML and transcript outputs; and a vendor claim
  that text, shapes, and layouts are editable; Google Slides has been added to
  the export list. Its official
  [privacy policy](https://video2ppt.com/privacy-policy) no longer states the
  24-hour deletion window recorded in the previous review. It now says local and
  desktop modes never upload the file, while "optional services, such as
  processing online links, creating public share links, or clearly labelled
  online features, may require the content or link you choose to submit to leave
  your device", retained "only for the time reasonably needed". The table
  therefore still treats processing as mode-dependent, without the retired
  number.

## AI deck generation sources

- **MagicSlides, AI mode:** the official
  [Video to PPT page](https://www.magicslides.app/tools/video-to-ppt) describes
  AI-generated presentation content and editable PPTX output alongside its
  direct frame-capture mode.
- **Presentations.AI:** the official
  [URL to PPT page](https://www.presentations.ai/url-to-ppt) documents any
  public URL including YouTube, transcript/key-frame use, AI restructuring, and
  "native PPTX export". Exports now also include PDF, PNG/JPG per slide, and a
  share link. The converter page still does not provide a sufficiently specific
  processing location for the table.
- **SlideSpeak:** the official
  [YouTube to PowerPoint page](https://slidespeak.co/free-tools/convert-youtube-to-powerpoint)
  documents transcript-driven generation from a public YouTube URL, PPTX/PPT and
  Google Slides output, and removal "from our servers immediately after
  generation completes". Its general
  [privacy policy](https://slidespeak.co/privacy) says uploaded data is stored
  for 180 days by default. These statements may apply to different workflows,
  but the product does not reconcile them on the tool page, so both are retained
  in the table.
- **SlidesPilot:** the official
  [YouTube to PPT page](https://www.slidespilot.com/youtube-to-ppt) documents
  transcript/audio-stream analysis, a block editor, and PPTX, Google Slides,
  PDF, and PNG exports. The statement that source video and audio are not
  stored, recorded in the previous review, is no longer on the page, so
  retention is now `not stated`.

## Open-source evidence

- [video-slide-extractor](https://github.com/larry-xue/video-slide-extractor):
  repository README, source, MIT license, and GitHub repository metadata.
- [slideextract](https://github.com/szanni/slideextract): repository README,
  source, BSD-2-Clause license, and GitHub repository metadata.
- Pipeline projects link to their official documentation or canonical source
  repositories in the README. Repository activity dates are deliberately shown
  only for direct slide-extraction projects, where maintenance status is central
  to the inclusion decision.

## Removed from the list

- **StreamSlide** (removed 2026-08-28; listed 2026-07-04 to 2026-08-28). Its
  evidence URL, `https://streamslide.io/video-to-slides`, stopped being a real
  page: the host returns byte-identical HTML for that path, for `/`, and for a
  path invented for this check, so it answers `200` for anything and can no
  longer support a row. The site's own description now sells an AI chatbot
  builder rather than slide extraction, and its `og:url` points at
  `https://streamslide.net/`, which does not resolve. If a first-party
  video-to-slides page reappears, the tool can be re-reviewed and re-added.

## Evidence limits

- Privacy statements describe documented product behavior, not an independent
  packet capture or security audit.
- “Vendor says editable” does not establish native PowerPoint object fidelity.
- No accuracy, speed, price, or usage-limit ranking is maintained here because
  those claims require a repeatable benchmark and change frequently.
- A product appearing in the list is not a recommendation. It means the product
  has a distinct, documented role and passed the curation rules on the stated
  date.
