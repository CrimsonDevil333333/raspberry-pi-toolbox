#!/bin/bash

echo ""
echo "🧠 MEMORY INFORMATION"
echo ""

free -h

echo ""
echo "📊 Memory Usage:"
used=$(free | grep Mem | awk '{print $3}')
total=$(free | grep Mem | awk '{print $2}')
pct=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')

echo "Used: $used / $total ($pct%)"

if [ -n "$SWAP TOTAL" ]; then
    echo ""
    echo "💨 Swap:"
    free -h | grep Swap
fi

echo ""
