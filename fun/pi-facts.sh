#!/bin/bash

echo ""
echo "    .--."
echo "   |o_o |"
echo "   |:_/ |"
echo "  //   \\ \\"
echo " (|     | )"
echo "/'\_   _/\`\\"
echo "\___)=(___/"
echo ""
echo "=== Raspberry Pi Facts ==="
echo ""

facts=(
    "The Raspberry Pi was created by Eben Upton in 2012"
    "Over 40 million Raspberry Pis have been sold"
    "The Pi in Raspberry Pi originally meant Python"
    "Raspberry Pi can run Minecraft, Python, and Scratch"
    "The Pi 4 can output 4K video"
    "NASA uses Raspberry Pi to control weather balloons"
    "Raspberry Pi means the fruit + a computer board"
    "Pi Day is March 14th (3/14)"
    "The first Pi had only 256MB RAM"
    "You can build a supercomputer with multiple Pi units"
)

echo "${facts[$((RANDOM % ${#facts[@]}))]}"
echo ""
