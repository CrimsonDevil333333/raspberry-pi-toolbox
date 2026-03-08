#!/bin/bash

echo ""
echo "WORD COUNTER"
echo ""

read -p "Text to count: " text

if [ -z "$text" ]; then exit 1; fi

words=$(echo "$text" | wc -w)
chars=$(echo "$text" | wc -c)
chars_no_spaces=$(echo "$text" | tr -d ' ' | wc -c)

echo "Words: $words"
echo "Characters (with spaces): $chars"
echo "Characters (no spaces): $chars_no_spaces"
echo ""
