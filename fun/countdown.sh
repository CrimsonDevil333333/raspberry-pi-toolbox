#!/bin/bash

if [ -z "$1" ]; then
    echo "⏱️ COUNTDOWN TIMER"
    echo "Usage: $0 <seconds> [message]"
    echo ""
    echo "Examples:"
    echo "  $0 60"
    echo "  $0 300 'Tea is ready!'"
    echo "  $0 10 'Eggs boiled!'"
    echo "Press 'q' to cancel"
    exit 1
fi

secs=$1
message=${2:-"Time's up!"}

echo ""
echo "⏱️  Countdown: $secs seconds"
echo ""

while [ $secs -gt 0 ]; do
    printf "\r   %02d:%02d " $((secs/60)) $((secs%60))
    
    if read -t 1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            echo ""
            echo "👋 Cancelled!"
            exit 0
        fi
    fi
    
    secs=$((secs - 1))
done

echo ""
echo ""
echo "🔔 $message 🔔"
echo ""

for i in {1..3}; do
    echo -e "\a"
    sleep 0.3
done
