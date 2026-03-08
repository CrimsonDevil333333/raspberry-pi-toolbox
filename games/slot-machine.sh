#!/bin/bash

echo ""
echo "🎰 SLOT MACHINE 🎰"
echo "Press 'q' to quit"
echo ""

spin() {
    symbols=("🍒" "🍋" "🍊" "🍇" "⭐" "🔔")
    echo -n "  "
    for i in 1 2 3; do
        echo -n "${symbols[$((RANDOM % ${#symbols[@]}))]} "
    done
    echo ""
}

while true; do
    echo -n "Press Enter to spin (q to quit): "
    read -n1 key
    echo ""
    
    if [[ "$key" == "q" || "$key" == "Q" ]]; then
        echo "👋 Thanks for playing!"
        exit 0
    fi
    
    echo ""
    spin
    spin
    spin
    echo ""
done
