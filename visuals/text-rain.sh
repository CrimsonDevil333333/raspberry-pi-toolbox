#!/bin/bash

clear
trap 'clear; exit 0' INT TERM

chars="アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
cols=$(tput cols)

drops=()
for i in $(seq 0 $cols); do
    drops+=($((RANDOM % 10)))
done

frame=0
while [ $frame -lt 150 ]; do
    if read -t 0.05 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            clear
            exit 0
        fi
    fi
    
    for i in $(seq 0 $cols); do
        char="${chars:$((RANDOM % ${#chars})):1}"
        
        if [ "${drops[$i]}" -gt 0 ] 2>/dev/null; then
            tput cup $((drops[$i] - 1)) $i 2>/dev/null
            echo -en "\033[37m$char\033[0m"
        fi
        
        tput cup ${drops[$i]} $i 2>/dev/null
        echo -en "\033[32m$char\033[0m"
        
        rand=$((RANDOM % 20))
        if [ "${drops[$i]}" -gt "$rand" ] 2>/dev/null; then
            drops[$i]=0
        fi
        
        drops[$i]=$((drops[$i] + 1))
    done
    frame=$((frame + 1))
done

clear
