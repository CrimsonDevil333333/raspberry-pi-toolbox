#!/bin/bash

echo ""
echo "🐚 BASH TIPS & TRICKS"
echo ""

tips=(
    "Ctrl+R: Search command history"
    "Ctrl+A: Move to beginning of line"
    "Ctrl+E: Move to end of line"
    "Ctrl+U: Clear line before cursor"
    "Ctrl+K: Clear line after cursor"
    "!!: Repeat last command"
    "!abc: Run last command starting with abc"
    "Ctrl+Z: Suspend current process"
    "fg: Bring suspended process to foreground"
    "mkdir -p dir/subdir: Create nested directories"
    "tar -czvf file.tar.gz dir: Compress directory"
    "du -sh file: Show file/directory size"
    "ps aux | grep process: Find running process"
    "kill -9 PID: Force kill process"
    "watch command: Run command repeatedly"
)

for tip in "${tips[@]}"; do
    echo "  💡 $tip"
done

echo ""
