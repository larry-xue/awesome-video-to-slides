# Reddit-Native Drafts

Use one post only where the subreddit rules and ongoing discussion make it
relevant. Keep the disclosure. Do not cross-post identical bodies.

## Draft A: technical discussion

Suggested communities to evaluate: `r/javascript`, `r/computervision`, or a
relevant video-processing community.

Title:

```text
How would you benchmark slide-change detection without counting transition frames as correct?
```

Body:

```text
Disclosure: I maintain a small JS slide-change detector and a browser tool built around it.

I've been trying to make the evaluation less hand-wavy. Showing one lecture that produces a plausible PDF isn't enough, because the output can still contain duplicates, half-faded transitions, or missed short-lived slides.

The protocol I'm using now is:

1. Label the true slide intervals before tuning.
2. Freeze the sample interval, comparison resolution, crop, and detector options.
3. Match each detected timestamp to at most one labeled transition within a tolerance window.
4. Report precision/recall/F1 for transition detection.
5. Separately report duplicate rate and transition-frame rate, because a timestamp can be "correct" while the captured frame is unusable.
6. Tag failures: incremental build, crossfade, cursor/webcam motion, compression, revisited slide, or sampling miss.

The biggest source of misleading results I've found is the sampling interval. If a slide is visible for 1.5 seconds and you sample every 2 seconds, that miss isn't really a threshold failure—the detector never saw it.

For completed products I'd also separate three jobs that often get mixed together:

- detecting a visual change;
- recovering the original slide frames;
- generating a new deck from a transcript.

Does this match how people evaluate scene/shot detectors in practice? I'm especially interested in better ways to score crossfades and incremental bullet builds.

I've put the draft protocol and the small zero-dependency detector here for reproducibility:
https://github.com/larry-xue/video-slide-extractor/blob/master/docs/evaluation.md
```

## Draft B: PowerPoint/user discussion

Suggested communities to evaluate: `r/powerpoint`, `r/edtech`, or a study/lecture
community with suitable self-promotion rules.

Title:

```text
"Editable PowerPoint" from a video can mean three different things
```

Body:

```text
Disclosure: I maintain one of the video-to-slides tools in this space.

I've noticed that "convert this lecture video to an editable PowerPoint" describes at least three different outputs:

1. One captured image on each slide. You can reorder and annotate slides, but the text/chart inside the image isn't editable.
2. The captured image plus an OCR text layer. Text is searchable/selectable, but charts and diagrams are still part of the background image and OCR can be wrong.
3. A deck rebuilt with native text boxes, shapes, and charts. This is the most editable, but also the hardest to recover faithfully from video pixels.

There's also a fourth category that creates a new summary deck from the transcript. Useful, but not the same as getting the slides that actually appeared in the recording.

The quick test is to open the PPTX and click the title. If the entire slide gets selected, it's probably a single image. If you can place a text cursor, there's a text object or OCR layer. Renaming a copy from .pptx to .zip and looking at ppt/media and the slide XML makes the difference even clearer.

For lecture notes, which result do people actually want: exact slide images, searchable OCR text, or a newly summarized deck? I'm putting together a same-video benchmark and want to score the output people care about rather than just "file downloaded successfully."
```

## Comment template for an existing question

```text
There are two jobs that often get mixed together here:

- recover the slides that were actually visible in the lecture;
- generate a new presentation or study guide from the transcript.

For the first, look for slide-change detection plus manual review. Check the exported PPTX: many tools place one screenshot on each slide, while some add an OCR text layer. For the second, a transcript/AI deck tool may be a better fit, but it can paraphrase or omit details.

Disclosure: I maintain Video2Any, which is in the original-slide-recovery category. I would still choose based on the output you need, and I wouldn't upload a private lecture before checking whether the tool processes local files on-device or remotely.
```
