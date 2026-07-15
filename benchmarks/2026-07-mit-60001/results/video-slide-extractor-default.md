# `video-slide-extractor` Default-Options Smoke Run

Run date: 2026-07-15

This run verifies that the open-source baseline can be reproduced against the
complete fixture. It does not measure precision, recall, or slide accuracy.

## Fixture identity

- File: `MIT6_0001F16_Lecture_01_300k.mp4`
- Bytes: 101,137,401
- Duration reported by FFprobe: 2,585.964 seconds
- SHA-256:
  `06236664b370ca2309aa5e74918a36a39512fad690ad9938d50b776217c02dcf`

## Detector and runtime identity

- `video-slide-extractor` version: 0.1.1
- Git commit: `418b0c1570a45e4d32dedc9499ed14194a49f2aa`
- Node.js: 22.22.3
- FFmpeg: 6.1.1-3ubuntu5

The detector implementation in that commit is the implementation used for the
run. Check out the recorded commit before reproducing the result. Later package
metadata, type declarations, or documentation changes do not alter this result.

## Commands

```bash
ffmpeg -hide_banner -loglevel error -y \
  -i MIT6_0001F16_Lecture_01_300k.mp4 \
  -map 0:v:0 -vf "fps=1/2,scale=160:90" \
  -pix_fmt rgba -f rawvideo fixture-160x90-2s.rgba

node scripts/run-video-slide-extractor.mjs \
  fixture-160x90-2s.rgba 160 90 2 > timestamps.csv
```

The runner imports the sibling checkout of `video-slide-extractor` by default.
Re-run from this benchmark directory inside the `video2any-stuffs` workspace,
or set `VIDEO_SLIDE_EXTRACTOR_MODULE` to a package specifier or file URL. In
either case, use the commit recorded above when reproducing this result.

## Raw result

| Field | Value |
|---|---:|
| Sample interval | 2 seconds |
| Frame dimensions | 160x90 RGBA |
| Sampled frames | 1,293 |
| Kept frames | 809 |

## Interpretation boundary

No independent ground-truth intervals exist yet, so this result must not be
described as 809 recovered slides or used to claim accuracy. It is evidence
that the default detector settings are deliberately generic and need a labeled
evaluation before they can support product comparisons.
