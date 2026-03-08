#!/bin/bash

echo ""
echo "╔══════════════════════════════════════╗"
echo "║       📜 QUOTE OF THE DAY 📜         ║"
echo "╚══════════════════════════════════════╝"
echo ""

quotes=(
    "\"The only way to do great work is to love what you do.\" - Steve Jobs"
    "\"Stay hungry, stay foolish.\" - Steve Jobs"
    "\"Code is like humor. When you have to explain it, it's bad.\" - Cory House"
    "\"First, solve the problem. Then, write the code.\" - John Johnson"
    "\"Experience is the name everyone gives to their mistakes.\" - Oscar Wilde"
    "\"The best error message is the one that never shows up.\" - Thomas Fuchs"
    "\"Simplicity is the soul of efficiency.\" - Austin Freeman"
    "\"Make it work, make it right, make it fast.\" - Kent Beck"
    "\"Any fool can write code that a computer can understand. Good programmers write code that humans can understand.\" - Martin Fowler"
    "\"Programming isn't about what you know; it's about what you can figure out.\" - Chris Pine"
    "\"The most disastrous thing that you can ever learn is your first programming language.\" - Alan Kay"
    "\"Sometimes it pays to stay in bed on Monday, rather than spending the rest of the week debugging Monday's code.\" - Dan Salomon"
    "\"Perfection is achieved not when there is nothing more to add, but when there is nothing left to take away.\" - Antoine de Saint-Exupéry"
    "\"Technology is best when it brings people together.\" - Matt Mullenweg"
    "\"The best way to predict the future is to implement it.\" - Alan Kay"
)

echo "   ${quotes[$((RANDOM % ${#quotes[@]}))]}"
echo ""
echo "   - $(date +'%B %d, %Y')"
echo ""
