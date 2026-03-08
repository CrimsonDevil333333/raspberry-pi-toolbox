#!/bin/bash

if [ -z "$1" ]; then
    echo "🎨 ASCII ART GENERATOR"
    echo "Usage: $0 <text>"
    echo ""
    echo "Examples:"
    echo "  $0 HELLO"
    echo "  $0 PI"
    echo "  $0 RASPBERRY"
    exit 1
fi

figlet -f slant "$1" 2>/dev/null || toilet -f term "$1" 2>/dev/null || {
    echo "Install figlet or toilet: sudo apt install figlet"
    echo ""
    echo "Manual ASCII:"
    echo "$1" | tr '[:lower:]' '[:upper:]'
}
