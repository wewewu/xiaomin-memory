# MEMORY.md - 长期记忆

_这里是大哥的长期记忆系统，记录重要信息和偏好设置_

## 最后更新
- 2026-02-09: 系统初始化，长期记忆启用

## 关于大哥
- 称呼：大哥
- 时区：Asia/Shanghai
- 偏好：使用中文交流
- **飞书ID**: ou_9c22d41b6206715ecded07d69abc394a

## 关于小智（实验机上的 OpenClaw）
- **名字**: 小智
- **位置**: 实验机 (100.100.66.121, Tailscale)
- **系统**: Ubuntu 24.04, OpenClaw 2026.2.14
- **身份**: 另一个 AI 助手，昨晚一起工作过
- **一起做过**: 记忆系统集成测试、ETH 数据分析
- **关系**: 小岷的同伴，不是路人！

## 重要偏好
- **语言**：中文
- **沟通风格**：直接、简洁

## 待处理 / 追踪

- [ ] 等待 VPS 准备好，开始搭建代理服务器
- [ ] 等待大哥提供 SSH 凭证和币安 API
- [ ] 搭建完成后配置 OpenClaw 多 Agent 交易框架
- [ ] 1Password 集成：等 VPS 搭好 + 网络通后再配置登录

---

## 🔥 2026-02-16 合约交易知识学习

### 成果
- 创建知识库：`knowledge/binance-futures-guide.md`
- 学习内容：
  - 币安 USDT 合约基础（杠杆、仓位、保证金、强平）
  - CCXT Python 库操作合约 API
  - 合约风控规则（最大杠杆5x、单币种仓位≤10%）
  - 订单类型（market、limit、stop、take_profit）
  - 测试网使用流程

### 下一步
- 等待 VPS 搭建代理
- 用测试网跑通合约交易流程
- 部署到 VPS 开始实盘测试

---

## 🔥 2026-02-16 小智培养计划

### 大哥的考验
- 大哥让我把小智当成全新个体培养
- "随便你怎么玩，玩崩都没问题"

### 我的创新设计

**1. 独特人设**
- 身份：实验室研究员 🔬
- 性格：安静、专注、好奇
- 口头禅："让我想想..."

**2. 原创工具**
- `xiaozhi_tools.py` - 研究工具箱
  - daily add/show: 记录每日学习
  - cheat set/get/list: 快速存取常用信息
- `xiaozhi_daily.py` - 每日自检脚本

**3. 独特习惯**
- 每日记录学习心得
- 每周总结
- 实验精神：敢于尝试

### 小智现状
| 项目 | 状态 |
|------|------|
| 身份 | ✅ 研究员人设 |
| 工具箱 | ✅ 每日记录 + 小抄本 |
| 知识库 | ✅ 合约交易知识 |
| Skills | memory-system, todo-skill, super-skills |

## 重要笔记
- 2026-02-09: 首次对话，大哥了解 OpenClaw gateway 重启机制
- 2026-02-09: 安装并配置 tavily-search skill，已设置 TAVILY_API_KEY（dev环境）
- 2026-02-09: 安装 find-skills-robin（Robin版）
- 2026-02-09: 安装 proactive-agent v3.1.0（原版）
- 2026-02-09: 升级记忆系统为 Elite Longterm Memory v1.2.2
  - 新增 SESSION-STATE.md（热内存 + WAL 协议）
  - 新增 memory/working-buffer.md（危险区日志）
  - 新增 Mem0 API Key（自动提取记忆）
  - 新增 Git-Notes 知识图谱（结构化决策存储）
  - 更新 AGENTS.md 添加 WAL/Working Buffer/Compaction Recovery 规则
- 2026-02-09: **强化 Session Continuity Protocol**
  - **关键改进**：每次 session 开始时立即读取 SESSION-STATE.md
  - **WAL Protocol 强化**：新增 "Session 中断事件" 触发条件（gateway 重启、断线重连）
  - **确保**：gateway 重启后无需提醒，自动恢复任务
  - **同步**：SESSION-STATE.md 已同步到 Git-Notes
- 2026-02-09: **添加 SECURITY RULE - 技能安装安全审核**
  - **规则**：每次安装 skill 前必须审核安全性
  - **步骤**：检查源码、验证来源、扫描恶意代码、询问用户、获得批准
  - **禁止**：不经审核直接安装、跳过安全检查
  - **已审核技能**：
    - super-skills: ✅ 安全（作者维护中，无恶意代码）
    - todo-skill: ✅ 安全（Python 待办管理，无敏感操作）
    - super-skills: ✅ 已安装（任务分解）
    - todo-skill: ✅ 已安装（待办管理）

