---
title: Alpaca免费数据方案
date: '2026-02-22'
memoryType: lesson
---

**时间**: 2026-02-09
**问题**: 网络环境无法访问 Binance/Hyperliquid API（超时、被墙）
**约束**: 大哥穷，买不起代理
**方案**: Alpaca Python SDK - 免费、无需 API Key 的加密货币数据

```python
from alpaca.data import CryptoHistoricalDataClient, TimeFrame
client = CryptoHistoricalDataClient()  # 无需 API Key！
```

**成果**: 
- 获取 232 条 ETH 1小时K线数据（10天）
- 定时任务每小时自动推送飞书
- 完全免费，无需代理
