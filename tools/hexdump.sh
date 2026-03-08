#!/bin/bash

echo ""
echo "HEXDUMP VIEWER"
echo ""

if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    echo "Or enter file path:"
    read path
else
    path="$1"
fi

if [ ! -f "$path" ]; then
    echo "File not found!"
    exit 1
fi

echo "Showing first 50 lines..."
echo ""
hexdump -C "$path" | head -50

echo ""