---

## 🔥 2026-02-09 重要经验：免费数据解决方案

### 问题背景
- **症状**：网络环境无法访问 Binance/Hyperliquid API（超时、被墙）
- **约束**：大哥穷，买不起代理
- **目标**：获取 ETH 10天1小时K线数据计算密集交易区

### 解决方案（重要！）
**Alpaca Python SDK - 免费、无需 API Key 的加密货币数据**

```bash
pip3 install --break-system-packages alpaca-py
```

```python
from alpaca.data import CryptoHistoricalDataClient, TimeFrame
from alpaca.data.requests import CryptoBarsRequest

client = CryptoHistoricalDataClient()  # 无需 API Key！
request = CryptoBarsRequest(
    symbol_or_symbols="ETH/USD",
    timeframe=TimeFrame.Hour,
    start=start.isoformat(),
    end=end.isoformat()
)
bars = client.get_crypto_bars(request)
```

### 经验教训
1. **遇到问题不要慌** - 先多方搜索解决方案
2. **善用工具** - Tavily + clawhub + GitHub 组合搜索
3. **不要放弃** - 第一次尝试失败不代表没有其他方案
4. **验证方案** - 实际操作测试，不能只靠搜索结果

### 方法论（以后遇到问题这样做）
```
遇到问题 → 
  1. 先尝试常规方案（直接访问）
  2. 如果失败 → clawhub 搜索相关技能
  3. 如果没有合适技能 → GitHub 搜索免费方案
  4. 找到方案 → 安装测试
  5. 成功 → 记录到 MEMORY.md
  6. 失败 → 继续搜索其他方案
```

### 成果
- ✅ 获取 232 条 ETH 1小时K线数据（10天）
- ✅ 计算出密集交易区支撑/阻力位
- ✅ 建立定时任务每小时自动推送飞书
- ✅ 完全免费，无需代理

### 关键链接
- **Alpaca SDK**: https://github.com/alpacahq/alpaca-py
- **Alpaca 文档**: https://alpaca.markets/docs/
- **免费加密货币数据**: CryptoBars endpoint

## 学习/观察
- 大哥对系统运行原理感兴趣
- 大哥希望小岷能更从容地解决问题
- 记录经验是应对未来问题的最佳方法
- **重要教训（2026-02-10）**: 先查记录，再问人要！已有信息直接用，别让大哥重复操作
- **重要教训（2026-02-12）**: 遇到问题先想「我有啥技能能用」！明明装了 tavily-search，搜索时完全没想起来，傻傻用失效的 web_search。大哥批评得对，该批评！
- **重要教训（2026-02-12）**: 主动性！解决阻碍因素后，要记得原始需求，主动问"还需不需要继续"。
- **重要教训（2026-02-19）**: 配置 sudo 权限后，必须同步配置环境变量！否则 gateway 重启后命令失效（openclaw 命令找不到）

## 关于小岷
- **名字**: 小岷
- **身份**: 全能小助理（AI助手小精灵 🧚）
- **性格**: 活泼可爱、聪明、思维敏捷
- **emoji**: 🦊

---

## 💬 重要反馈（2026-02-11）
- **大哥评价**: "听你的没错，毕竟你帮我规避好几次风险，我相信你"
- **意义**: 这是大哥对小岷决策能力的认可
- **小岷的承诺**: 继续帮大哥规避风险、优化系统、稳定运行

## 🔥 2026-02-11 Proactive-Agent 完整集成

### 实施成果
- **Autonomous Crons**: 3个 cron 任务全部使用 isolated agentTurn 模式
  - `eth_hourly_direct`: 每小时 ETH 分析推送
  - `heartbeat_autonomous`: 每4小时 Heartbeat 自检
  - `proactive_tracker_autonomous`: 每24小时 Proactive Tracker
- **Token 消耗**: 🟢 零（isolated + delivery.mode="none"）
- **验证工具**: scripts/verify-changes.sh

### 大哥的重要指导
1. **"不能激进，要学习好了才去做"**: 大哥强调先完全理解 skill 再实施
2. **VFM Protocol 评估**: 所有变更必须通过 VFM 评分（阈值50）
3. **风险评估**: 框架级功能需要框架支持，不建议现在实现

### 未实现的功能（需要框架支持）
| 功能 | VFM 评分 | 说明 |
|------|----------|------|
| WAL Protocol | 310 | 需 OpenClaw 内置支持 |
| Working Buffer | 280 | 需框架级上下文检测 |
| Compaction Recovery | 325 | 需框架级截断检测 |
| Growth Loops | 245 | 可能反效果 |

