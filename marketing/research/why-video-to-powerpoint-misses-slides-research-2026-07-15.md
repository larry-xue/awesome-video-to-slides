# Research: Why video-to-PowerPoint tools miss slides

Research date: 2026-07-15  
Proposed article: **Why video-to-PowerPoint tools miss slides (and how to test the output)**

## Search intent to serve

Primary intent: a user has already tried extracting slides from a lecture, webinar, or screen recording and wants to know why the PPTX has missing slides, duplicates, or half-faded frames.

Suggested natural-language queries:

- why did video to PowerPoint miss slides
- extract all slides from lecture video
- video to PPT duplicate slides
- remove transition frames from video to slides
- how to test a video slide extractor

These are editorial query hypotheses, not keyword-volume claims. No volume or ranking estimate was verified in this research.

## Verified claims

### 1. Sparse sampling creates a hard recall limit

Video2Any builds a fixed time grid and analyzes frames at those points. Its automatic interval is derived from duration, bounded to roughly 1–6 seconds before the long-video memory guard can widen it further. A slide shown entirely between two sampled timestamps is absent from the detector input, so no later threshold adjustment can recover it.

This is a direct inference from the implementation, and the open-core evaluation guide states the same boundary: a detector cannot recover a slide that was never sampled. FFmpeg's official `fps` filter documentation independently confirms the general mechanics of temporal resampling: frames may be duplicated or dropped to reach a requested frame rate.

Sources:

