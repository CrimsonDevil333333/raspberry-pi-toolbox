#!/bin/bash

echo ""
echo "🧊 RANDOM COOL FACTS"
echo ""

facts=(
    "Honey never spoils - archaeologists found 3000-year-old honey still edible"
    "Octopuses have three hearts and blue blood"
    "A day on Venus is longer than a year on Venus"
    "Bananas are berries, but strawberries aren't"
    "The shortest war in history lasted 38-45 minutes"
    "Cleopatra lived closer to the Moon landing than to pyramid building"
    "A jiffy is an actual unit of time (1/100th second)"
    "There are more stars than grains of sand on Earth"
    "Python was named after Monty Python, not the snake"
    "The first computer bug was an actual moth"
    "Linux was created by Linus Torvalds in 1991"
    "Raspberry Pi means Python + the fruit"
)

echo "  ${facts[$((RANDOM % ${#facts[@]}))]}"
echo ""
