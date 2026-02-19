#!/bin/bash
# 快速记忆脚本

HOME_DIR=$HOME
CLAWVAULT_PATH=$HOME_DIR/memory
export CLAWVAULT_PATH

if [ -z "$1" ]; then
    echo "用法: ./remember.sh <category> <content>"
    echo "分类: people, lessons, preferences, decisions, projects, patterns, goals"
    exit 1
fi

CATEGORY=$1
shift
CONTENT="$@"

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
FILE="$HOME_DIR/memory/$CATEGORY/${TIMESTAMP}.md"

# 创建文件
echo "# $CONTENT" > "$FILE"
echo "" >> "$FILE"
echo "**日期**: $(date '+%Y-%m-%d %H:%M')" >> "$FILE"
echo "**时间戳**: $TIMESTAMP" >> "$FILE"

# 更新索引
qmd update > /dev/null 2>&1

echo "✅ 已记录: [$CATEGORY] $CONTENT"
echo "📁 文件: $FILE"
