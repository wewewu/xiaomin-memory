# 教训: sudo权限后要配环境变量

**日期**: 2026-02-19
**问题**: 配置 sudo 权限后，gateway 重启后 openclaw 命令失效
**原因**: 没有同步配置环境变量
**解决**: 配置权限后，必须同步配置环境变量到 .bashrc

## 教训
配置系统权限后，必须：
1. 更新 .bashrc 或 .profile 的环境变量
2. 测试命令在新的 shell 中可用
3. 重启 gateway 后验证

---
*from MEMORY.md*
