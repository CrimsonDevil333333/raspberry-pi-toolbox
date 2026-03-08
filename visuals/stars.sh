#!/bin/bash

clear
trap 'clear; exit 0' INT TERM

cols=$(tput cols)
lines=$(tput lines)

star() {
    x=$1 y=$2
    tput cup $y $x
    echo -n "*"
}

elapsed=0
while [ $elapsed -lt 3 ]; do
    if read -t 1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            clear
            exit 0
        fi
    fi
    
    x=$((RANDOM % cols))
    y=$((RANDOM % lines))
    star $x $y &
    elapsed=$((elapsed + 1))
done

clear
