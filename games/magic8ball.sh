#!/bin/bash

echo ""
echo "    _______"
echo "   |       |"
echo "   |  🔮   |"
echo "   |       |"
echo "   |_______|"
echo ""
echo "    🎱 MAGIC 8-BALL 🎱"
echo ""

if [ -z "$1" ]; then
    echo "Ask a question and press Enter..."
    read -p "> " question
fi

echo ""
echo "Shaking the ball..."
sleep 2

answers=(
    "Yes, definitely! 🎉"
    "Without a doubt! ⭐"
    "Most likely 👍"
    "Outlook good 👌"
    "Signs point to yes ✅"
    "Reply hazy, try again 🤔"
    "Ask again later ⏳"
    "Better not tell you 🙊"
    "My sources say no ❌"
    "Very doubtful 💩"
    "No way! 🚫"
    "Absolutely not! ⛔"
    "Don't count on it 😬"
    "Yes in due time ⌛"
    "Concentrate and ask again 🔮"
)

echo "   ${answers[$((RANDOM % ${#answers[@]}))]}"
echo ""
