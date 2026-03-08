#!/bin/bash

echo ""
echo "🪨✂️📜 ROCK PAPER SCISSORS"
echo "Press 'q' to quit"
echo ""

score_wins=0
score_lose=0

while true; do
    echo ""
    echo "Your wins: $score_wins | Computer wins: $score_lose"
    echo ""
    echo -n "Choose (r)ock, (p)aper, (s)cissors, (q)uit: "
    read -n1 choice
    echo ""
    
    if [[ "$choice" == "q" || "$choice" == "Q" ]]; then
        echo "👋 Final Score - You: $score_wins | Computer: $score_lose"
        exit 0
    fi
    
    opts=("rock" "paper" "scissors")
    comp=${opts[$((RANDOM % 3))]}
    
    case "$choice" in
        r|R) user="rock" ;;
        p|P) user="paper" ;;
        s|S) user="scissors" ;;
        *) echo "Invalid choice!"; continue ;;
    esac
    
    echo "You: $user | Computer: $comp"
    
    if [ "$user" == "$comp" ]; then
        echo "🤝 Tie!"
    elif [[ "$user" == "rock" && "$comp" == "scissors" ]] || \
         [[ "$user" == "paper" && "$comp" == "rock" ]] || \
         [[ "$user" == "scissors" && "$comp" == "paper" ]]; then
        echo "🎉 You win!"
        score_wins=$((score_wins + 1))
    else
        echo "💀 You lose!"
        score_lose=$((score_lose + 1))
    fi
done
