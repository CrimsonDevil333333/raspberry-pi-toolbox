#!/bin/bash

clear
trap 'clear; exit 0' INT TERM

cols=$(tput cols)
lines=$(tput lines)

echo -e "\033[2J\033[H"

echo ""
echo "WAVING FLAG"
echo "Press q to quit"
echo ""

chars=(" " "░" "▒" "▓" "█")

frame=0
while [ $frame -lt 100 ]; do
    if read -t 0.1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            clear
            exit 0
        fi
    fi
    
    for y in $(seq 5 $((lines - 5))); do
        tput cup $y 0
        for x in $(seq 10 $((cols - 10))); do
            wave=$((x + frame))
            shade=$((wave % 5))
            echo -n "${chars[$shade]}"
        done
    done
    
    frame=$((frame + 1))
    sleep 0.1
done

clear
