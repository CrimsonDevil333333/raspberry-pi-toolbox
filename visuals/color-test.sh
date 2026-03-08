#!/bin/bash

echo ""
echo "COLORED ECHO TEST"
echo ""

colors=(
    "red"
    "green"
    "yellow"
    "blue"
    "magenta"
    "cyan"
    "white"
)

for color in "${colors[@]}"; do
    echo -n "$color: "
    case $color in
        red) echo -e "\033[0;31mHello\033[0m" ;;
        green) echo -e "\033[0;32mHello\033[0m" ;;
        yellow) echo -e "\033[0;33mHello\033[0m" ;;
        blue) echo -e "\033[0;34mHello\033[0m" ;;
        magenta) echo -e "\033[0;35mHello\033[0m" ;;
        cyan) echo -e "\033[0;36mHello\033[0m" ;;
        white) echo -e "\033[0;37mHello\033[0m" ;;
    esac
done

echo ""
