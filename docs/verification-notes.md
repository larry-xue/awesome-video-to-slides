# Verification Notes

Last source review: **2026-07-15**.

This file records the evidence behind the core comparison tables. It is a source
log, not a performance test. Product behavior can change after the review date.

## Method

1. Open the product's own page, official store listing, documentation, or source
   repository.
2. Record only input, output, processing, and editability claims supported by
   that source.
3. Use `not stated` rather than infer a processing location or file structure.
4. Label vendor claims as vendor claims when no public implementation or sample
   file independently demonstrates them.
5. Keep original-slide recovery separate from transcript/content-driven deck
   generation.

`Verified` in the README means the evidence page was reachable and supported the
listed fields. It does not mean the maintainers uploaded a test video, audited
network traffic, inspected every exported object, or verified marketing claims.

## Original-slide recovery sources

- **CopySlides:** the official
  [Video to Slides page](https://copyslides.com/video-to-slides) documents local
  video input, PPTX and Google Slides output, reconstructed editable text boxes
  and layouts, and an online workflow. The product home page also advertises a
  paid desktop conversion option. These are vendor claims; no export was
  inspected in this review.
- **MagicSlides, Direct mode:** the official
  [Video to PPT page](https://www.magicslides.app/tools/video-to-ppt) documents
  direct local-video input, browser frame capture for supported formats, slide
  selection, PPTX output, and different handling for unsupported formats. The
  same page also offers an AI mode, which is listed separately.
- **SlideStream AI:** the official [product page](https://slidestream.ai/)
  documents video upload, slide extraction, enhancement, OCR text, download,
  Google Drive, and share links. It does not clearly document where video
  processing occurs or the internal deck object structure.
- **StreamSlide:** the official
  [Video to Slides page](https://streamslide.io/video-to-slides) documents local
  video formats, browser processing, and PDF export. The broader home page also
  mentions PPTX, but the live converter page only exposed PDF during this
  review, so the table uses the narrower claim.
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
  PPTX/PDF/image export, and server-side deletion after processing.
- **Video2Any:** the official [product page](https://video2any.com/) and
  [pricing details](https://video2any.com/pricing-details) document local video
  processing, PPTX/PDF/image/subtitle outputs, and optional local-OCR editable
  text slides. The list maintainer has direct access to the implementation and
  discloses the relationship in the README.
- **Video2PPT:** the official [product page](https://video2ppt.com/) documents
  local video, online link, and screen-recording inputs; local/no-upload
  processing paths; PPTX/PDF/HTML and transcript outputs; and a vendor claim
  that text, shapes, and layouts are editable. Its official
  [privacy policy](https://video2ppt.com/privacy-policy), however, says uploaded
  video files may be stored temporarily and deleted within 24 hours. The table
  therefore treats processing as mode-dependent instead of repeating the
  blanket “never uploaded” claim.

## AI deck generation sources

- **MagicSlides, AI mode:** the official
  [Video to PPT page](https://www.magicslides.app/tools/video-to-ppt) describes
  AI-generated presentation content and editable PPTX output alongside its
  direct frame-capture mode.
- **Presentations.AI:** the official
  [URL to PPT page](https://www.presentations.ai/url-to-ppt) documents YouTube
  URL input, transcript/key-frame use, AI restructuring, and editable PPTX
  output. The converter page did not provide a sufficiently specific processing
  location for the table.
- **SlideSpeak:** the official
  [YouTube to PowerPoint page](https://slidespeak.co/free-tools/convert-youtube-to-powerpoint)
  documents transcript-driven generation from a public YouTube URL, PPTX/PPT
  output, and immediate removal after processing. Its general
  [privacy policy](https://slidespeak.co/privacy) says uploaded data is stored
  for 180 days by default. These statements may apply to different workflows,
  but the product does not reconcile them on the tool page, so both are retained
  in the table.
- **SlidesPilot:** the official
  [YouTube to PPT page](https://www.slidespilot.com/youtube-to-ppt) documents
  transcript/audio-stream analysis, a block editor, and PPTX, Google Slides,
  PDF, and PNG exports. It says source video/audio is not stored.

## Open-source evidence

- [video-slide-extractor](https://github.com/larry-xue/video-slide-extractor):
  repository README, source, MIT license, and GitHub repository metadata.
- [slideextract](https://github.com/szanni/slideextract): repository README,
  source, BSD-2-Clause license, and GitHub repository metadata.
- Pipeline projects link to their official documentation or canonical source
  repositories in the README. Repository activity dates are deliberately shown
  only for direct slide-extraction projects, where maintenance status is central
  to the inclusion decision.

## Evidence limits

- Privacy statements describe documented product behavior, not an independent
  packet capture or security audit.
- “Vendor says editable” does not establish native PowerPoint object fidelity.
- No accuracy, speed, price, or usage-limit ranking is maintained here because
  those claims require a repeatable benchmark and change frequently.
- A product appearing in the list is not a recommendation. It means the product
  has a distinct, documented role and passed the curation rules on the stated
  date.
