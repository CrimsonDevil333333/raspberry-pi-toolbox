#!/bin/bash

echo ""
echo "💡 COMPUTER TRIVIA"
echo ""

trivia=(
    "Who is known as the first computer programmer?"
    "answer:Ada Lovelace"
    "What does CPU stand for?"
    "answer:Central Processing Unit"
    "In what year was the first iPhone released?"
    "answer:2007"
    "What does HTML stand for?"
    "answer:HyperText Markup Language"
    "Who founded Microsoft?"
    "answer:Bill Gates and Paul Allen"
    "What was the name of the first web browser?"
    "answer:WorldWideWeb"
    "What does RAM stand for?"
    "answer:Random Access Memory"
    "Which company created Linux?"
    "answer:Linus Torvalds"
)

score=0
total=$((${#trivia[@]} / 2))

echo "Test your tech knowledge! Press 'q' to quit"
echo ""

for ((i=0; i<${#trivia[@]}; i+=2)); do
    echo "Q: ${trivia[$i]}"
    echo -n "Answer: "
    read answer
    
    if [[ "$answer" == "q" || "$answer" == "Q" ]]; then
        echo "Score: $score/$total"
        exit 0
    fi
    
    correct="${trivia[$((i+1))]##*:}"
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
