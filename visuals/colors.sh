#!/bin/bash

echo "🎨 Terminal Colors Test"
echo ""
echo "Standard Colors:"
for i in {30..37}; do
    echo -en "\033[${i}mColor $i  \033[0m"
done
echo ""

echo ""
echo "Bold Colors:"
for i in {30..37}; do
    echo -en "\033[1;${i}mBold $i \033[0m"
done
echo ""

echo ""
echo "Background Colors:"
for i in {40..47}; do
    echo -en "\033[${i}mBG $i \033[0m"
done
echo ""

echo ""
echo "256 Colors (sample):"
for i in {0..15}; do
    echo -en "\033[48;5;${i}m  \033[0m"
done
echo ""

echo ""
echo "Press Enter to exit..."
read
