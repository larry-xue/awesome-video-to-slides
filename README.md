# Awesome Video to Slides

A curated list of tools, libraries, and workflows for extracting slides from videos, screen recordings, lectures, webinars, and meeting recordings.

Use this list when you want to convert video to PowerPoint, extract slides from a lecture recording, detect slide changes in a screen recording, turn webinar videos into notes, or build your own video-to-slides pipeline.

## Contents

- [Video to PowerPoint Tools](#video-to-powerpoint-tools)
- [Open Source Slide and Scene Detection](#open-source-slide-and-scene-detection)
- [Screen Recording and Video Capture](#screen-recording-and-video-capture)
- [Browser Export and Document Generation](#browser-export-and-document-generation)
- [Presentation and Slide Workflows](#presentation-and-slide-workflows)
- [OCR, Transcription, and Notes](#ocr-transcription-and-notes)
- [Technical Guides](#technical-guides)
- [Related Searches](#related-searches)
- [Contributing](#contributing)

## Video to PowerPoint Tools

- [Video2Any](https://video2any.com) - Convert videos, screen recordings, and meeting recordings into editable PowerPoint decks, PDFs, image frames, and subtitles in the browser. Files stay on your device. Maintainer project.
- [MagicSlides Video to PPT Converter](https://www.magicslides.app/tools/video-to-ppt) - Online video-to-PowerPoint tool for turning uploaded or linked videos into slides.
- [SlideSpeak YouTube to PowerPoint](https://slidespeak.co/free-tools/convert-youtube-to-powerpoint) - Tool for converting YouTube videos into presentation slides.
- [Video2PPT](https://video2ppt.com/) - Video-to-PowerPoint converter for MP4, YouTube, and screen recordings.

## Open Source Slide and Scene Detection

- [video-slide-extractor](https://github.com/larry-xue/video-slide-extractor) - Zero-dependency JavaScript library for detecting slide and scene changes from video frames in the browser or Node. Maintainer project.
- [PySceneDetect](https://www.scenedetect.com/) - Python tool and library for detecting shot changes and splitting videos into scenes.
- [FFmpeg](https://ffmpeg.org/) - Command-line toolkit for decoding, sampling, trimming, and exporting video frames.
- [OpenCV](https://opencv.org/) - Computer vision library often used for frame differencing, template matching, OCR preprocessing, and video analysis.
- [MoviePy](https://zulko.github.io/moviepy/) - Python video editing automation library for cutting, sampling, compositing, and processing video files.

## Screen Recording and Video Capture

- [OBS Studio](https://obsproject.com/) - Free and open source software for video recording and live streaming, useful for creating screen recordings that can later be converted into slides.
- [Loom](https://www.loom.com/) - Screen and camera recording tool often used for product walkthroughs, async demos, and training videos.
- [Remotion](https://www.remotion.dev/) - React framework for creating programmatic videos and automations, useful when generated video content later needs frame or slide extraction.

## Browser Export and Document Generation

- [PptxGenJS](https://gitbrent.github.io/PptxGenJS/) - JavaScript library for creating PowerPoint `.pptx` files in the browser or Node.
- [python-pptx](https://python-pptx.readthedocs.io/) - Python library for creating, reading, and updating PowerPoint `.pptx` files.
- [jsPDF](https://github.com/parallax/jsPDF) - JavaScript PDF generation library for browser and Node workflows.
- [JSZip](https://stuk.github.io/jszip/) - JavaScript library for creating ZIP archives, useful for exporting extracted slide images.

## Presentation and Slide Workflows

- [Google Slides](https://www.google.com/slides/about/) - Browser-based presentation editor that can open `.pptx` exports from video-to-slides tools.
- [LibreOffice Impress](https://www.libreoffice.org/discover/impress/) - Open source presentation editor for creating and editing slide decks, including PowerPoint-compatible workflows.
- [Marp](https://marp.app/) - Markdown presentation ecosystem for creating slide decks from Markdown.
- [reveal.js](https://revealjs.com/) - Open source HTML presentation framework for building web-based slide decks.

## OCR, Transcription, and Notes

- [Tesseract.js](https://tesseract.projectnaptha.com/) - JavaScript OCR library that runs in the browser or Node and recognizes text from images.
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract) - Open source OCR engine for extracting text from slide images and screenshots.
- [whisper.cpp](https://github.com/ggml-org/whisper.cpp) - C/C++ port of Whisper for local speech-to-text transcription.

## Technical Guides

- [How to extract slides from a video in JavaScript](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/extract-slides-from-video.md) - Browser workflow for sampling frames and detecting slide changes.
- [How video to PowerPoint conversion works](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/video-to-powerpoint.md) - Overview of the detect, capture, and export pipeline.
- [Detect slide changes in screen recordings](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/screen-recording-to-slides.md) - Notes for Zoom, Teams, Meet, Loom, and browser recording workflows.
- [Frame differencing vs AI for slide extraction](https://github.com/larry-xue/video-slide-extractor/blob/master/docs/frame-differencing-vs-ai.md) - When simple local visual detection is enough, and when OCR or AI helps.
- [How to convert a lecture video to slides](guides/lecture-video-to-slides.md) - Practical workflow for turning recorded classes, talks, and training videos into slide decks.
- [PySceneDetect documentation](https://www.scenedetect.com/docs/) - Documentation for command-line and Python scene detection workflows.
- [FFmpeg documentation](https://ffmpeg.org/documentation.html) - Reference for decoding video, extracting frames, and converting formats.

## Related Searches

People looking for this topic often search for:

- video to slides
- video to PowerPoint
- video to PPT
- extract slides from video
- lecture video to slides
- webinar to slides
- screen recording to PowerPoint
- Zoom recording to slides
- YouTube video to PowerPoint
- scene detection for slide extraction

## Contributing

Pull requests are welcome. Please add tools, libraries, or guides that are directly useful for video-to-slides, slide extraction, scene detection, OCR, transcription, or presentation export workflows.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the curation rules.

## License

CC0-1.0. See [LICENSE](LICENSE).
