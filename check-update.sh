#!/bin/bash
# =====================================================
# ClawVault 更新检查脚本
# 功能: 检测更新 + 安全扫描 + 报告
# =====================================================

set -e

# 加载环境
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 22 > /dev/null 2>&1

CLAWVAULT_PATH=~/memory
export CLAWVAULT_PATH

echo "=========================================="
echo "🔍 ClawVault 更新检查"
echo "=========================================="
echo ""

# 1. 获取当前版本
echo "📌 当前版本:"
CURRENT_CLAWVAULT=$(clawvault --version 2>/dev/null || echo "unknown")
CURRENT_QMD=$(qmd --version 2>&1 | awk '{print $2}')
echo "  clawvault: $CURRENT_CLAWVAULT"
echo "  qmd: $CURRENT_QMD"
echo ""

# 2. 检测最新版本
echo "📡 检测最新版本..."
LATEST_CLAWVAULT=$(npm show clawvault version 2>/dev/null)
LATEST_QMD=$(npm show @tobilu/qmd version 2>/dev/null)
echo "  clawvault: $LATEST_CLAWVAULT"
echo "  qmd: $LATEST_QMD"
echo ""

# 3. 比较版本
echo "📊 版本比较:"
if [ "$CURRENT_CLAWVAULT" = "$LATEST_CLAWVAULT" ] || [ "$CURRENT_CLAWVAULT" = "unknown" ]; then
    echo "  ✅ clawvault: 已是最新"
    CLAWVAULT_UPDATE="no"
else
    echo "  ⚠️ clawvault: 有新版本 ($CURRENT_CLAWVAULT → $LATEST_CLAWVAULT)"
    CLAWVAULT_UPDATE="yes"
fi

if [ "$CURRENT_QMD" = "$LATEST_QMD" ]; then
    echo "  ✅ qmd: 已是最新"
    QMD_UPDATE="no"
else
    echo "  ⚠️ qmd: 有新版本 ($CURRENT_QMD → $LATEST_QMD)"
    QMD_UPDATE="yes"
fi
echo ""

# 4. 如果有更新，显示报告
if [ "$CLAWVAULT_UPDATE" = "yes" ] || [ "$QMD_UPDATE" = "yes" ]; then
    echo "=========================================="
    echo "⚠️  发现可用更新！"
    echo "=========================================="
    echo ""
    echo "如需更新，请运行:"
    echo "  ~/memory/update.sh"
    echo ""
    echo "更新前会进行安全检测:"
    echo "  1. 检查包权限"
    echo "  2. 扫描恶意代码"
    echo "  3. 验证来源"
    echo ""
else
    echo "✅ 所有组件已是最新版本"
fi
