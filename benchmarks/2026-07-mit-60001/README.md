# MIT 6.0001 Video-to-PowerPoint Benchmark

Status: **evidence collection in progress; no ranked article is publishable yet**

Research date: 2026-07-15

Maintainer disclosure: the benchmark author maintains Video2Any,
`video-slide-extractor`, and this Awesome list.

## Question

Given the same recorded lecture, how well does each workflow recover the slides
that appeared in the video, and what does the exported PowerPoint actually
contain?

Transcript-to-new-deck tools are evaluated in a separate track. They must not be
ranked against original-slide recovery using the same accuracy score.

## Fixture

- Course: MIT OpenCourseWare 6.0001, Fall 2016
- Lecture: Lecture 1, "What is Computation?"
- Official source page:
  <https://ocw.mit.edu/courses/6-0001-introduction-to-computer-science-and-programming-in-python-fall-2016/resources/lecture-1-what-is-computation/>
- Low-bandwidth MP4 exposed by the official page:
  <https://archive.org/download/MIT6.0001F16/MIT6_0001F16_Lecture_01_300k.mp4>
- Documented license: CC BY-NC-SA 4.0
- Download size observed on 2026-07-15: 101,137,401 bytes
- SHA-256:
  `06236664b370ca2309aa5e74918a36a39512fad690ad9938d50b776217c02dcf`
- Duration reported by FFprobe: 2,585.964 seconds

Video2Any already publishes a 46-frame extraction from this lecture. That is a
product output, **not independent ground truth**. The label set must be created
by manually reviewing the source video before any precision/recall claim is
published.

## Tracks

### Track A: original-slide recovery

Primary candidates:

- Video2Any
- Video2PPT
- SyncSlide
- Video to Slides (`videotoslides.org`)
- CopySlides

Provisional candidates with conflicting or incomplete public documentation:

- StreamSlide
- SlideStream AI

Baselines:

- `video-slide-extractor` with a frozen FFmpeg sampling pipeline
- MagicSlides Direct Upload interval capture
- Video to Slides Chrome extension, outside the PPTX ranking because it does
  not document PPTX output

### Track B: transcript-to-new-deck generation

- MagicSlides AI mode
- SlideSpeak

This track measures factual coverage, traceability, unsupported content,
structure, and cleanup time. It does not use original-slide recall as its main
score.

## What is verified so far

`candidates.csv` records current first-party claims, free-test availability, and
documentation conflicts. These are **not conversion results**.

The following appear testable without payment:

- Video2PPT: public pages advertise a no-signup free workflow, with limits.
- MagicSlides Direct Upload: official page explicitly advertises free use with
  no sign-in.
- SlideSpeak: its free public-YouTube converter advertises no account.

The following require a live workflow check before inclusion:

- SyncSlide: the no-signup demo is a fixed sample; custom jobs appear
  account-based.
- Video to Slides: a free plan exists, but account/card requirements are not
  explicit on public pages.
- CopySlides: "first video free" is advertised; account/card-free access is not
  explicit.
- StreamSlide and SlideStream AI: public pages contain stale, incomplete, or
  conflicting claims.

No account was created and no card was supplied during this research pass.

### Open-source baseline smoke run

The checked-in runner was exercised against the complete fixture on 2026-07-15:

- FFmpeg sampled one 160x90 RGBA frame every 2 seconds.
- 1,293 frames were passed to `video-slide-extractor` with its default options.
- The detector kept 809 frames.
- Detector commit: `418b0c1570a45e4d32dedc9499ed14194a49f2aa`
- Runtime: Node.js 22.22.3 and FFmpeg 6.1.1-3ubuntu5

This is a reproducibility smoke test, **not an accuracy result**. The high raw
count shows why detector defaults cannot be treated as a product ranking or a
slide count without an independent label set and threshold calibration. The
exact commands are documented in `results/video-slide-extractor-default.md`.

## Recovery-track protocol

1. Download the exact fixture and record SHA-256, byte length, duration, codec,
   and resolution.
2. Create `ground-truth.csv` before changing detector settings. Label one stable
   interval per visually distinct slide and tag incremental builds separately.
3. Run every product using its documented default settings and the same local
   MP4 where supported.
4. If a tool only accepts a public URL, use the official fixture URL and mark
   the input path difference.
5. Save screenshots of the upload/settings/result pages and the raw export.
6. Inspect each PPTX as both a presentation and a ZIP archive.
7. Match each detected slide to at most one ground-truth label.
8. Publish raw counts and blockers before any weighted score.

## Recovery metrics

- Ground-truth slide count
- Detected/exported slide count
- True positives, false positives, false negatives
- Precision, recall, and F1
- Consecutive duplicate count
- Revisited-slide behavior
- Transition-frame count
- Cropped/obscured slide count
- Processing time
- Manual cleanup time
- PPTX model: image-backed, OCR text layer, native-object claim, or new deck
- Processing boundary: local/browser, server, mixed, conflicting, or not stated

Sampling misses must be reported separately. A detector cannot recover a slide
that was never sampled.

## Evidence layout

```text
evidence/<tool>/
  run-notes.md
  settings.png
  result.png
  export.pptx        # only when redistribution is allowed
  export-inspection.md
results/
  recovery-results.csv
  generation-results.csv
```

Do not commit credentials, session cookies, private uploads, or paid exports
whose terms prohibit redistribution.

## Blockers before publication

- Ground-truth intervals have not yet been manually labeled.
- Cross-product exports have not yet been produced.
- Product claims and privacy-policy conflicts have not yet been resolved by
  live network/export inspection.
- A 46-slide Video2Any sample exists, but cannot be used as its own ground truth.

Until these blockers are cleared, the honest public artifact is the protocol
and candidate matrix—not a "best tools" ranking.
