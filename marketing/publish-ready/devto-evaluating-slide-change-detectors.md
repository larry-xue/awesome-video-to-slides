---
title: "How to evaluate a slide-change detector without fooling yourself"
published: false
description: "A reproducible way to measure precision, recall, duplicate slides, transition frames, and sampling bias in video-to-slides pipelines."
tags: javascript, video, testing, opensource
---

# How to evaluate a slide-change detector without fooling yourself

I maintain [video-slide-extractor](https://github.com/larry-xue/video-slide-extractor),
a small JavaScript frame-differencing package used in a browser video-to-slides
pipeline. The detector is intentionally simple. Evaluating it honestly is not.

The easiest demo is to show a lecture clip, export a plausible deck, and say it
worked. That proves almost nothing.

A detector can produce a good-looking output while missing brief slides,
capturing half-faded transitions, or keeping the same slide five times. It can
also look inaccurate because the evaluator sampled too slowly to ever see the
missing slide.

Here is the protocol I now use.

## First, define the task

Three jobs are often mixed together:

1. **Slide-change detection**: find timestamps where the visible frame changed.
2. **Original-slide recovery**: choose a clean representative image for every
   slide shown in the recording.
3. **Deck generation**: use a transcript or model to create a new presentation.

A frame-difference detector only addresses the first job. It should not get
credit for OCR or export quality, and it should not be blamed for a PowerPoint
writer stretching an image.

## Build ground truth before tuning

Label the source video manually:

```csv
slide_id,start_seconds,end_seconds,notes
1,0.0,42.4,title slide
2,42.4,88.1,incremental bullet builds
3,88.1,123.7,crossfade transition
```

Do this before changing thresholds. Otherwise it is too easy to redefine
"correct" around the output you already have.

Record the source, license, duration, resolution, and access date. If the video
cannot be redistributed, publish the labels and source link instead.

## Freeze the sampling configuration

The sampling interval is part of the detector.

If a slide is visible for 1.4 seconds and you sample every 2 seconds, the
detector cannot recover it. That is a sampling false negative, not a threshold
false negative.

For every run, record:

- sample interval;
- comparison resolution;
- crop or mask;
- detector options;
- runtime and package version.

For `video-slide-extractor`, that looks like:

```js
const detect = createSlideDetector(160, 90, {
  blockSize: 8,
  blockDelta: 14,
  changedRatio: 0.02,
});
```

The defaults are starting points, not an accuracy guarantee.

## Match detections once

Give each detected timestamp a tolerance window, such as two seconds, and match
it to at most one labeled transition.

- A matched detection is a true positive.
- An unmatched detection is a false positive.
- An unmatched label is a false negative.

Then calculate:

```text
precision = TP / (TP + FP)
recall    = TP / (TP + FN)
F1        = 2 * precision * recall / (precision + recall)
```

This catches a common bad evaluation: counting two detections around the same
transition as two successes.

## Score visual usability separately

A timestamp can be correct while the captured image is unusable.

Track at least:

- transition frames;
- consecutive duplicates;
- a slide revisited later;
- low-resolution or blurred captures;
- frames dominated by a presenter or webcam overlay.

I report duplicate rate and transition-frame rate separately from detection F1.
Those failures often belong to temporal cleanup and export-frame selection, not
the first-pass change detector.

## Tag the failure class

The aggregate number tells you whether a version improved. The failure class
tells you what to build next.

Useful tags include:

- incremental build;
- crossfade or wipe;
- cursor/webcam motion;
- camera footage around a screen;
- compression noise;
- repeated earlier slide;
- sample interval too wide.

For example, raising `changedRatio` can reduce cursor-related false positives
while making small text-only changes easier to miss. A single "accuracy" number
hides that tradeoff.

## Compare equal pipelines

When comparing two libraries, use the same decoded frames and sampling interval.
When comparing two finished products, report the entire pipeline instead:

- what input each accepted;
- whether processing was local or remote;
- how much manual cleanup was needed;
- whether the final PPTX contained images, OCR text, or native objects.

Do not rank a transcript-to-new-deck generator against an original-slide
recovery tool as if they produced the same result.

## Publish the failures

The minimum reproducible evidence is:

- ground-truth labels;
- detector configuration;
- detected timestamps;
- metric calculation;
- package/runtime versions;
- known blockers and excluded cases.

I added a reusable version of this protocol to the repository:

[Evaluate a Slide-Change Detector](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/evaluation.md)

The detector itself is zero-dependency JavaScript and accepts ordered RGBA
frames in the browser or Node:

```bash
npm install video-slide-extractor
```

The larger lesson is simple: show the labels, the settings, and the ugly frames.
If a comparison publishes only the winners, it is marketing, not a benchmark.
