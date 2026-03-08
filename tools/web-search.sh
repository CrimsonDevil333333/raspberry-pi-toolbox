#!/bin/bash

echo ""
echo "SEARCH THE WEB"
echo ""

read -p "Search query: " query

if [ -z "$query" ]; then exit 1; fi

echo "Opening in browser..."
xdg-open "https://www.google.com/search?q=$query" 2>/dev/null || \
echo "Browser not available. Search URL:"
echo "https://www.google.com/search?q=$query"

echo ""
