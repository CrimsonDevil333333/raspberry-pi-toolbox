#!/bin/bash

echo ""
echo "SIMPLE ALARM"
echo ""

read -p "Message: " msg
read -p "Seconds: " secs

if [ -z "$msg" ] || [ -z "$secs" ]; then
    echo "Need message and seconds"
    exit 1
fi

echo "Alarm set for $secs seconds..."

sleep $secs

echo ""
echo "ALARM: $msg"
for i in {1..5}; do echo -e "\a"; sleep 0.2; done
echo ""
