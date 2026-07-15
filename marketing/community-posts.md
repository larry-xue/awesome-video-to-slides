# Community Posts

> Historical launch copy. For current evidence-led Reddit and platform drafts,
> use [`publish-ready/`](publish-ready/README.md). Do not repost these generic
> launch bodies across multiple communities.

Use these as starting points. Keep the tone transparent and useful. For Reddit and Hacker News, read the community rules before posting.

## Hacker News

### Show HN title options

```text
Show HN: Awesome Video to Slides - tools for extracting slides from videos
```

```text
Show HN: I made a curated list of video-to-slides tools and libraries
```

### First comment

```text
I put this together because "video to slides" is a surprisingly messy search space.

Some tools extract original slide frames from lecture or webinar recordings. Some generate new AI presentations from a transcript. Some are really scene-detection or video-processing libraries. Those are related, but not the same job.

The repo collects browser tools, open-source slide/scene detection libraries, export workflows, OCR/transcription resources, and technical guides:

https://github.com/larry-xue/awesome-video-to-slides

I also maintain an open-source JS detector here:

https://github.com/larry-xue/video-slide-extractor

I would like the list to be genuinely useful, so suggestions for missing open-source tools, academic projects, or practical workflows are welcome.
```

## Reddit

Prefer using this as a comment on relevant threads. If making a post, adapt it to the subreddit and verify rules first.

### r/opensource or r/javascript angle

Title:

```text
I made a curated list of tools and libraries for extracting slides from videos
```

Body:

```text
I have been looking at the "video to slides" space and noticed that a lot of tools solve slightly different problems:

- extracting original slide frames from lecture/webinar videos
- converting recordings into PowerPoint or PDF
- detecting scene changes in video
- generating a new summarized deck from transcript/content
- adding OCR or subtitles after extraction

So I started a focused awesome list:

https://github.com/larry-xue/awesome-video-to-slides

It includes browser tools, open-source video/scene detection libraries, export workflows, OCR/transcription resources, and technical guides.

I also maintain a small zero-dependency JS package for slide-change detection:

https://github.com/larry-xue/video-slide-extractor

I am not trying to make this a link dump. If you know a solid open-source project or workflow that belongs here, I would appreciate suggestions.
```

Suggested flair:

```text
Project / Resource / Showoff
```

Rule reminder:

```text
Verify subreddit self-promotion and flair rules before posting.
```

### Answer template for existing questions

Use this when someone asks how to convert a lecture, webinar, or screen recording into slides.

```text
There are two different workflows here:

1. Recover the original slide frames from the video.
2. Generate a new summarized deck from the video/transcript.

If you need the original slides, use a video-to-slides or slide-change detection workflow. If you need a new deck, use an AI presentation/summarization tool.

I keep a curated list of tools and libraries for this exact problem:

https://github.com/larry-xue/awesome-video-to-slides

For a browser workflow, Video2Any is one option:

https://video2any.com

For developers, the underlying open-source detector is here:

https://github.com/larry-xue/video-slide-extractor
```

## X

### Single post

```text
I made a focused awesome list for turning videos into slides:

- lecture video to PPT/PDF
- webinar to slides
- screen recording to PPT
- slide-change detection libraries
- OCR/transcription workflows

Link in reply.
```

Character count without link: 206

Reply:

```text
Awesome Video to Slides:
https://github.com/larry-xue/awesome-video-to-slides

Open-source JS detector:
https://github.com/larry-xue/video-slide-extractor
```

### Thread

```text
1/5
"Video to slides" is not one problem.

It can mean:
- recover original slide frames
- convert video to PowerPoint
- generate a new AI deck
- detect scene changes
- add OCR/subtitles after extraction
```

```text
2/5
That distinction matters.

If you want the original slides, you need slide-change detection.

If you want a summarized deck, you need transcript + generation.

If you want batch processing, you probably want FFmpeg/PySceneDetect/OpenCV.
```

```text
3/5
I made a curated repo for this:

Awesome Video to Slides

It collects browser tools, open-source libraries, video-to-PPT workflows, OCR/transcription tools, and technical guides.
```

```text
4/5
I also maintain an open-source JS package for slide-change detection:

video-slide-extractor

It is zero-dependency and can be used in browser or Node workflows.
```

```text
5/5
If you know a good open-source project or practical workflow for lecture-to-slides, webinar-to-PDF, or screen-recording-to-PPT, send it over.

I want the list to stay curated, not just collected.
```

Suggested hashtags:

```text
#OpenSource #JavaScript #VideoProcessing
```

## LinkedIn

```text
I put together a curated resource for a surprisingly common workflow: turning video recordings into slides.

The use cases are everywhere:

- lecture video to PowerPoint
- webinar recording to PDF
- screen recording to slide images
- meeting video to searchable notes
- browser-based slide extraction tools

The tricky part is that "video to slides" can mean different things. Sometimes you want to recover the original slide frames. Sometimes you want an AI-generated summary deck. Sometimes you need a developer library for scene or slide-change detection.

I collected the tools, libraries, and workflows here:

https://github.com/larry-xue/awesome-video-to-slides

I also maintain an open-source JavaScript detector for slide and scene changes:

https://github.com/larry-xue/video-slide-extractor

If you know a good tool or open-source project that belongs on the list, I would love to add it.
```

## Dev.to or Hashnode teaser

```text
I wrote a practical comparison of video-to-slides workflows:

- browser tools
- video-to-PowerPoint products
- AI deck generators
- slide-change detection libraries
- FFmpeg/PySceneDetect/OpenCV pipelines

The key question: do you need the original slides, or a new summarized deck?
```
