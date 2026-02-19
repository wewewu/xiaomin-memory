#!/bin/bash
# Memory 自动同步脚本

cd ~/memory

# 检查是否有更改
if git diff --quiet 2>/dev/null && git diff --staged --quiet 2>/dev/null; then
    echo "$(date '+%Y-%m-%d %H:%M'): 无需同步"
    exit 0
fi

# 添加所有更改
git add -A

# 提交
git commit -m "Auto sync: $(date '+%Y-%m-%d %H:%M')" 2>/dev/null

# 推送
git push origin main 2>/dev/null

echo "$(date '+%Y-%m-%d %H:%M'): 已同步到 GitHub"
