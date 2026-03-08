#!/bin/bash

echo ""
echo "🧮 NUMBER PUZZLE - Guess the Number"
echo "Press 'q' to quit"
echo ""

target=$((RANDOM % 1000 + 1))
attempts=0

echo "I'm thinking of a number between 1 and 1000"

while true; do
    echo ""
    echo -n "Your guess (q to quit): "
    read guess
    
    if [[ "$guess" == "q" || "$guess" == "Q" ]]; then
        echo "The number was: $target"
        exit 0
    fi
    
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Enter a number!"
        continue
    fi
    
    attempts=$((attempts + 1))
    
    if [ $guess -eq $target ]; then
        echo ""
        echo "🎉 CORRECT! Attempts: $attempts"
        exit 0
    elif [ $guess -lt $target ]; then
        echo "📈 Too low!"
    else
        echo "📉 Too high!"
    fi
done
