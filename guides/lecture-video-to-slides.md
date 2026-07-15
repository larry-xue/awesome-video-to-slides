# How to Convert a Lecture Video to Slides

Start by deciding whether you need the slides that appeared in the recording or
a new summary deck. The pipelines solve different problems.

| Goal | Choose | Expected result |
| --- | --- | --- |
| Recover the lecturer's original visuals | Original-slide recovery | Captured frames, sometimes with OCR text |
| Turn a talk into a concise presentation | AI deck generation | Newly written and designed slides |
| Search or copy text from recovered slides | Recovery, then OCR | Images plus a searchable/editable text layer |
| Add what the lecturer said to each slide | Recovery, then timestamped transcription | Slides paired with transcript excerpts or notes |

See the [main comparison tables](../README.md#original-slide-recovery) before
choosing a hosted tool.

## When recovery works well

The input should contain visible slides, shared screens, whiteboards, or mostly
static teaching material. Original recordings generally work better than
compressed social-media reposts.

Recovery is harder when:

- The presenter or webcam covers a large part of the slide.
- Slides are tiny, blurred, or filmed at an angle.
- Builds and animations change only a small region.
- Crossfades create several transitional frames.
- The recording repeatedly switches between slides and camera footage.

## A reproducible recovery pipeline

1. Decode the video and sample a small comparison frame every 0.5–3 seconds.
2. Mask unstable regions such as a webcam tile, cursor area, or player chrome.
3. Compare the sample with the previous accepted slide.
4. When the difference crosses the chosen threshold, wait for the transition to
   settle and capture a high-resolution frame.
5. Deduplicate against more than the immediately previous frame so revisited
   slides are handled deliberately.
6. Review captures for missed builds, duplicates, and transition frames.
7. Export the accepted frames to images, PDF, or PPTX.
8. Run OCR or transcription only if the use case needs searchable text or notes.

Useful components include [FFmpeg](https://ffmpeg.org/documentation.html) for
decoding, [PySceneDetect](https://www.scenedetect.com/docs/) or a slide-specific
detector for candidate changes, and
[PptxGenJS](https://gitbrent.github.io/PptxGenJS/) or
[python-pptx](https://python-pptx.readthedocs.io/) for export.

## What “editable PPTX” can mean

Before choosing a tool, inspect a sample export. The phrase is used for several
different structures:

1. **Image-based PPTX:** each slide is one screenshot. You can reorder, crop, or
   annotate it, but cannot directly edit the captured text or diagram.
2. **Image plus OCR text layer:** the visual remains a screenshot while detected
   text becomes selectable, searchable, or replaceable. OCR errors and font
   mismatches remain possible.
3. **Reconstructed native objects:** text boxes, shapes, tables, and images are
   rebuilt as PowerPoint objects. This offers more control but may change the
   original layout.
4. **AI-regenerated deck:** a new presentation is written from the transcript or
   video. It may be editable but is not a faithful recovery of the original.

The [verification notes](../docs/verification-notes.md) explain how this
repository labels these cases without treating vendor copy as an independent
test.

## Adding speaker notes

For notes aligned to slides:

1. Transcribe the audio with timestamps.
2. Record the start and end timestamp for each accepted slide.
3. Assign transcript segments to the overlapping slide interval.
4. Keep low-confidence transcript text visibly marked for review.
5. Write the paired text as speaker notes or export a sidecar document.

Slide timing matters more than a polished transcript: a good sentence attached
to the wrong slide is difficult to use.

## Quality checklist

- Count expected slide changes in a short reference segment by hand.
- Report missed slides, duplicates, and transition frames separately.
- Test abrupt cuts, crossfades, animated builds, and revisited slides.
- Inspect the actual PPTX object structure instead of relying on the word
  “editable”.
- Check whether video bytes leave the device if privacy matters; product copy
  alone is not a network audit.
- Respect the video's copyright, access terms, and the presenter's permission.
