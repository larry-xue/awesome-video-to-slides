# sindresorhus/awesome 提交草稿

分支已推送：`larry-xue/awesome:add-video-to-slides`（条目在 readme.md 第 570 行，Media 分区末尾）

**提交前必须先做完 4 条 review**，见本文件末尾。

---

## PR 标题（照抄，不要加 Awesome 这个词）

```
Add Video to Slides
```

## PR 正文骨架

> ⚠️ 模板第一条写着「Fully AI-generated pull requests are not accepted」。
> 下面是骨架和事实，**请用你自己的话重写一遍再发**，尤其是「为什么做这个清单」那段——
> 那段只有你能写，也正是维护者在看的东西。

**https://github.com/larry-xue/awesome-video-to-slides**

[这里写：你为什么做这个清单。真实的理由是最好的理由。
可用的事实：你做 video2any 的时候发现，厂商页面把「把录像里原本就有的幻灯片还原出来」
和「让 AI 根据文字稿新写一份 deck」用同样的词在卖，而这两件事的产物完全不同——
一个是讲者当时讲的内容，一个是模型重新写的内容。读者在买单之前分辨不出来。
这个清单就是围绕这个区分组织的，并且每一行都要求有第一方证据和核查日期。]

### 我已经确认的合规项

- 仓库 2026-07-04 建，超过 30 天
- `awesome-lint` 全绿
- 默认分支 `main`
- CC0，`LICENSE` 在根目录，readme 里没有 License 章节
- `contributing.md` 在位，要求每个工具行提供第一方证据和核查日期
- badge 在标题右侧
- `## Contents` 是第一节，不含 Contributing
- topics 有 `awesome` 和 `awesome-list`
- 顶部描述讲的是主题不是清单
- 已停止维护的三个项目（lectures-2-slides、slideextract、vid2slides）移到了
  `docs/unmaintained.md`，主列表只留在维护中的

### 利益披露

我维护清单里的两个条目，Video2Any 和 video-slide-extractor，两者在清单里都标了
**Maintainer project**，和其他条目适用同一条证据规则，没有付费位也没有联盟链接。
披露写在 readme 顶部而不是脚注里。

### 我 review 的 4 个 PR

- #____ ：
- #____ ：
- #____ ：
- #____ ：

---

## 发完 PR 之后

模板在 License 那一节里藏了一条：**在自己的 PR 下面单独评论一个词 `unicorn`**，
用来验证你把指南读完了。很多人漏掉这条。

```bash
gh pr comment <PR号> -R sindresorhus/awesome --body "unicorn"
```

## 提交命令

```bash
cd /tmp/awesome && gh pr create -R sindresorhus/awesome --base main \
  --head larry-xue:add-video-to-slides --title "Add Video to Slides" --body-file <你写好的正文>
```
