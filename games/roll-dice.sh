#!/bin/bash

dice() {
    echo "    ┌─────┐"
    case $1 in
        1) echo "    │     │"
           echo "    │  ●  │"
           echo "    │     │" ;;
        2) echo "    │ ●   │"
           echo "    │     │"
           echo "    │   ● │" ;;
        3) echo "    │ ●   │"
           echo "    │  ●  │"
           echo "    │   ● │" ;;
        4) echo "    │ ● ● │"
           echo "    │     │"
           echo "    │ ● ● │" ;;
        5) echo "    │ ● ● │"
           echo "    │  ●  │"
           echo "    │ ● ● │" ;;
        6) echo "    │ ● ● │"
           echo "    │ ● ● │"
           echo "    │ ● ● │" ;;
    esac
    echo "    └─────┘"
}

echo ""
echo "🎲 ROLL THE DICE 🎲"
echo ""

if [ "$1" = "2" ] || [ "$2" = "2" ]; then
    r1=$((RANDOM % 6 + 1))
    r2=$((RANDOM % 6 + 1))
    total=$((r1 + r2))
    echo "Rolling two dice..."
    sleep 1
    dice $r1
    echo ""
    dice $r2
    echo ""
    echo "Total: $total"
else
    r=$((RANDOM % 6 + 1))
    echo "Rolling..."
    sleep 1
    dice $r
    echo ""
fi

echo ""
echo "Roll again? (y/n) or 'q' to quit"
read -n1 answer
echo ""

if [ "$answer" = "q" ] || [ "$answer" = "Q" ]; then
    echo "👋 Thanks for playing!"
    exit 0
fi

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    exec "$0" "$@"
fi
