#!/bin/bash

echo ""
echo "📏 SYSTEM INFO"
echo ""

echo "🖥️  Hostname: $(hostname)"
echo "🆔 User: $(whoami)"
echo "📂 Home: $HOME"
echo "🐚 Shell: $SHELL"
echo "🗂️  OS: $(uname -s)"
echo "💻 Architecture: $(uname -m)"
echo "📦 Kernel: $(uname -r)"
echo "⏱️  Uptime: $(uptime -p 2>/dev/null || uptime)"
echo ""
