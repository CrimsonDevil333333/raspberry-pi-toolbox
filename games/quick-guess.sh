#!/bin/bash

echo ""
echo "🎯 NUMBER GUESSING GAME"
echo ""

target=$((RANDOM % 10 + 1))
attempts=0
max_attempts=3

echo "I'm thinking of a number 1-10"
echo "You have $max_attempts attempts"
echo ""

while [ $attempts -lt $max_attempts ]; do
    echo -n "Guess: "
    read guess
    
    if [[ "$guess" == "q" ]]; then exit 0; fi
    
    attempts=$((attempts + 1))
    
    if [ $guess -eq $target ]; then
        echo "🎉 Won in $attempts attempts!"
        exit 0
    else
        echo "❌ Wrong! Attempts left: $((max_attempts - attempts))"
    fi
done

echo "The number was: $target"
