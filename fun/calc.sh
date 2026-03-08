#!/bin/bash

echo ""
echo "🔢 MATH CALCULATOR"
echo "Press 'q' to quit"
echo ""

echo "Operations: + - * / ^ %"
echo ""

while true; do
    echo -n "Expression (q to quit): "
    read expr
    
    if [[ "$expr" == "q" || "$expr" == "Q" ]]; then
        exit 0
    fi
    
    if [ -n "$expr" ]; then
        result=$(echo "$expr" | bc -l 2>/dev/null)
        if [ $? -eq 0 ]; then
            echo "= $result"
        else
            echo "Invalid expression"
        fi
    fi
done
