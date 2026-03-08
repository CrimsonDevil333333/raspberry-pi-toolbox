#!/bin/bash

echo ""
echo "🎯 SIMON SAYS - MEMORY GAME 🎯"
echo ""
echo "Watch the sequence and repeat it!"
echo "Press Enter to start..."
read

echo "Press 'q' at any time to quit"
echo ""

sequence=()
colors=("🔴 RED" "🔵 BLUE" "🟢 GREEN" "🟡 YELLOW")
colors_simple=("RED" "BLUE" "GREEN" "YELLOW")
score=0

play_sequence() {
    echo ""
    for i in "${sequence[@]}"; do
        echo "   ${colors[$i]}"
        sleep 0.5
        echo "   ..."
        sleep 0.3
    done
}

get_input() {
    echo ""
    echo "Your turn! Enter 0=Red, 1=Blue, 2=Green, 3=Yellow (or q to quit)"
    echo -n "> "
    read guess
    
    if [[ "$guess" == "q" || "$guess" == "Q" ]]; then
        echo ""
        echo "👋 Game aborted!"
        echo "   Final Score: $score"
        exit 0
    fi
    
    if [ "$guess" != "${sequence[$((score))]}" ]; then
        echo ""
        echo "❌ WRONG!"
        echo "   Game Over!"
        echo ""
        echo "   Final Score: $score"
        echo ""
        exit 0
    fi
}

while true; do
    sequence+=($((RANDOM % 4)))
    score=$((score + 1))
    
    echo ""
    echo "=== Level $score ==="
    play_sequence
    get_input
    
    echo "✅ Correct!"
    sleep 1
done
