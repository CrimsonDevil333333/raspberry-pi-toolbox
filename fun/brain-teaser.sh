#!/bin/bash

echo ""
echo "🧠 BRAIN TEASERS"
echo ""

teasers=(
    "What comes once in a minute, twice in a moment, but never in a thousand years?"
    "answer:The letter 'M'"
    "I have cities, but no houses. I have mountains, but no trees. I have water, but no fish. What am I?"
    "answer:A map"
    "The more you take, the more you leave behind. What am I?"
    "answer:Footsteps"
    "What has keys but no locks?"
    "answer:A piano"
    "What can you hold in your left hand but not in your right?"
    "answer:Your right elbow"
    "What gets wet while drying?"
    "answer:A towel"
)

score=0
total=$((${#teasers[@]} / 2))

echo "Answer the riddles. Press 'q' to quit anytime!"
echo ""

for ((i=0; i<${#teasers[@]}; i+=2)); do
    echo "Riddle: ${teasers[$i]}"
    echo -n "Answer: "
    read answer
    
    if [[ "$answer" == "q" || "$answer" == "Q" ]]; then
        echo "Score: $score/$total"
        exit 0
    fi
    
    correct="${teasers[$((i+1))]##*:}"
    if [[ "$(echo "$answer" | tr '[:upper:]' '[:lower:]')" == "$(echo "$correct" | tr '[:upper:]' '[:lower:]')" ]]; then
        echo "✅ Correct!"
        score=$((score + 1))
    else
        echo "❌ Answer: $correct"
    fi
    echo ""
done

echo "🎉 Final Score: $score/$total"
echo ""
