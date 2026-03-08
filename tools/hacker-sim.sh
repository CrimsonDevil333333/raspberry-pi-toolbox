#!/bin/bash

echo ""
echo "╔════════════════════════════════════════╗"
echo "║     👾 HACKER TERMINAL 👾             ║"
echo "╚════════════════════════════════════════╝"
echo ""

actions=(
    "Scanning ports..."
    "Brute forcing SSH..."
    "Injecting SQL payload..."
    "Bypassing firewall..."
    "Decrypting passwords..."
    "Downloading shadow file..."
    "Installing backdoor..."
    "Covering tracks..."
    "Scanning network..."
    "Exploiting vulnerability..."
)

echo "Starting hack on target: $(shuf -i 1-255 | head -1).$(shuf -i 1-255 | head -1).$(shuf -i 1-255 | head -1).$(shuf -i 1-255 | head -1)"
echo ""

for i in {1..20}; do
    action="${actions[$((RANDOM % ${#actions[@]}))]}"
    echo -n "[$(date +%H:%M:%S)] $action"
    sleep 0.$((RANDOM % 3 + 1))
    
    if [ $((RANDOM % 3)) -eq 0 ]; then
        echo " [SUCCESS]"
    else
        echo " [FAIL]"
    fi
done

echo ""
echo "⚠️  ACCESS DENIED - JUST KIDDING! 😄"
echo "This was a simulation for entertainment."
echo ""
echo "   🛡️ Stay safe online! Use strong passwords!"
echo ""
