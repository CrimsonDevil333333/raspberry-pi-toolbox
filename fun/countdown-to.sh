#!/bin/bash

echo ""
echo "COUNTDOWN TO DATE"
echo ""

read -p "Target date (YYYY-MM-DD): " date

if [ -z "$date" ]; then exit 1; fi

target=$(date -d "$date" +%s 2>/dev/null)
if [ $? -ne 0 ]; then
    echo "Invalid date format"
    exit 1
fi

now=$(date +%s)
diff=$((target - now))

if [ $diff -lt 0 ]; then
    echo "Date is in the past"
else
    days=$((diff / 86400))
    hours=$(((diff % 86400) / 3600))
    mins=$(((diff % 3600) / 60))
    
    echo "Time until $date:"
    echo "  $days days, $hours hours, $mins minutes"
fi

echo ""
