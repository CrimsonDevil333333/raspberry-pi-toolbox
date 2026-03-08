#!/bin/bash

echo ""
echo "ASCII IMAGE VIEWER"
echo ""

if ! command -v jp2a &> /dev/null && ! command -v img2txt &> /dev/null; then
    echo "Installing required packages..."
    sudo apt install -y jp2a 2>/dev/null || sudo apt install -y caca-utils 2>/dev/null
fi

echo "Enter image path (or q to quit): "
read path

if [[ "$path" == "q" ]]; then exit 0; fi
if [ ! -f "$path" ]; then
    echo "File not found!"
    exit 1
fi

echo "Resizing..."
if command -v jp2a &> /dev/null; then
    jp2a --width=80 "$path"
elif command -v img2txt &> /dev/null; then
    img2txt -W 80 "$path"
else
    echo "No ASCII converter available. Install: sudo apt install jp2a"
fi

echo ""
