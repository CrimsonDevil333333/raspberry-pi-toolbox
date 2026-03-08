#!/bin/bash

riddles=(
    "I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I?"
    "answer:echo"
    "I have keys but no locks. I have a space but no room. You can enter, but can't go outside. What am I?"
    "answer:keyboard"
    "The more of this there is, the less you see. What is it?"
    "answer:darkness"
    "I belong to you, but others use me more than you do. What am I?"
    "answer:name"
    "I have cities, but no houses. I have mountains, but no trees. I have water, but no fish. What am I?"
    "answer:map"
    "What has to be broken before you can use it?"
    "answer:egg"
    "I'm tall when I'm young, and I'm short when I'm old. What am I?"
    "answer:candle"
    "What is full of holes but still holds water?"
    "answer:sponge"
    "What gets wet while drying?"
    "answer:towel"
)

score=0
total=$(((${#riddles[@]} - 1) / 2))

echo ""
echo "🧩 RIDDLE ME THIS 🧩"
echo "===================="
echo ""

echo "You have $total riddles. Press 'q' to quit anytime!"
echo ""

for ((i=0; i<${#riddles[@]}; i+=2)); do
    riddle="${riddles[$i]}"
    answer="${riddles[$((i+1))]##*:}"
    
    echo "Riddle $(((i/2) + 1))/$total:"
    echo "   $riddle"
    echo ""
    echo -n "Your answer > "
    read guess
    
    if [[ "$guess" == "q" || "$guess" == "Q" ]]; then
        echo ""
        echo "👋 Thanks for playing!"
        echo "   Final Score: $score/$total"
        exit 0
    fi
    
    if [[ "$(echo "$guess" | tr '[:upper:]' '[:lower:]')" == "$(echo "$answer" | tr '[:upper:]' '[:lower:]')" ]]; then
        echo "✅ Correct! The answer is: $answer"
        score=$((score + 1))
    else
        echo "❌ Wrong! The answer is: $answer"
    fi
    echo ""
done

echo "╔══════════════════════════╗"
echo "║  Final Score: $score/$total  ║"
echo "╚══════════════════════════╝"
echo ""
