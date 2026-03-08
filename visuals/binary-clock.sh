#!/bin/bash

clear
trap 'clear; exit 0' INT TERM

echo ""
echo "BINARY CLOCK"
echo "Press q to quit"
echo ""

to_binary() {
    printf "%04d" $(echo "obase=2; $1" | bc)
}

while true; do
    if read -t 1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            clear
            exit 0
        fi
    fi
    
    tput cup 5 30
    
    time=$(date +"%H:%M:%S")
    hour=$(date +%H)
    min=$(date +%M)
    sec=$(date +%S)
    
    echo "Time: $time"
    echo ""
    
    h_bin=$(to_binary $hour)
    m_bin=$(to_binary $min)
    s_bin=$(to_binary $sec)
    
    echo "Hour:   $h_bin"
    echo "Minute: $m_bin"
    echo "Second: $s_bin"
    
    tput cup 15 25
    echo "Press q to quit"
    
    sleep 1
done