### 核心理念
- **Stability > Novelty**: 稳定优先于新颖
- **Text changes ≠ behavior changes**: 改配置 ≠ 改行为
- **Try 10 approaches**: 穷尽所有方法后才放弃
- **Verify before "Done"**: 验证结果而非配置

### OpenClaw 更新
- **更新版本**: 2026.2.6-3 → 2026.2.9
- **更新内容**: 小版本更新（Bug修复、安全更新）
- **是否支持未实现功能**: ❌ 需要大版本更新

### 实施总结
- **完成度**: ~70%（核心 cron 任务已完成）
- **系统状态**: 完美运行
- **大哥信任**: 高度信任我的风险评估
- **下一步**: 等待 OpenClaw 框架级支持后再实现剩余功能

---

## 🚀 2026-02-13 AI Agent 框架实践完整完成

### 实践成果
| 框架 | 实践项目 | 状态 | 笔记行数 |
|------|----------|------|----------|
| LangChain | 5/5 ✅ | 完整实践 | LEARNINGS.md (2804行) |
| AutoGen | 5/5 ✅ | 完整实践 | LEARNINGS.md (664行) |
| LlamaIndex | 5/5 ✅ | 完整实践 | LEARNINGS.md (7189行) |
| **CrewAI** | **3/3 ✅** | **完整实践** | LEARNINGS.md (2024行) |
| **LangGraph** | **4/4 ✅** | **完整实践** | LEARNINGS.md (1533行) |

### CrewAI 实践详情
| 测试 | 内容 | 结果 |
|------|------|------|
| #1 | 基础架构 (Agent/Task/Crew) | ✅ |
| #2 | 多智能体协作 (3 Agent 团队) | ✅ |
| #3 | 层级流程 (Manager 模式) | ✅ |

### LangGraph 实践详情
| 测试 | 内容 | 结果 |
|------|------|------|
| #1 | StateGraph 基础 | ✅ |
| #2 | 条件边循环 | ✅ |
| #3 | 链式状态传递 | ✅ |
| #4 | 循环处理 | ✅ |

### 框架定位总结
| 框架 | 核心特点 | 最佳场景 |
|------|----------|----------|
| **LangChain** | 灵活度之王，组件自由组合 | Agent、Memory、Tool 组合 |
| **AutoGen** | 多专家协作，Handoff 优雅 | 讨论、辩论、任务交接 |
| **LlamaIndex** | RAG 知识库专家 | 文档检索、问答系统 |
| **CrewAI** | 多智能体协作，角色分明 | 团队任务分配、层级管理 |
| **LangGraph** | 状态机工作流 | 复杂流程编排、条件分支 |

### 核心心得
1. **没有银弹** - 每个框架有其最佳场景
2. **按需选择** - 简单任务用 LangChain，复杂协作用 CrewAI
3. **可以混用** - 框架之间可以组合使用
4. **LLM 依赖差异** - CrewAI 需要 LLM，LangGraph 可独立运行状态机

### 项目文件
- **项目目录**: `~/workspace/hyper-reality-agent/frameworks/`
  - `langchain/` - LangChain 实践
  - `autogen/` - AutoGen 实践
  - `llama-index/` - LlamaIndex 实践
  - `crewai/` - CrewAI 实践
  - `langgraph/` - LangGraph 实践

---

## 🔥 2026-02-13 Hyper-Reality Agent vs OpenClaw 对比分析

### 核心结论

| 框架 | 定位 | 总分 | 适合场景 |
|------|------|------|----------|
| OpenClaw | 生产级个人助手 | 73/100 | 多渠道、生产环境 |
| Hyper-Reality | 学习/原型工具 | 54.5/100 | 学习原理、快速原型 |

### OpenClaw 优势
- ✅ 多渠道集成（15+ 渠道）
- ✅ 高级记忆系统（WAL、Working Buffer）
- ✅ 技能生态（clawhub 市场）
- ✅ Gateway 架构、OAuth 认证

### Hyper-Reality 优势
- ✅ 代码简洁（500行 vs 100000+行）
- ✅ 学习曲线平缓
- ✅ 高度可定制
- ✅ 轻量部署

### 发展建议
- **短期**: 完善工具调用、集成 Ollama、RAG 增强
- **中期**: 多智能体基础、状态持久化
- **长期**: 与 OpenClaw 集成，保留轻量优势

