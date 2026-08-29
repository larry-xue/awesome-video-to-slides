#!/usr/bin/env bash
# Is sindresorhus/awesome accepting comments from us yet?
#
# As of 2026-08-29 the repo is set to "prior contributors only", which blocks
# both the four required PR reviews and the submission itself. That is a repo
# level switch maintainers flip during spam waves; there is no API to read how
# long it lasts without admin rights, so the only way to know is to try.
#
# This posts nothing. It asks GitHub to validate a comment and reads the error.
set -u
PR=$(gh pr list -R sindresorhus/awesome --state open --limit 1 --json number -q '.[0].number' 2>/dev/null)
[ -z "$PR" ] && { echo "无法读取 open PR 列表，先检查 gh auth"; exit 2; }

# --dry-run is not available for pr comment, so probe by asking for the comment
# form's permissions instead: viewerCanUpdate on the PR is false when the
# interaction limit applies to us.
can=$(gh api graphql -f query='
  query($n:Int!){ repository(owner:"sindresorhus",name:"awesome"){
    pullRequest(number:$n){ viewerCanUpdate } } }' -F n="$PR" \
  -q '.data.repository.pullRequest.viewerCanUpdate' 2>/dev/null)

if [ "$can" = "true" ]; then
  echo "✅ 解锁了 — 可以发 review 和提交 PR"
  echo "   草稿: marketing/pr-reviews-draft.md"
  echo "   PR:   marketing/sindresorhus-pr-draft.md"
  echo "   分支: larry-xue/awesome:add-video-to-slides"
  exit 0
fi
echo "🔒 仍然锁着（prior contributors only）— $(date '+%Y-%m-%d %H:%M')"
exit 1
