# Awesome Video to Slides

A curated, evidence-linked list of tools and libraries for recovering slides
from recorded presentations or generating a new deck from video content.

These are different jobs:

- **Original-slide recovery** keeps frames or reconstructs content already
  visible in a lecture, webinar, or screen recording.
- **AI deck generation** summarizes a transcript or video into a newly designed
  presentation. It does not recover the original deck.

The distinction matters when comparing fidelity, editability, privacy, and
output quality.

> **Maintainer disclosure:** the list maintainer also maintains
> [Video2Any](https://video2any.com/) and
> [video-slide-extractor](https://github.com/larry-xue/video-slide-extractor).
> Both are marked **Maintainer project** and follow the same inclusion rules as
> other entries. There are no paid placements or affiliate links.

## Contents

- [Original-slide recovery](#original-slide-recovery)
- [AI deck generation](#ai-deck-generation)
- [Open-source slide extraction](#open-source-slide-extraction)
- [Pipeline building blocks](#pipeline-building-blocks)
- [Research and datasets](#research-and-datasets)
- [Guides and evidence](#guides-and-evidence)
- [Contributing](#contributing)

## How to read the tables

- **Processing** reports the product's documented behavior, not an independent
  privacy audit. `Not stated` is used when the official source is unclear.
- **Editability** describes the evidence available: an image-based slide, an
  OCR text layer over an image, or a newly generated deck. A vendor saying
  “editable PPTX” is not treated as proof of native PowerPoint objects.
- **Verified** means the linked first-party page was reachable and supported the
  row on that date. It is not a product endorsement or benchmark result.

The machine-readable subset is available in
[`data/video-tools.json`](data/video-tools.json). Verification method and source
notes are in [`docs/verification-notes.md`](docs/verification-notes.md).

## Original-slide recovery

Use these when the video already contains slides or mostly static shared-screen
content and you want to recover those visuals.

| Tool | Input | Output | Processing | Editability evidence | Verified |
| --- | --- | --- | --- | --- | --- |
| [CopySlides](https://copyslides.com/video-to-slides) | Common local video formats | PPTX or Google Slides | Online workflow; paid desktop conversion is also advertised | Vendor says text boxes and layouts are reconstructed as editable objects | 2026-07-15 |
| [MagicSlides — Direct mode](https://www.magicslides.app/tools/video-to-ppt) | Local MP4, MOV, AVI, or WebM | PPTX | Browser for documented supported formats; server for others | Vendor says editable; object structure not stated | 2026-07-15 |
| [SlideStream AI](https://slidestream.ai/) | Video upload | Downloadable deck; Google Drive/share link | Not stated | Searchable OCR text is documented; deck structure not stated | 2026-07-15 |
| [StreamSlide](https://streamslide.io/video-to-slides) | Local MP4, AVI, MOV, MKV, or WebM | PDF | Browser, according to product page | Image slides | 2026-07-15 |
| [SyncSlide](https://syncslide.com/) | Local MP4, AVI, MOV, MKV, WebM, or FLV; screen recording | PPTX, PDF, Google Slides, or narrated MP4 | Server workflow is documented | Image-faithful visuals with editable speaker notes; native-object reconstruction is not stated | 2026-07-15 |
| [Video to Slides — Chrome extension](https://chromewebstore.google.com/detail/video-to-slides/nldgdhfmnpbmdpaobpgaplhdgojdgllh) | Video playing in a browser tab | PDF, images, or HTML gallery | Browser extension; store listing says no data collection | Image slides | 2026-07-15 |
| [Video to Slides](https://videotoslides.org/) | Local MP4, MOV, WebM, or MKV | PPTX, PDF, or images | Server; product says uploads are removed after processing | Vendor describes OCR-rebuilt editable layouts | 2026-07-15 |
| [Video2Any](https://video2any.com/) **Maintainer project** | Local video, supported video link, or screen recording | PPTX, PDF, images, subtitles | Browser for local video processing; link resolving may use server services | Image-based PPTX; optional local-OCR text layer | 2026-07-15 |
| [Video2PPT](https://video2ppt.com/) | Local video, online video link, or screen recording | PPTX, PDF, HTML, transcript | Product claims local/no-upload paths; privacy policy also covers server uploads retained up to 24 hours, so behavior is mode-dependent | Vendor says text, shapes, and layouts are editable | 2026-07-15 |

## AI deck generation

Use these when you want a summary or redesigned presentation derived from a
video. Output may omit, rewrite, or reorganize the original visual content.

| Tool | Input | Output | Processing | Editability evidence | Verified |
| --- | --- | --- | --- | --- | --- |
| [MagicSlides — AI mode](https://www.magicslides.app/tools/video-to-ppt) | Video upload; separate converter for online video | PPTX | Mixed; depends on input and mode | AI-generated deck; vendor says editable PPTX | 2026-07-15 |
| [Presentations.AI](https://www.presentations.ai/url-to-ppt) | Public URL, including YouTube | PPTX | Not stated on the converter page | AI-generated deck; vendor says native editable PPTX | 2026-07-15 |
| [SlideSpeak](https://slidespeak.co/free-tools/convert-youtube-to-powerpoint) | Public YouTube URL | PPTX or PPT | Server; tool page says immediate removal, while general privacy policy gives uploads a 180-day default | Transcript-derived AI deck; vendor says editable | 2026-07-15 |
| [SlidesPilot](https://www.slidespilot.com/youtube-to-ppt) | Public YouTube URL | PPTX, Google Slides, PDF, or PNG | Server-side AI analysis; product says it does not store source video/audio | AI-generated deck with block editor; vendor says editable PPTX | 2026-07-15 |

## Open-source slide extraction

Projects whose documented purpose directly includes extracting presentation
slides from video:

- [lectures-2-slides](https://github.com/sidharth-anand/lectures-2-slides) -
  Python CLI that batch-converts a directory of lecture videos into per-lecture
  PDF slide decks. MIT; last repository push 2021-10-17. Verified 2026-07-24.
- [slideextract](https://github.com/szanni/slideextract) - C/C++ command-line
  program that compares frames in a selected region and writes one image per
  detected slide. BSD-2-Clause; last repository push 2023-05-06. Verified
  2026-07-15.
- [vid2slides](https://github.com/patrickmineault/vid2slides) - Python tool that
  extracts slides from a talk video. No license declared, so reuse terms are
  unclear; last repository push 2020-11-23. Verified 2026-07-24.
- [video-slide-extractor](https://github.com/larry-xue/video-slide-extractor)
  **Maintainer project** - Dependency-free JavaScript detector for browser or
  Node pipelines, and a CLI (`npx video-slide-extractor talk.mp4`) that writes
  one image per detected slide, shelling out to ffmpeg to decode and to
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

- [How to convert a lecture video to slides](guides/lecture-video-to-slides.md)
  - A decision-oriented workflow for recovery, OCR, notes, and export.
- [Verification notes](docs/verification-notes.md) - Definitions, source log,
  and known evidence limits for the comparison tables.
- [How to extract slides from a video in JavaScript](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/extract-slides-from-video.md)
- [Frame differencing vs AI for slide extraction](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/frame-differencing-vs-ai.md)
- [PySceneDetect documentation](https://www.scenedetect.com/docs/)
- [FFmpeg documentation](https://ffmpeg.org/documentation.html)

## Contributing

Corrections and additions are welcome. Every core tool submission must include
first-party evidence for its input, output, processing, and editability fields,
plus a verification date. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

CC0-1.0. See [LICENSE](LICENSE).
