# Publishing Plan

Audience: international developers, creators, educators, and technical users who search for video-to-slides, lecture-to-slides, video-to-PowerPoint, screen-recording-to-PPT, slide extraction, and browser video processing workflows.

## Platform order

1. Dev.to
2. Hashnode
3. Medium
4. Hacker News
5. Reddit
6. X
7. LinkedIn

## Why this order

Dev.to and Hashnode are the best first surfaces for developer-oriented content. Medium is useful as a republishing surface and backlink, but should not be the only source of record. Hacker News and Reddit should be posted only when the angle is genuinely useful, technical, and discussion-worthy. X and LinkedIn are distribution, not the main SEO asset.

## Canonical strategy

Use the GitHub article file as the canonical source if cross-posting the same article:

```text
https://github.com/larry-xue/awesome-video-to-slides/blob/master/marketing/best-video-to-slides-tools-devto-medium.md
```

For Dev.to, keep the `canonical_url` field in the front matter.

For Hashnode and Medium, set the canonical URL in the publishing settings if available.

If the Dev.to post becomes the strongest public version and gets engagement, future reposts can canonicalize to the Dev.to URL instead.

## Primary article

File:

```text
marketing/best-video-to-slides-tools-devto-medium.md
```

Suggested title:

```text
Best ways to turn video into slides: tools, open-source libraries, and browser workflows
```

Alternative titles:

- Best video-to-slides tools for lectures, webinars, and screen recordings
- How to turn video into slides: tools, libraries, and workflows
- Video to PowerPoint vs slide extraction: which workflow should you use?
- Extract slides from videos: browser tools, JavaScript libraries, and FFmpeg workflows

Suggested tags:

- Dev.to: `video`, `javascript`, `opensource`, `productivity`
- Hashnode: `JavaScript`, `Open Source`, `Video Processing`, `Developer Tools`
- Medium: `Video Processing`, `Open Source`, `Developer Tools`, `Productivity`, `Presentation`

## Link targets

Use these public links only:

- Awesome list: https://github.com/larry-xue/awesome-video-to-slides
- Video2Any: https://video2any.com
- Open-source core: https://github.com/larry-xue/video-slide-extractor
- npm package: https://www.npmjs.com/package/video-slide-extractor

Do not include the private Video2Any source repository.

## Posting notes by platform

### Dev.to

Use the article as-is. Keep the front matter. After publishing, add one comment asking for recommendations:

```text
If you know a good open-source tool or workflow for extracting slides from lecture videos, webinars, or screen recordings, send it here or open a PR on the awesome list.
```

Goal: developer discovery, GitHub stars, package visibility, backlinks.

### Hashnode

Republish the same article with the canonical URL set. Keep the tone practical. Do not turn it into a product announcement.

Goal: extra search surface and developer audience.

### Medium

Republish with canonical. Keep the post outside the paywall so it can be indexed and shared.

Goal: authority surface and long-tail search visibility.

### Hacker News

Do not post the comparison article as the main link. Post the GitHub repo or Video2Any only when the angle is Show HN-worthy.

Best title options:

```text
Show HN: Awesome Video to Slides - tools for extracting slides from videos
```

```text
Show HN: I made a curated list of video-to-slides tools and libraries
```

First comment angle:

- Explain why the list exists.
- Mention the ambiguity between slide extraction, scene detection, and AI deck generation.
- Ask for missing open-source tools.
- Do not ask for upvotes.

### Reddit

Prefer comments on relevant existing threads over a cold promotional post.

Potential subreddits to evaluate manually before posting:

- `r/opensource`
- `r/javascript`
- `r/webdev`
- `r/edtech`
- `r/productivity`
- `r/DataHoarder` if the angle is archiving lectures or preserving recordings

Before posting:

- Check subreddit self-promotion rules.
- Use a discussion title, not a sales title.
- Mention affiliation transparently.
- Ask for missing tools or workflows.

### X

Use X for quick distribution and to ask for additions. Put the link in the first reply if the account has weak reach; use the main post for the hook.

### LinkedIn

Use LinkedIn for the practical productivity angle:

- course creators
- educators
- webinar operators
- product teams with demo recordings
- developers building browser video tools

## Launch checklist

- [ ] Confirm repo description and topics are set on GitHub.
- [ ] Publish Dev.to article.
- [ ] Repost to Hashnode with canonical.
- [ ] Repost to Medium with canonical and no paywall.
- [ ] Share X thread.
- [ ] Share LinkedIn post.
- [ ] Wait for organic comments before posting to Reddit.
- [ ] If posting to HN, use Show HN format and add a technical first comment.
- [ ] Reply to comments and collect suggested tools as issues or PRs.
- [ ] Add new credible tools to the awesome list within 48 hours.

## What not to say

Avoid:

- "The best tool ever"
- "AI-powered magic"
- "Please star this repo"
- "Upvote this"
- "This replaces every other tool"

Use:

- "I made a curated list"
- "I am comparing workflows"
- "What am I missing?"
- "The distinction is original slide extraction vs summarized deck generation"
