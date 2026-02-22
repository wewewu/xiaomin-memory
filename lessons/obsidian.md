---
title: Obsidian聊天记录自动同步配置完成
date: '2026-02-22'
memoryType: lesson
---

**时间**: 2026-02-22
**任务**: 配置 Obsidian 聊天记录自动提取经验

**已完成配置**:
1. Obsidian 自动记录聊天 (每30分钟)
2. ClawVault 有 transcripts 目录
3. 创建 cron 任务: extract_lessons (每4小时运行)
4. 自动提取有价值经验保存到 lessons/

**工作流程**:
- 每30分钟: all-chats-*.md 自动保存
- 每4小时: LLM 提取经验 → clawvault remember lesson
- 手动查看: clawvault search 关键词

**相关命令**:
- clawvault search 经验
- clawvault backlog list