- [Video2Any extraction implementation: sampling grid and automatic interval](https://github.com/larry-xue/video2any/blob/a571a4147f0eda90a22007d9e87b023b16c2466c/src/engine/extract.js)
- [Video2Any WebCodecs sampling grid](https://github.com/larry-xue/video2any/blob/a571a4147f0eda90a22007d9e87b023b16c2466c/src/engine/wc.js)
- [`video-slide-extractor` evaluation protocol](https://github.com/larry-xue/video-slide-extractor/blob/d4f86e1219c19fe60cdbebc1dbfaa13faf8805cd/docs/evaluation.md)
- [FFmpeg `fps` filter documentation](https://ffmpeg.org/ffmpeg-filters.html#fps)

Claim caveat: this does not mean every video-to-PPT tool samples sparsely, and FFmpeg is not asserted to be part of Video2Any's browser pipeline. The FFmpeg source supports the general frame-dropping behavior of rate conversion; the Video2Any behavior comes from its own source.

### 2. A change threshold trades false negatives for false positives

The open-core detector downsamples frames, divides them into blocks, computes mean absolute RGB change per block, and keeps a frame when the changed-block ratio exceeds `changedRatio`. Raising the threshold can miss small edits such as one changed bullet; lowering it can classify cursor, webcam, animation, or compression movement as a new slide.

PySceneDetect documents the same general threshold problem in a separate implementation: `ContentDetector` compares adjacent-frame content changes against a threshold, while `AdaptiveDetector` uses a rolling average that can reduce false detections during fast camera movement.

Sources:

- [`video-slide-extractor` detector source](https://github.com/larry-xue/video-slide-extractor/blob/d4f86e1219c19fe60cdbebc1dbfaa13faf8805cd/index.js)
- [Video2Any detector calibration and activity-mask source](https://github.com/larry-xue/video2any/blob/a571a4147f0eda90a22007d9e87b023b16c2466c/src/engine/diff.js)
- [PySceneDetect official detector documentation](https://www.scenedetect.com/docs/latest/api/detectors.html)

Claim caveat: PySceneDetect uses different scoring methods, including HSV changes; it is evidence that thresholds and camera motion are recognized detector concerns, not evidence that Video2Any uses PySceneDetect.

### 3. Transitions can produce a timely but unusable frame

A detection timestamp can fall near the correct change while the captured image is still a crossfade, wipe, or partial animation. The repository evaluation guide therefore requires transition-frame captures to be reported separately from timestamp matching. Video2Any's product pipeline attempts to reduce this failure by advancing through unsettled samples and nudging full-resolution capture slightly after a detected change.

PySceneDetect also separates detector types: its official docs describe content detection for fast cuts and an intensity-based `ThresholdDetector` for fades. That distinction supports explaining why a single adjacent-frame rule is not equally suited to every transition style.

Sources:

- [`video-slide-extractor` evaluation protocol](https://github.com/larry-xue/video-slide-extractor/blob/d4f86e1219c19fe60cdbebc1dbfaa13faf8805cd/docs/evaluation.md)
- [Video2Any settling, deduplication, and capture-nudge implementation](https://github.com/larry-xue/video2any/blob/a571a4147f0eda90a22007d9e87b023b16c2466c/src/engine/diff.js)
- [Video2Any capture implementation](https://github.com/larry-xue/video2any/blob/a571a4147f0eda90a22007d9e87b023b16c2466c/src/engine/extract.js)
- [PySceneDetect official detector documentation](https://www.scenedetect.com/docs/latest/api/detectors.html)

Claim caveat: post-processing reduces risk; it does not prove that every fade or animation will settle to a clean frame.

### 4. Motion overlays and camera footage change the meaning of “difference”

Cursor movement, a webcam bubble, a moving presenter, or camera footage around a projected screen may change many pixels without indicating a new slide. Video2Any calibrates an activity mask for persistently moving blocks, but deliberately discards that mask for motion-dominant footage because masking the subject could hide real scene changes.

Sources:

- [Video2Any activity-mask and motion-mode implementation](https://github.com/larry-xue/video2any/blob/a571a4147f0eda90a22007d9e87b023b16c2466c/src/engine/diff.js)
- [PySceneDetect `AdaptiveDetector` documentation](https://www.scenedetect.com/docs/latest/api/detectors.html#scenedetect.detectors.AdaptiveDetector)

Claim caveat: a mask is a mitigation for localized recurring motion, not a general solution for handheld footage, full-screen demos, or animated decks.

### 5. Adjacent-change detection and duplicate removal are separate stages

The open-core package keeps the first frame, compares later frames with the last kept frame, and has no global perceptual deduplication. The Video2Any product adds a later pass that compares kept candidates with earlier output and drops near-identical revisits. The evaluation guide explicitly says these pipeline stages should be scored separately.

Sources:

- [`video-slide-extractor` stateful detector source](https://github.com/larry-xue/video-slide-extractor/blob/d4f86e1219c19fe60cdbebc1dbfaa13faf8805cd/index.js)
- [Video2Any `refineKept` implementation](https://github.com/larry-xue/video2any/blob/a571a4147f0eda90a22007d9e87b023b16c2466c/src/engine/diff.js)
- [`video-slide-extractor` evaluation protocol](https://github.com/larry-xue/video-slide-extractor/blob/d4f86e1219c19fe60cdbebc1dbfaa13faf8805cd/docs/evaluation.md)

Claim caveat: “duplicate” depends on the task. A presenter revisiting the same slide may be noise for a deck export but meaningful evidence in a chronological lecture record.

## Recommended test method for the article

Use a labeled source clip instead of judging one attractive export:

1. Record each real slide's start and end time in a CSV.
2. Freeze the sampling interval, comparison resolution, threshold settings, crop or mask, runtime, and package version.
3. Match each detection to at most one labeled transition within a declared tolerance window.
4. Report precision, recall, F1, and duplicate rate.
5. Audit image quality separately: mark half-faded or otherwise unusable captures even when their timestamps count as matches.
6. Publish labels, detected timestamps, configuration, calculation, and known blockers.

The definitions and reproducibility requirements come directly from the repository's evaluation protocol. A two-second matching window is only its example, not a universal standard.

Source:

- [`video-slide-extractor` evaluation protocol](https://github.com/larry-xue/video-slide-extractor/blob/d4f86e1219c19fe60cdbebc1dbfaa13faf8805cd/docs/evaluation.md)

## Suggested answer-first structure

- **Short version:** missing slides usually come from sampling, thresholding, transitions, motion, or deduplication—not from one generic “AI accuracy” number.
- **Failure map:** symptom → likely pipeline stage → first setting or test to inspect.
- **Five mechanisms:** one section per verified claim above.
- **Five-minute audit:** compare output against 10–20 manually labeled transitions before rerunning a long recording.
- **Disclosure:** state that the author maintains Video2Any and `video-slide-extractor`; do not present this as a neutral third-party benchmark.
- **FAQ:** “Can a lower threshold recover every slide?”, “Why are there duplicate slides?”, “Why is the timestamp correct but the image blended?”, and “Is scene detection the same as slide extraction?”

## Editorial boundaries

- Do not claim that all competing tools use frame differencing, fixed-interval sampling, FFmpeg, or PySceneDetect.
- Do not publish an accuracy percentage without labeled data and a reproducible configuration.
- Do not use “AI” as the explanation unless the specific pipeline stage actually uses a model.
- Distinguish detecting a transition, choosing a clean frame, deduplicating revisits, and constructing a PPTX. Success in one stage does not establish success in the others.
- Describe Video2Any's mask, calibration, settling, and deduplication as implementation attempts or mitigations, not guarantees.
