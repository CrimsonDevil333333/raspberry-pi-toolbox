#!/bin/bash

echo ""
echo "ASCII ART GENERATOR"
echo ""

echo "1. Shrug"
echo "2. Table Flip"
echo "3. Lenny Face"
echo "4. Dark Mode"
echo "5. Alien"
echo ""

read -p "Choice: " choice

case $choice in
    1) echo "¯\_(ツ)_/¯" ;;
    2) echo "(╯°□°）╯︵ ┻━┻" ;;
    3) echo "( ͡° ͜ʖ ͡°)" ;;
    4) echo "‎" ;;
    5) echo "(👽👽)" ;;
esac

echo ""
