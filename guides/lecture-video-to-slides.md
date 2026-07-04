# How to Convert a Lecture Video to Slides

Lecture videos are hard to review because the useful material is often trapped
inside a long recording. A video-to-slides workflow turns that recording into a
deck you can scan, annotate, print, or edit.

This guide covers the practical pipeline for converting a lecture video into
slides without treating the video as a black box.

## Best inputs

This workflow works best when the lecture includes visible slides, shared
screens, whiteboards, or mostly static teaching material.

Good inputs:

- University lecture recordings.
- Webinar replays.
- Zoom, Google Meet, or Microsoft Teams class recordings.
- Loom walkthroughs and product demos.
- MP4 or WebM screen recordings.

Harder inputs:

- Handheld camera footage of a room.
- Highly animated videos.
- Videos where the slides are tiny or blurred.
- Lectures where the instructor constantly covers the slide content.

## Workflow

1. Sample the video every 1-3 seconds.
2. Downsample each sampled frame for fast comparison.
3. Detect when the frame changes enough to represent a new slide.
4. Capture a clean, higher-resolution frame at each detected timestamp.
5. Review the extracted frames and remove duplicates or transition frames.
6. Export the final set to PowerPoint, PDF, or image files.

## Browser-first option

[Video2Any](https://video2any.com) is the easiest browser-first route. Drop the
lecture video into the app, review the detected slides, and export a PowerPoint,
PDF, or image frames. The conversion runs in the browser, so the recording stays
on your device.

## Developer option

If you are building your own pipeline, use
[video-slide-extractor](https://github.com/larry-xue/video-slide-extractor) for
the slide-change detection step.

```js
import { createSlideDetector } from 'video-slide-extractor';

const detect = createSlideDetector(160, 90);

for (const frame of sampledFrames) {
  const result = detect(frame.rgba);
  if (result.keep) {
    console.log('new slide near', frame.time);
  }
}
```

Pair it with tools like FFmpeg, PySceneDetect, MoviePy, PptxGenJS, or
python-pptx depending on whether your stack is JavaScript, Python, or command
line based.

## Quality tips

- Prefer the original recording over a compressed social-media repost.
- Sample more frequently if the lecturer advances slides quickly.
- Capture export frames at higher resolution than the detection frames.
- Review transition frames manually; fades can create halfway images.
- Use OCR only after clean slide frames are extracted.

## Output choices

- PowerPoint `.pptx` if you want editable slide decks.
- PDF if you want handouts or printable notes.
- Image frames if you want to import the slides into another workflow.
- Subtitles or transcripts if you also need speaker notes.

For most lecture recordings, the simplest robust approach is local visual
detection first, then optional OCR or transcription after the slide frames are
clean.
