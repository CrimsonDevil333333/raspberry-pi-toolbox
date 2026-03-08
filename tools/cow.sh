#!/bin/bash

if command -v cowsay >/dev/null 2>&1; then
    if [ -z "$1" ]; then
        cowsay "Moo! I am $(hostname)!"
    else
        cowsay "$*"
    fi
else
    echo "Install cowsay: sudo apt install cowsay"
    echo ""
    echo "  ====____===="
    echo " < Moo! Mooh! >"
    echo "  ====____===="
    echo "        \   ^__^"
    echo "         \  (oo)\_______"
    echo "            (__)\       )\/\\"
    echo "                ||----w |"
    echo "                ||     ||"
fi
