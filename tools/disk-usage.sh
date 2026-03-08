#!/bin/bash

echo ""
echo "💾 DISK USAGE"
echo ""

echo "📁 Filesystem Usage:"
df -h | grep -v "tmpfs\|loop"

echo ""
echo "📂 Top 10 Directories in Home:"
du -h "$HOME" 2>/dev/null | sort -hr | head -10

echo ""
echo "📦 Largest Files (find top 10):"
find /home -type f -exec du -h {} + 2>/dev/null | sort -hr | head -10

echo ""
