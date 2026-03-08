#!/bin/bash

clear
trap 'clear; exit 0' INT TERM

cols=$(tput cols)
lines=$(tput lines)

snake=("10,10" "10,11" "10,12")
food="15,15"
direction="up"
score=0

draw() {
    tput cup 0 0
    echo "Score: $score | Press q to quit"
    
    for ((y=1; y<lines-1; y++)); do
        for ((x=1; x<cols-1; x++)); do
            echo -n " "
        done
        echo ""
    done
    
    for seg in "${snake[@]}"; do
        y=${seg%,*}
        x=${seg#*,}
        tput cup $y $x
        echo -n "O"
    done
    
    fy=${food%,*}
    fx=${food#*,}
    tput cup $fy $fx
    echo -n "*"
}

move_snake() {
    head=${snake[0]}
    hy=${head%,*}
    hx=${head#*,}
    
    case $direction in
        up) hy=$((hy - 1)) ;;
        down) hy=$((hy + 1)) ;;
        left) hx=$((hx - 1)) ;;
        right) hx=$((hx + 1)) ;;
    esac
    
    if [ $hx -lt 1 ] || [ $hx -ge $((cols - 1)) ] || [ $hy -lt 1 ] || [ $hy -ge $((lines - 1)) ]; then
        echo ""
        echo "Game Over! Score: $score"
        exit 0
    fi
    
    new_head="$hy,$hx"
    
    if [ "$new_head" == "$food" ]; then
        score=$((score + 10))
        food="$((RANDOM % (lines-2) + 1)),$((RANDOM % (cols-2) + 1))"
    else
        unset snake[-1]
    fi
    
    snake=("$new_head" "${snake[@]}")
}

while true; do
    if read -t 0.1 -n1 key; then
        case $key in
            w|W) direction="up" ;;
            s|S) direction="down" ;;
            a|A) direction="left" ;;
            d|D) direction="right" ;;
            q|Q) clear; exit 0 ;;
        esac
    fi
    
    move_snake
    draw
    sleep 0.1
done
