#!/bin/bash

echo ""
echo "QUICK FILE FINDER"
echo ""

read -p "Filename pattern: " pattern

if [ -z "$pattern" ]; then exit 1; fi

echo "Searching in $HOME..."
echo ""

find "$HOME" -name "*$pattern*" -type f 2>/dev/null | head -20

echo ""
