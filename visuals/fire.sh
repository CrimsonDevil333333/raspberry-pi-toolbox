#!/bin/bash

clear
trap 'clear; exit 0' INT TERM

lines=$(tput lines)
cols=$(tput cols)

declare -a screen

init_screen() {
    for ((i=0; i<lines*cols; i++)); do
        screen[$i]=0
    done
}

draw() {
    for ((y=0; y<lines; y++)); do
        for ((x=0; x<cols; x++)); do
            idx=$((y * cols + x))
            val=${screen[$idx]}
            
            if [ $val -gt 0 ]; then
                tput cup $y $x
                colors=('' '1;31' '1;33' '1;35' '1;37')
                c=$((val % 5))
                echo -en "\033[${colors[$c]}m🔥\033[0m"
            fi
        done
    done
}

init_screen

for frame in {1..100}; do
    for i in {1..10}; do
        x=$((RANDOM % cols))
        screen[$(( (lines-1) * cols + x ))]=$((RANDOM % 5 + 1))
    done
    
    for ((y=lines-2; y>=0; y--)); do
        for ((x=0; x<cols; x++)); do
            idx=$((y * cols + x))
            below=$(((y+1) * cols + x))
            
            if [ ${screen[$idx]} -gt 0 ]; then
                screen[$below]=$((screen[$idx] - 1))
                screen[$idx]=0
            fi
        done
    done
    
    draw
    sleep 0.1
done

clear
