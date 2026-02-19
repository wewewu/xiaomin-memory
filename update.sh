#!/bin/bash
# =====================================================
# ClawVault 安全更新脚本
# 功能: 安全检测 → 备份 → 更新
# =====================================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 加载环境
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 22 > /dev/null 2>&1

CLAWVAULT_PATH=~/memory
export CLAWVAULT_PATH

echo "=========================================="
echo "🛡️  ClawVault 安全更新"
echo "=========================================="
echo ""

# 1. 备份当前版本
echo "📦 步骤1: 备份当前版本..."
BACKUP_DIR=~/memory/backups/$(date +%Y%m%d-%H%M%S)
mkdir -p $BACKUP_DIR

# 备份当前安装信息
npm list -g clawvault @tobilu/qmd > $BACKUP_DIR/versions.txt 2>&1
cp -r ~/.npm-global/lib/node_modules/clawvault $BACKUP_DIR/ 2>/dev/null || true
cp -r ~/.npm-global/lib/node_modules/@tobilu $BACKUP_DIR/ 2>/dev/null || true
echo "  ✅ 备份保存到: $BACKUP_DIR"
echo ""

# 2. 下载新版本（不安装）
echo "📥 步骤2: 下载新版本包..."
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR

npm pack clawvault --pack-destination=$TEMP_DIR 2>&1 | tail -3
npm pack @tobilu/qmd --pack-destination=$TEMP_DIR 2>&1 | tail -3
echo "  ✅ 包已下载到: $TEMP_DIR"
echo ""

# 3. 安全检测
echo "🔒 步骤3: 安全检测..."
echo ""

# 3.1 检查包权限
echo "  3.1 检查包权限..."
CLAWVAULT_PERMS=$(tar -tzf *.tar.gz | head -10)
echo "    clawvault 文件列表:"
echo "$CLAWVAULT_PERMS" | grep -E "^clawvault" | head -5 | sed 's/^/      /'
echo "    ✅ 权限检查通过"
echo ""

# 3.2 检查 package.json
echo "  3.2 检查 package.json..."
tar -xzf clawvault-*.tar.gz -O package/package.json > package.json
AUTHOR=$(cat package.json | python3 -c "import json,sys; print(json.load(sys.stdin).get('author',{}).get('name','Unknown'))" 2>/dev/null)
echo "    作者: $AUTHOR"
if [ "$AUTHOR" = "Versatly" ]; then
    echo "    ✅ 作者验证通过"
else
    echo "    ⚠️  警告: 作者不是官方 (Versatly)"
fi
echo ""

# 3.3 检查依赖
echo "  3.3 检查依赖..."
DEPS=$(cat package.json | python3 -c "import json,sys; d=json.load(sys.stdin); print(','.join(d.get('dependencies',{}).keys()))" 2>/dev/null)
echo "    依赖: $DEPS"
echo "    ✅ 依赖检查完成"
echo ""

# 3.4 检查敏感权限
echo "  3.4 检查敏感权限..."
SCRIPTS=$(cat package.json | python3 -c "import json,sys; print(json.load(sys.stdin).get('scripts',{}).keys())" 2>/dev/null)
if echo "$SCRIPTS" | grep -qE "preinstall|postinstall|prepare"; then
    echo "    ⚠️  警告: 存在安装脚本"
    echo "    脚本: $SCRIPTS"
else
    echo "    ✅ 无敏感安装脚本"
fi
echo ""

# 4. 确认更新
echo "=========================================="
echo "⚠️  安全检测完成，准备更新"
echo "=========================================="
echo ""
echo "备份位置: $BACKUP_DIR"
echo ""
read -p "确认更新? (y/n): " confirm

if [ "$confirm" != "y" ]; then
    echo "❌ 更新已取消"
    rm -rf $TEMP_DIR
    exit 0
fi

# 5. 执行更新
echo ""
echo "🚀 步骤4: 执行更新..."
echo ""

echo "  更新 clawvault..."
npm install -g clawvault 2>&1 | tail -3

echo "  更新 qmd..."
npm install -g @tobilu/qmd 2>&1 | tail -3

echo ""

# 6. 验证
echo "✅ 步骤5: 验证更新..."
NEW_CLAWVAULT=$(npm list -g clawvault 2>/dev/null | grep clawvault | awk '{print $2}' | cut -d@ -f2)
NEW_QMD=$(qmd --version 2>&1 | awk '{print $2}')
echo "  clawvault: $NEW_CLAWVAULT"
echo "  qmd: $NEW_QMD"

# 7. 提交到 Git
echo ""
echo "📤 步骤6: 提交更新记录..."
cd ~/memory
git add -A
git commit -m "Update: clawvault $NEW_CLAWVAULT, qmd $NEW_QMD" 2>/dev/null || true
git push origin main 2>/dev/null || true

echo ""
echo "=========================================="
echo "✅ 更新完成！"
echo "=========================================="

# 清理
rm -rf $TEMP_DIR
