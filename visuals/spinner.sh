#!/bin/bash

if [ -z "$1" ]; then
    echo "🎬 ANIMATED SPINNER"
    echo "Usage: $0 [seconds]"
    echo "Shows a loading spinner for specified seconds (default: 5)"
    echo "Press 'q' to quit"
    exit 1
fi

secs=$1
frames=("⠋" "⠉" "⠐" "⠠" "⠢" "⠖" "⠾" "⠷")
i=0

echo ""
while [ $secs -gt 0 ]; do
    if read -t 0.25 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            echo " Done! (cancelled)"
            exit 0
        fi
    fi
    
    printf "\r   Loading ${frames[$((i % 8))]} "
    i=$((i + 1))
    if [ $((i % 4)) -eq 0 ]; then
        secs=$((secs - 1))
    fi
done
echo " Done! ✅"
echo ""
