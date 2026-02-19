# OpenClaw 版本检查记录

## 检查时间
- **首次检查**: 2026-02-12 00:18 (Asia/Shanghai)
- **本次检查**: 2026-02-17 13:00 (Asia/Shanghai)

---

## 当前版本
- **Version**: 2026.2.14 (latest)
- **检查日期**: 2026-02-17
- **上次版本**: 2026.2.14
- **版本变化**: ❌ 无变化

---

## 功能支持状态

### WAL Protocol (Write-Ahead Log)
- **支持状态**: ❌ 不支持
- **本次检查**: 2026-02-17
- **说明**: 需要 OpenClaw 框架级内置支持

### Working Buffer (Danger Zone Log)
- **支持状态**: ❌ 不支持
- **本次检查**: 2026-02-17
- **说明**: 需要框架级上下文检测机制

### Compaction Recovery (截断恢复)
- **支持状态**: ❌ 不支持
- **本次检查**: 2026-02-17
- **说明**: 需要框架级截断检测

### Autonomous Crons (独立定时任务)
- **支持状态**: ✅ 已实现
- **本次检查**: 2026-02-17
- **说明**: 使用 isolated agentTurn + delivery.mode="none"

---

## 2026.2.14 版本更新内容

### 新增功能
- Telegram: 支持 poll 投票（持续时间、静默发送、匿名控制）
- Slack/Discord: 新增 dmPolicy + allowFrom 配置别名
- Discord: exec 审批可针对频道或 DM+频道
- Sandbox: 新增 sandbox.browser.binds 配置

### Bug 修复
- CLI/Plugins: 修复消息发送后不退出问题
- WhatsApp: 修复账户级 DM policy 覆盖
- Cron: 修复 delivery.to 输出问题
- TUI: 多项稳定性和渲染修复

### ⚠️ 注意
**未包含** WAL/WorkingBuffer/CompactionRecovery 支持

---

## 版本历史

| 日期 | 版本 | 变更 | 支持功能 |
|------|------|------|----------|
| 2026-02-12 | 2026.2.9 | 首次检查 | Autonomous Crons ✅ |
| 2026-02-13 | 2026.2.9 | 无变化 | Autonomous Crons ✅ |
| 2026-02-15 | 2026.2.14 | 升级 | Autonomous Crons ✅ |
| 2026-02-16 | 2026.2.14 | 无变化 | Autonomous Crons ✅ |
| 2026-02-17 | 2026.2.14 | 无变化 | Autonomous Crons ✅ |

---

## 备注
- 等待 OpenClaw 框架级更新以支持 WAL/WorkingBuffer/CompactionRecovery
- **下次检查**: 2026-02-18 13:00 (或 cron 自动触发)
