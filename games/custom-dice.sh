#!/bin/bash

echo ""
echo "🎲 CUSTOM DICE ROLLER"
echo "Press 'q' to quit"
echo ""

while true; do
    echo -n "Number of sides (default 6): "
    read sides
    
    if [[ "$sides" == "q" || "$sides" == "Q" ]]; then
        exit 0
    fi
    
    sides=${sides:-6}
    
    if ! [[ "$sides" =~ ^[0-9]+$ ]] || [ "$sides" -lt 2 ]; then
        echo "Enter a number >= 2"
        continue
    fi
    
    echo -n "Number of dice (default 1): "
    read count
    count=${count:-1}
    
    if ! [[ "$count" =~ ^[0-9]+$ ]] || [ "$count" -lt 1 ]; then
        echo "Enter a number >= 1"
        continue
    fi
    
    total=0
    echo ""
    echo "Rolling $count dice(s) with $sides sides..."
    sleep 0.5
    
    for i in $(seq 1 $count); do
        roll=$((RANDOM % sides + 1))
        total=$((total + roll))
        echo "  Die $i: $roll"
    done
    
    echo ""
    echo "🎯 Total: $total"
    echo ""
done
