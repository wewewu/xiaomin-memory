---
title: sudo环境变量
date: '2026-02-22'
memoryType: lesson
---

**时间**: 2026-02-19
**教训**: 配置 sudo 权限后，必须同步配置环境变量！否则 gateway 重启后命令失效（openclaw 命令找不到）
**原因**: sudo 不会继承当前 shell 的环境变量
