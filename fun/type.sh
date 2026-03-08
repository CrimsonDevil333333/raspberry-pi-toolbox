#!/bin/bash

if [ -z "$1" ]; then
    echo "⌨️ TYPING EFFECT"
    echo "Usage: $0 <text>"
    echo "Example: $0 'Hello World!'"
    exit 1
fi

text="$*"

for ((i=0; i<${#text}; i++)); do
    echo -n "${text:$i:1}"
    sleep 0.05
done
echo ""
