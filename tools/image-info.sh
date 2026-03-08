#!/bin/bash

echo ""
echo "IMAGE INFO"
echo ""

if [ -z "$1" ]; then
    echo "Usage: $0 <image-file>"
    echo "Or enter path:"
    read path
else
    path="$1"
fi

if [ ! -f "$path" ]; then
    echo "File not found: $path"
    exit 1
fi

echo "File: $(basename "$path")"
echo "Size: $(ls -lh "$path" | awk '{print $5}')"
echo "Type: $(file -b "$path")"
echo "Modified: $(stat -c %y "$path" 2>/dev/null | cut -d' ' -f1)"

if command -v identify &> /dev/null; then
    echo "Dimensions: $(identify -format "%wx%h" "$path" 2>/dev/null)"
fi

echo ""
