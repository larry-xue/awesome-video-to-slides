# 4 条 review 草稿

> 用途：满足 sindresorhus/awesome 的「先 review 4 个 PR」要求。
> **请改成你自己的话再发。** 模板明说不接受纯 AI 生成的内容，而且维护者天天读这些，
> 模板化的东西一眼能看出来。
>
> 关键前提：**「Comments pointing out lint violation are allowed, but does not count
> as a review.」** 所以下面每条我都把 lint 放在最后，主体是内容层面的发现。
> 你如果要删，先删 lint 那部分，别删前面的。
>
> 发布方式：到对应 PR 页面写 comment，或
> `gh pr comment <号> -R sindresorhus/awesome --body-file <文件>`

---

## #4394 Add AI Tokenomics — 建议先发这条

https://github.com/sindresorhus/awesome/pull/4394

```
I went through this one properly and it is in good shape. Two observations and one question.

The entry descriptions are doing more work than most lists in this queue. "ClaudeBar — the README declares MIT but ships no license file, so reuse terms are unclear" is the kind of thing a reader cannot check quickly and would otherwise find out the hard way. Same for noting which tools read local logs versus which phone home. That is a real curation standard, not a paraphrase of each project's tagline.

The structural question is the Contents. Twelve sections are listed, but four of them — Practices, Concepts, Claims, Setups and skills — contain no entries at all. Each is one paragraph and a link into a subdirectory. They sit at the same level as Monitor and Optimize, which carry the actual list. A reader scanning the Contents cannot tell that half those links lead out of the list. Worth considering whether those four belong in Contents at all, or whether they read better grouped under one heading that says what they are.

Smaller thing: there are 79 live shields.io last-commit badges in the readme. They are genuinely useful — staleness is exactly what a reader wants to know — but the readme now depends on an external service rendering on every view, and shields.io does have slow days. Not against any guideline, just worth knowing you have taken that dependency.

I checked the first 40 external links and all resolve. The list clears the 30-day requirement, though only by four days (repo created 2026-07-17, PR opened 2026-08-20), so it is worth being extra responsive to review comments — there is no cushion if this needs another pass.
```

---

## #4396 Add AI Agent Tools

https://github.com/sindresorhus/awesome/pull/4396

```
The main thing I would raise is that the readme does not contain the list.

Under "Skills" the content is a set of counts — "Development: 33", "Productivity: 17", "Content: 12" — rather than entries. The same is true of MCPs, Subagents, Hooks and Plugins. The actual items live across 116 markdown files in subdirectories. Counting unique external links in the readme itself, there are 22, and several of those are badges and repository links rather than list entries.

That matters because a reader arriving from this list expects the readme to be the list. Right now it is an index of a knowledge base, and someone who wants to see what the 33 development skills are has to go browse a directory. I would either pull the entries up into the readme, or be explicit at the top that the readme is a map and the content is in the folders.

Three smaller points:

Quick Stats, What Makes This Different, and Star History are sections about the list rather than about the subject. The guidelines are specific that the description should describe the theme, and these sections are the same pattern one level up.

There are two contribution files in the repo root, CONTRIBUTE.md and contributing.md, with different content. It is not obvious which one is authoritative.

The readme heading opens with a centered div rather than the "# Awesome Name of List" form. It renders fine, but it is worth checking against the heading requirement.

For what it is worth, the repo clears the 30-day rule comfortably and awesome-lint passes.
```

---

## #4392 Add Opsec

https://github.com/sindresorhus/awesome/pull/4392

```
There is a blocker here that is worth knowing before you spend more time on the rest: the repository was created on 2026-08-13 and this PR was opened on 2026-08-20. The requirement is 30 days from the first real commit. That would put the earliest resubmission around 2026-09-12.

That is not a criticism of the work, and the time is probably better spent on content than on waiting. A few things I would use it for:

The link in this PR points at https://github.com/Dev2023-Op/Awesome-OpSec/settings. The settings page is only visible to you — everyone else, including a reviewer, gets a 404. Worth fixing so people can actually reach the list.

The sections are quite thin: Identity Generation has 3 entries, Metadata 2, Steganography 2, VPNs 2, OSes 3. For a subject as well covered as operational security, a reader will wonder what got left out and why. "Curations of the best, not everything" cuts both ways — a section with two entries reads as unfinished rather than selective.

I would also look at whether some entries belong. ThisPersonDoesNotExist described as "A face generator" is a fun link, but its connection to operational security is not stated, and the list does not say what a reader would do with it. Compare that to the anonaddy entry, which explains the actual function. Every entry earning its place is what separates a curated list from a bookmark dump.

One entry has no description at all (cyberchef), and the guidelines ask for a description unless the title is self-explanatory, which that one is not. Also "Bit warden" should be "Bitwarden" — it is one word and that is the project's own spelling.

I checked all 33 external links and none are dead, which is more than several lists in this queue manage.
```

---

## #4388 Add Reverse-Engineered Games

https://github.com/sindresorhus/awesome/pull/4388

```
Two things need addressing before this can be reviewed on its merits.

The repository was created on 2026-08-17 and this PR was opened the same day. The requirement is that the list has been around for at least 30 days. That alone means this cannot go in yet.

More importantly for the content: two of the linked repositories are gone. https://github.com/OpenIGI/OpenIGI returns 404, and so does https://github.com/adolfintel/weltendaemmerung. The OpenIGI link is also listed twice, so the same dead entry appears in two places. Since this is a list about game preservation, a reader is likely to click those specifically — a project that has disappeared is exactly the case they came for. I would check every link before resubmitting rather than only these two; I stopped after sampling 40.

There are 25 duplicate links in total. Some of that is formatting, but duplicates in a curated list usually mean two sections disagree about where something belongs, which is worth resolving as an editorial question rather than a mechanical one.

The heading is "# Awesome Reverse-Engineered Games 🎮🧠". The required form is "# Awesome Name of List", so the emoji would need to come out.

One question rather than a claim: the repo root has an AGENTS.md that describes it as "a curated knowledge base, research repository, and guide system... and AI-assisted binary analysis". The submission guidelines say a list must not be AI-generated. Could you say a bit about how the entries were gathered and verified? If they were checked by hand it is worth stating that in the PR, because a reviewer seeing that file will otherwise wonder.
```
