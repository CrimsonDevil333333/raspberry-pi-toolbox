#!/bin/bash

echo ""
echo "🪙 COIN FLIP 🪙"
echo ""

result=$((RANDOM % 2))

echo "Flipping..."
sleep 1
echo "Spinning..."
sleep 1
echo "..."
sleep 1

if [ $result -eq 0 ]; then
    echo ""
    echo "    _______"
    echo "   /       \\"
    echo "  |  HEADS  |"
    echo "  |    💰   |"
    echo "  |         |"
    echo "   \\_______/"
    echo ""
else
    echo ""
    echo "    _______"
    echo "   /       \\"
    echo "  |  TAILS  |"
    echo "  |    🪙   |"
    echo "  |         |"
    echo "   \\_______/"
    echo ""
fi

echo "Flip again? (y/n) or 'q' to quit"
read -n1 answer
echo ""

if [ "$answer" = "q" ] || [ "$answer" = "Q" ]; then
    echo "👋 Thanks for playing!"
    exit 0
fi

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    exec "$0"
fi