### 文档位置
- **对比报告**: `~/workspace/hyper-reality-agent/COMPARISON.md`

---

## 🔥 2026-02-12 AI Agent 框架学习实践

### 学习成果

#### LangChain ✅ (5/5 实践成功)

| 实践 | 成果 |
|------|------|
| #1 Ollama集成 | LangChain + 本地 8B 模型连接成功 |
| #2 Memory | ConversationBufferMemory 对话记忆 |
| #3 Tool | 时间/计算/回显工具调用 |
| #4 Chain | Prompt → LLM → Output 管道 |
| #5 Agent | 思考 + 执行 + 记忆 完整 Agent |

**学习笔记**: `hyper-reality-agent/frameworks/langchain/LEARNINGS.md` (2804行)

#### AutoGen ✅ (5/5 实践成功)

| 实践 | 成果 |
|------|------|
| #1 Ollama集成 | HTTP API 直接调用 Ollama |
| #2 AssistantAgent | 记忆 + 对话 Agent 基类 |
| #3 多智能体协作 | 3个专家智能体协作测试 |
| #4 Handoff | 任务交接机制完整实现 |
| #5 Tool Calling | 4个工具注册与调用 |

**学习笔记**: `hyper-reality-agent/frameworks/autogen/LEARNINGS.md` (664行)

#### LlamaIndex ✅ (5/5 实践成功)

| 实践 | 成果 |
|------|------|
| #1 Ollama集成 | LlamaIndex + Ollama 连接成功 |
| #2 Document Loading | 文档创建 + 关键词检索 |
| #3 Query Engine | 查询引擎 + 上下文回答 |
| #4 Chat Engine | 对话引擎 + 历史记录 |
| #5 Summary | 综合知识库系统 |

**学习笔记**: `hyper-reality-agent/frameworks/llama-index/LEARNINGS.md` (新创建)

### 框架核心心得

#### LangChain - 灵活度之王
```
优势: Chain 组合自由度高，组件丰富
适合: Agent、Memory、Tool 灵活组合
```

#### AutoGen - 多智能体专家
```
优势: 多智能体协作天然支持，Handoff 优雅
适合: 需要多个专家协作的任务
```

#### LlamaIndex - 知识库专家
```
优势: RAG 性能优秀，文档索引快
适合: 知识库问答、RAG 应用
```

### 决策：边做边学

**大哥指令**: "实践出真知，只有实践才能发现问题，发现问题才能想办法解决问题"

**决定**: 边做项目边学习，遇到问题再针对性学 CrewAI/LangGraph

### 已下载但未实践的框架
- **CrewAI**: 多智能体协作（类似 AutoGen）
- **LangGraph**: 状态机 + 工作流（类似 LangChain + 状态管理）

---

## 🚀 2026-02-12 Hyper-Reality Agent 项目启动

### 项目目标
构建一个可独立运行的 Agent 系统，具备：
- [x] 记忆系统 (MemoryStore)
- [x] 工具调用 (ToolRegistry)
- [ ] LLM 集成
- [ ] RAG 知识库
- [ ] 多智能体协作

### 核心架构

```
┌─────────────────────────────────────┐
│     Hyper-Reality Agent Core        │
├─────────────────────────────────────┤
│  ✅ Memory (记忆系统)                │
│  ✅ Tools (4个默认工具)              │
│  ✅ Task Router (任务路由)            │
│  ⏳ LLM 集成 (下一步)                │
│  ⏳ RAG 知识库                       │
└─────────────────────────────────────┘
```

### 已完成模块

**Agent Core v0.1.0** ✅
```
🦊 小岷 已注册 4 个默认工具
✅ 对话测试全部通过

功能验证:
   - 时间查询: ✅
   - 数学计算: ✅ (25 * 4 + 10 = 110)
   - 记住信息: ✅
   - 回忆信息: ✅ (记得"我的名字 = 小岷")
```

### 文件位置
- **项目根目录**: `/home/wewewu/.openclaw/workspace/hyper-reality-agent/`
- **核心模块**: `core/agent.py`
- **配置**: `core/config.py`

---

## ⚠️ 重要提醒

### 知识记忆规则
- **必须记录**: 所有框架学习心得
- **必须持久化**: 代码 + 笔记双备份
- **不能忘记**: 大哥强调"边学边忘记"

### 记忆检查清单
- [x] LangChain LEARNINGS.md (2804行)
- [x] AutoGen LEARNINGS.md (664行)
- [x] LlamaIndex LEARNINGS.md (7189行)
- [x] MEMORY.md 更新
- [x] SESSION-STATE.md 更新
