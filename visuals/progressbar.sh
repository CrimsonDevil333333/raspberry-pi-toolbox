#!/bin/bash

if [ -z "$1" ]; then
    echo "📊 PROGRESS BAR DEMO"
    echo "Usage: $0 <seconds>"
    echo "Press 'q' to quit"
    exit 1
fi

total=$1
width=30

echo ""
for ((i=0; i<=total; i++)); do
    if read -t 1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            echo ""
            echo "   ✅ Cancelled!"
            exit 0
        fi
    fi
    
    pct=$((i * 100 / total))
    filled=$((i * width / total))
    empty=$((width - filled))
    
    printf "\r   ["
    printf "%${filled}s" | tr ' ' '█'
    printf "%${empty}s" | tr ' ' '░'
    printf "] %3d%% " "$pct"
done
echo ""
echo "   ✅ Done!"
echo ""
