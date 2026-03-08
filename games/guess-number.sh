#!/bin/bash

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     🎮 CONSOLE GUESS THE NUMBER 🎮   ║"
echo "╚══════════════════════════════════════╝"
echo ""

target=$((RANDOM % 100 + 1))
attempts=0
max_attempts=7

echo "I'm thinking of a number between 1 and 100."
echo "You have $max_attempts attempts to guess it!"
echo ""

while [ $attempts -lt $max_attempts ]; do
    echo -n "Attempt $((attempts + 1))/$max_attempts > "
    read guess
    
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "  ❌ That's not a number!"
        continue
    fi
    
    attempts=$((attempts + 1))
    
    if [ $guess -eq $target ]; then
        echo ""
        echo "  🎉 CORRECT! The number was $target!"
        echo "  You won in $attempts attempt(s)!"
        echo ""
        if [ $attempts -le 3 ]; then
            echo "  🏆 AMAZING! You're a genius!"
        elif [ $attempts -le 5 ]; then
            echo "  ⭐ Great job!"
        else
            echo "  😅 That was close!"
        fi
        exit 0
    elif [ $guess -lt $target ]; then
        echo "  📈 Too low!"
    else
        echo "  📉 Too high!"
    fi
done

echo ""
echo "  💀 GAME OVER!"
echo "  The number was $target"
echo ""
