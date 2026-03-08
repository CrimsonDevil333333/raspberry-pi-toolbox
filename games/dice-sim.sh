#!/bin/bash

echo ""
echo "DICE ROLL SIMULATOR"
echo ""

while true; do
    echo -n "Press Enter to roll (q to quit): "
    read -n1 key
    echo ""
    
    if [[ "$key" == "q" || "$key" == "Q" ]]; then
        exit 0
    fi
    
    d1=$((RANDOM % 6 + 1))
    d2=$((RANDOM % 6 + 1))
    
    echo "  [$d1] [$d2]"
    echo "  Total: $((d1 + d2))"
    echo ""
done
