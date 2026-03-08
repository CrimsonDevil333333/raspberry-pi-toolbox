#!/bin/bash

jokes=(
    "Why do programmers prefer dark mode? Because light attracts bugs."
    "There are only 10 types of people in the world: those who understand binary and those who don't."
    "Why did the developer go broke? Because he used up all his cache."
    "A SQL query walks into a bar, walks up to two tables and asks... 'Can I join you?'"
    "Why do Java developers wear glasses? Because they can't C#."
    "What do you call a fake noodle? An Impasta."
    "Why did the Raspberry Pi go to therapy? Because it had too many issues."
    "My computer beat me at chess, but we had a rematch at checkers and I won."
    "There are 10 kinds of people: those who understand hex and F the rest."
    "I told my computer I needed a break, and it said 'No problem, go ahead... press any key!'"
    "Why do programmers hate nature? It has too many bugs."
    "Parallel lines have so much in common. It’s a shame they’ll never meet."
    "What's a Raspberry Pi's favorite food? Pi-thon."
)

echo ""
echo "😄 Here's a joke for you:"
echo ""
echo "   ${jokes[$((RANDOM % ${#jokes[@]}))]}"
echo ""
echo "   - Generated on $(hostname) at $(date +%H:%M)"
echo ""
