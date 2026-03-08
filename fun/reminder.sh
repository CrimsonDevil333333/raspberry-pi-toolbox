#!/bin/bash

echo ""
echo "⏰ REMINDER"
echo "Press 'q' to quit"
echo ""

echo -n "Message: "
read msg

if [[ "$msg" == "q" ]]; then exit 0; fi
if [ -z "$msg" ]; then echo "No message"; exit 1; fi

echo -n "Minutes: "
read mins

if [[ "$mins" == "q" ]]; then exit 0; fi
mins=${mins:-1}

echo "Timer set for $mins minute(s)..."
echo "Press any key to cancel"

sleep $((mins * 60)) &
pid=$!

if read -t $((mins * 60)) -n1; then
    kill $pid 2>/dev/null
    echo "Cancelled!"
else
    echo ""
    echo "🔔 REMINDER: $msg 🔔"
    for i in {1..3}; do echo -e "\a"; sleep 0.3; done
fi
