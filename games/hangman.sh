#!/bin/bash

words=("PYTHON" "RASPBERRY" "LINUX" "PROGRAMMING" "COMPUTER" "KEYBOARD" "MONITOR" "SOFTWARE" "HARDWARE" "NETWORK" "DATABASE" "SERVER" "TERMINAL" "SHELL" "SCRIPT" "BASH" "ARDUINO" "SENSORS" "ROBOT" "WIFI")

word="${words[$((RANDOM % ${#words[@]}))}"
guessed=()
wrong=0
max_wrong=6
displayed=""

show_hangman() {
    case $wrong in
        0) echo "  +---+"
           echo "  |   |"
           echo "      |"
           echo "      |"
           echo "      |"
           echo "=======" ;;
        1) echo "  +---+"
           echo "  |   |"
           echo "  O   |"
           echo "      |"
           echo "      |"
           echo "=======" ;;
        2) echo "  +---+"
           echo "  |   |"
           echo "  O   |"
           echo "  |   |"
           echo "      |"
           echo "=======" ;;
        3) echo "  +---+"
           echo "  |   |"
           echo "  O   |"
           echo " /|   |"
           echo "      |"
           echo "=======" ;;
        4) echo "  +---+"
           echo "  |   |"
           echo "  O   |"
           echo " /|\\  |"
           echo "      |"
           echo "=======" ;;
        5) echo "  +---+"
           echo "  |   |"
           echo "  O   |"
           echo " /|\\  |"
           echo " /    |"
           echo "=======" ;;
        6) echo "  +---+"
           echo "  |   |"
           echo "  O   |"
           echo " /|\\  |"
           echo " / \\ |"
           echo "=======" ;;
    esac
}

update_display() {
    displayed=""
    for ((i=0; i<${#word}; i++)); do
        char="${word:$i:1}"
        if [[ " ${guessed[@]} " =~ " $char " ]]; then
            displayed+="$char "
        else
            displayed+="_ "
        fi
    done
}

echo ""
echo "==================================="
echo "        🎮 HANGMAN 🎮"
echo "==================================="
echo ""
echo "Word: ${#word} letters"
echo ""
echo "Press 'q' to quit at any time"
echo ""

while [ $wrong -lt $max_wrong ]; do
    show_hangman
    echo ""
    update_display
    echo "   $displayed"
    echo ""
    echo "Wrong: $wrong/$max_wrong | Used: ${guessed[*]}"
    echo ""
    echo -n "Guess a letter > "
    read -n1 guess
    echo ""
    
    if [[ "$guess" == "q" || "$guess" == "Q" ]]; then
        echo ""
        echo "👋 Thanks for playing!"
        exit 0
    fi
    
    guess=$(echo "$guess" | tr '[:lower:]' '[:upper:]')
    echo ""
    
    if [[ -z "$guess" || ! "$guess" =~ [A-Z] ]]; then
        continue
    fi
    
    if [[ " ${guessed[@]} " =~ " $guess " ]]; then
        echo "Already guessed!"
        continue
    fi
    
    guessed+=("$guess")
    
    if [[ "$word" == *"$guess"* ]]; then
        echo "✅ Correct!"
        update_display
        if [[ "$displayed" != *"_"* ]]; then
            echo ""
            show_hangman
            echo ""
            echo "🎉 YOU WIN! The word was: $word"
            echo ""
            exit 0
        fi
    else
        echo "❌ Wrong!"
        wrong=$((wrong + 1))
    fi
done

show_hangman
echo ""
echo "💀 GAME OVER! The word was: $word"
echo ""
