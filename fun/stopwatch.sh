#!/bin/bash

echo ""
echo "⏱️ STOPWATCH"
echo ""
echo "Press Enter to START or 'q' to quit"
read -n1 key
echo ""

if [[ "$key" == "q" || "$key" == "Q" ]]; then
    exit 0
fi

start_time=$(date +%s)
echo "Running... Press 'q' to stop"

while true; do
    if read -t 0.1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            echo ""
            echo ""
            echo "⏹️  STOPPED"
            exit 0
        fi
    fi
    
    current=$(date +%s)
    elapsed=$((current - start_time))
    printf "\r   %02d:%02d:%02d " $((elapsed/3600)) $((elapsed%3600/60)) $((elapsed%60))
    sleep 1
done
