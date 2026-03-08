#!/bin/bash

if [ -z "$1" ]; then
    echo "🍕 Pi Pizza Timer 🍕"
    echo "Usage: $0 <minutes>"
    echo ""
    echo "Quick timers:"
    echo "  small   - 7 minutes"
    echo "  medium  - 10 minutes"
    echo "  large   - 15 minutes"
    echo ""
    echo "Press 'q' during countdown to quit"
    exit 0
fi

case "$1" in
    small)  mins=7 ;;
    medium) mins=10 ;;
    large)  mins=15 ;;
    *)      mins=$1 ;;
esac

echo "⏱️  Pizza timer set for $mins minutes"
echo "Press 'q' to cancel"
echo ""

for i in $(seq $mins -1 1); do
    echo -ne "\r🍕 Pizza ready in: $i minutes... "
    
    for s in $(seq 1 59); do
        if read -t 1 -n1 key; then
            if [[ "$key" == "q" || "$key" == "Q" ]]; then
                echo ""
                echo "👋 Timer cancelled!"
                exit 0
            fi
        fi
    done
done

echo ""
echo ""
echo "🔔 DING! 🔔"
echo "🍕🍕🍕 PIZZA IS READY! 🍕🍕🍕"
echo ""

for i in {1..3}; do
    echo -e "\a"
    sleep 0.5
done
