# Publishing Plan

Updated: 2026-07-15

Audience: international developers, educators, students, creators, and
technical users evaluating video-to-slides, lecture-to-slides,
video-to-PowerPoint, screen-recording-to-PPT, and slide-change detection.

## Current state

- The DEV article "How I Built a Browser-Based Video to PowerPoint Converter"
  was published on 2026-07-04 and is indexed.
- Video2Any already has owned blog coverage for MP4, WebM, YouTube-to-PPT,
  privacy/local processing, the product workflow, best-video-to-PPT, and GIF.
- The next asset is a reproducible common-corpus benchmark, not another generic
  listicle.
- `best-video-to-slides-tools-devto-medium.md` is now a source draft. Do not
  publish it unchanged or canonicalize new articles to a GitHub blob page.

## Publication order

1. Video2Any owned blog: full benchmark or cornerstone article.
2. GitHub: test protocol, labels, CSV/JSON results, screenshots, and samples.
3. DEV Community: a distinct technical derivative.
4. Reddit: one complete community-native data or discussion post.
5. YouTube long-form: visual proof and exported-file inspection.
6. Medium **or** Hashnode: one audience-specific article or canonical repost.
7. Hacker News: only for a genuinely new benchmark dataset or open-source
   release.

## Canonical strategy

Owned articles should be published on `video2any.com` first and use a
self-referential canonical URL.

When substantially the same article is imported to DEV, Medium, or Hashnode,
set its canonical/original URL to the owned article. Do not point canonical URLs
at Markdown blob pages in GitHub.

A genuinely distinct technical article can keep its platform URL as canonical
while linking naturally to the owned evidence and repository.

Reddit and YouTube do not provide a cross-domain article canonical workflow.
Treat them as complete native content and referral/discussion surfaces, not
guaranteed link-equity sources.

## Content rules

- Disclose: "I maintain Video2Any and video-slide-extractor."
- Distinguish product claims from hands-on measurements.
- Record test date, source, plan, device, defaults, and blockers.
- Separate original-slide recovery from transcript-to-new-deck generation.
- Name the PPTX model: image-backed, OCR text layer, or native objects.
- Include failures, limitations, and who should use another workflow.
- Keep every platform post useful without requiring a click.
- Use one or two contextual links instead of repeated optimized anchors.

## Current publish-ready files

- `publish-ready/devto-evaluating-slide-change-detectors.md`
- `publish-ready/medium-video-to-powerpoint-three-workflows.md`
- `publish-ready/reddit-native-posts.md`
- `publish-ready/youtube-editable-pptx-script.md`
- Owned article draft:
  `../../video2any/marketing/blog/editable-pptx-is-overloaded.md`

## Benchmark gate

Do not publish a ranked comparison until all of the following exist:

- ground-truth slide labels;
- a frozen common input and test environment;
- raw detected timestamps or exports;
- missed-slide, duplicate, and transition-frame counts;
- a processing/privacy classification backed by current sources;
- blockers marked as blockers rather than inferred results;
- a disclosure that Video2Any is maintained by the author.

If an account, card, or unsupported input prevents a test, report `not tested`
and the exact blocker. Do not convert a landing-page claim into a measured score.

## Launch checklist

- [ ] Complete the benchmark protocol and candidate matrix.
- [ ] Run the no-account baselines and save raw evidence.
- [ ] Record account/payment blockers for the remaining tools.
- [ ] Publish the full owned article and confirm its rendered HTML, canonical,
      sitemap entry, and internal links.
- [ ] Publish the GitHub evidence package.
- [ ] Publish the DEV technical derivative.
- [ ] Post one subreddit-specific discussion after checking current rules.
- [ ] Record and publish the long-form YouTube proof video.
- [ ] Ask included maintainers for factual corrections, not reciprocal links.
- [ ] Measure referring domains, branded queries, engaged sessions, GitHub
      activity, and conversions.

## Public links

- Awesome list: https://github.com/larry-xue/awesome-video-to-slides
- Video2Any: https://video2any.com
- Open-source core: https://github.com/larry-xue/video-slide-extractor
- npm package: https://www.npmjs.com/package/video-slide-extractor

Do not include the private Video2Any source repository in public material.
