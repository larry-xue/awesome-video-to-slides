# Awesome Video to Slides [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

Recovering the slides shown in a recorded talk, and generating a new deck from
video content.

These are different jobs:

- **Original-slide recovery** keeps frames or reconstructs content already
  visible in a lecture, webinar, or screen recording.
- **AI deck generation** summarizes a transcript or video into a newly designed
  presentation. It does not recover the original deck.

The distinction matters when comparing fidelity, editability, privacy, and
output quality.

> **Maintainer disclosure:** the list maintainer also maintains Video2Any and
> video-slide-extractor, both listed below and both marked **Maintainer
> project**. They follow the same inclusion rules as every other entry. There
> are no paid placements and no affiliate links.

## Contents

- [How to read the tables](#how-to-read-the-tables)
- [Original-slide recovery](#original-slide-recovery)
- [AI deck generation](#ai-deck-generation)
- [Open-source slide extraction](#open-source-slide-extraction)
- [Pipeline building blocks](#pipeline-building-blocks)
- [Research and datasets](#research-and-datasets)
- [Guides and evidence](#guides-and-evidence)

## How to read the tables

**Processing** reports the product's documented behavior, not an independent
privacy audit. `Not stated` is used when the official source is unclear.

**Editability** describes the evidence available: an image-based slide, an OCR
text layer over an image, or a newly generated deck. A vendor saying “editable
PPTX” is not treated as proof of native PowerPoint objects.

**Verified** means the linked first-party page was reachable and supported the
row on that date. It is not a product endorsement or benchmark result.

The machine-readable subset is available in
[`data/video-tools.json`](data/video-tools.json). Verification method and source
notes are linked under Guides and evidence.

## Original-slide recovery

Use these when the video already contains slides or mostly static shared-screen
content and you want to recover those visuals.

Rows are grouped by where the work happens — tools that can process a local
video inside the browser first, then those that upload it or do not say —
because that is the difference a reader cannot undo later. Within each group
rows are alphabetical. Grouping is not a ranking: a server workflow is the
right answer for anyone converting from a phone or a Chromebook.

| Tool                                                                                                                            | Input                                                    | Output                                                 | Processing                                                                                                                                                                               | Editability evidence                                                                           | Verified   |
| ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ---------- |
| [MagicSlides — Direct mode](https://www.magicslides.app/tools/video-to-ppt)                                                     | Local MP4, MOV, AVI, or WebM                             | PPTX                                                   | Browser for MP4, MOV, and WebM; other formats, including AVI, are processed on the vendor's server and deleted after conversion                                                          | Vendor says editable; object structure not stated                                              | 2026-08-28 |
| [Video to Slides — Chrome extension](https://chromewebstore.google.com/detail/video-to-slides/nldgdhfmnpbmdpaobpgaplhdgojdgllh) | Video playing in a browser tab                           | PDF, images, or HTML gallery                           | Browser extension; store listing says no data collection                                                                                                                                 | Image slides                                                                                   | 2026-08-28 |
| [Video2Any](https://video2any.com/) **Maintainer project**                                                                      | Local video, supported video link, or screen recording   | PPTX, PDF, Word, Markdown, images, subtitles, or audio | Browser for local video processing; link resolving may use server services                                                                                                               | Image-based PPTX; optional local-OCR text layer                                                | 2026-08-28 |
| [Video2PPT](https://video2ppt.com/)                                                                                             | Local video, online video link, or screen recording      | PPTX, Google Slides, PDF, HTML, transcript             | Product claims local/no-upload paths; privacy policy carves out optional online features whose content leaves the device, retained only as long as needed, so behavior is mode-dependent | Vendor says text, shapes, and layouts are editable                                             | 2026-08-28 |
| [CopySlides](https://copyslides.com/video-to-slides)                                                                            | Local MP4, MOV, AVI, MKV, or WebM                        | PPTX or Google Slides                                  | Online workflow; paid desktop conversion is also advertised                                                                                                                              | Vendor says text boxes and layouts are reconstructed as editable objects                       | 2026-08-28 |
| [SlideStream AI](https://slidestream.ai/)                                                                                       | Not stated                                               | Downloadable deck; Google Drive/share link             | Not stated                                                                                                                                                                               | Searchable OCR text is documented; deck structure not stated                                   | 2026-08-28 |
| [SyncSlide](https://syncslide.com/)                                                                                             | Local MP4, AVI, MOV, MKV, WebM, or FLV; screen recording | PPTX, PDF, Google Slides, or narrated MP4              | Server workflow is documented                                                                                                                                                            | Image-faithful visuals with editable speaker notes; native-object reconstruction is not stated | 2026-08-28 |
| [Video to Slides](https://videotoslides.org/)                                                                                   | Local MP4, MOV, WebM, or MKV; YouTube URL                | PPTX, PDF, or images                                   | Server; product says uploads are removed after processing                                                                                                                                | Vendor describes OCR-rebuilt editable layouts                                                  | 2026-08-28 |

## AI deck generation

Use these when you want a summary or redesigned presentation derived from a
video. Output may omit, rewrite, or reorganize the original visual content.

| Tool                                                                         | Input                                             | Output                            | Processing                                                                                             | Editability evidence                                           | Verified   |
| ---------------------------------------------------------------------------- | ------------------------------------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------- | ---------- |
| MagicSlides — AI mode (same page, linked above)                              | Video upload; separate converter for online video | PPTX                              | Mixed; depends on input and mode                                                                       | AI-generated deck; vendor says editable PPTX                   | 2026-08-28 |
| [Presentations.AI](https://www.presentations.ai/url-to-ppt)                  | Public URL, including YouTube                     | PPTX, PDF, PNG/JPG, or share link | Not stated on the converter page                                                                       | AI-generated deck; vendor says native editable PPTX            | 2026-08-28 |
| [SlideSpeak](https://slidespeak.co/free-tools/convert-youtube-to-powerpoint) | Public YouTube URL                                | PPTX, PPT, or Google Slides       | Server; tool page says immediate removal, while general privacy policy gives uploads a 180-day default | Transcript-derived AI deck; vendor says editable               | 2026-08-28 |
| [SlidesPilot](https://www.slidespilot.com/youtube-to-ppt)                    | Public YouTube URL                                | PPTX, Google Slides, PDF, or PNG  | Server-side AI analysis; retention not stated                                                          | AI-generated deck with block editor; vendor says editable PPTX | 2026-08-28 |

## Open-source slide extraction

Projects whose documented purpose directly includes extracting presentation
slides from video:

Projects that have stopped receiving commits are listed separately in
[docs/unmaintained.md](https://github.com/larry-xue/awesome-video-to-slides/blob/main/docs/unmaintained.md).


- [video-slide-extractor](https://github.com/larry-xue/video-slide-extractor) - **Maintainer project.** Dependency-free JavaScript detector for browser or
  Node pipelines, and a CLI (`npx video-slide-extractor talk.mp4`) that writes
  one image per detected slide, shelling out to FFmpeg to decode and to
  recapture at source resolution. Images, not PPTX/PDF. MIT; last repository
  push 2026-08-28. Verified 2026-08-28.
- [video2ppt](https://github.com/Wangxs404/video2ppt) - Python tool that turns
  local videos, online videos, and screen recordings into slides. MIT; last
  repository push 2025-11-03. Verified 2026-07-24.
- [video2slides](https://github.com/binh234/video2slides) - Python tool that
  detects slide frames in a video and exports them as a slide deck. MIT; last
  repository push 2024-03-14. Verified 2026-07-24.

## Pipeline building blocks

These are established components for building a converter, not turnkey
video-to-slides products.

### Decode, sample, and detect

- [FFmpeg](https://ffmpeg.org/documentation.html) - Decode videos, sample or
  filter frames, and export images.
- [OpenCV](https://docs.opencv.org/) - Frame differencing, masking, feature
  matching, perspective correction, and image preprocessing.
- [MoviePy](https://zulko.github.io/moviepy/) - Python video reading, cutting,
  sampling, and automation.
- [PySceneDetect](https://www.scenedetect.com/docs/) - Python/CLI shot and
  transition detection; useful as a baseline, though presentation builds often
  need slide-specific deduplication.

### OCR, transcription, and export

- [PptxGenJS](https://gitbrent.github.io/PptxGenJS/) - Generate PPTX files from
  JavaScript in Node or a browser.
- [python-pptx](https://python-pptx.readthedocs.io/) - Create and update PPTX
  files from Python.
- [Tesseract](https://github.com/tesseract-ocr/tesseract) and
  [Tesseract.js](https://github.com/naptha/tesseract.js) - OCR engines for
  extracting text from captured slide images.
- [whisper.cpp](https://github.com/ggml-org/whisper.cpp) - Local speech-to-text
  component for transcripts or timestamped speaker notes.

Pipeline links above were checked against official documentation or source
repositories on 2026-07-15.

## Research and datasets

- [MaViLS](https://github.com/andererka/MaViLS) - Benchmark dataset and a
  multimodal (speech, OCR, and visual features) baseline algorithm for aligning
  video frames to their slides, released with an accompanying paper. Apache-2.0;
  last repository push 2024-09-25. Verified 2026-07-24.

## Guides and evidence

- [How to convert a lecture video to slides](https://github.com/larry-xue/awesome-video-to-slides/blob/main/guides/lecture-video-to-slides.md) - A decision-oriented workflow for recovery, OCR, notes, and export.
- [Verification notes](https://github.com/larry-xue/awesome-video-to-slides/blob/main/docs/verification-notes.md) - Definitions, source log, and known evidence limits for the comparison tables.
- [How to extract slides from a video in JavaScript](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/extract-slides-from-video.md)
- [Frame differencing vs AI for slide extraction](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/frame-differencing-vs-ai.md)

## Contributing

Corrections and additions are welcome. Every core tool submission must include
first-party evidence for its input, output, processing, and editability fields,
plus a verification date. See [CONTRIBUTING.md](CONTRIBUTING.md).

