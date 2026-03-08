#!/bin/bash

clear
trap 'clear; exit 0' INT TERM

while true; do
    if read -t 1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            clear
            exit 0
        fi
    fi
    
    tput cup 5 30
    date +"   %H:%M:%S"
    
    tput cup 10 20
    echo "╔══════════════════════════════╗"
    
    tput cup 11 20
    printf "║  Today: %-19s║" "$(date +'%A, %B %d')"
    
    tput cup 12 20
    printf "║  Time: %-20s║" "$(date +'%H:%M:%S')"
    
    tput cup 13 20
    echo "╚══════════════════════════════╝"
    
    tput cup 20 25
    echo "Press 'q' or Ctrl+C to exit"
    
    sleep 1
done
