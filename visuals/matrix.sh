#!/bin/bash

width=$(tput cols)
height=$(tput lines)

chars="アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン0123456789"

clear

cols=()
for i in $(seq 1 $width); do
    cols+=($(($RANDOM % height)))
    cols+=($(($RANDOM % 2)))
done

trap 'clear; exit 0' INT TERM

frame=0
while true; do
    for i in $(seq 0 $((width - 1))); do
        if [ "${cols[$((i * 2 + 1))]}" -eq 1 ]; then
            echo -ne "\033[${cols[$((i * 2))]};"$((i + 1))"H\033[32m${chars:$((RANDOM % ${#chars})):1}\033[0m"
            cols[$((i * 2))]=$((cols[$((i * 2))] + 1))
            
            if [ "${cols[$((i * 2))]}" -ge "$height" ]; then
                cols[$((i * 2 + 1))]=0
            fi
        else
            echo -ne "\033[${cols[$((i * 2))]};"$((i + 1))"H\033[37m${chars:$((RANDOM % ${#chars})):1}\033[0m"
            cols[$((i * 2 + 1))]=1
        fi
    done
    
    frame=$((frame + 1))
    if [ $frame -gt 200 ]; then
        break
    fi
    
    sleep 0.05
done

clear
