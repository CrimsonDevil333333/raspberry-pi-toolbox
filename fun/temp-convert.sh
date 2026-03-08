#!/bin/bash

echo ""
echo "TEMPERATURE CONVERTER"
echo "Press q to quit"
echo ""

echo "1. Celsius to Fahrenheit"
echo "2. Celsius to Kelvin"
echo "3. Fahrenheit to Celsius"
echo ""

read -p "Choice: " choice

case $choice in
    1)
        echo -n "Celsius: "
        read c
        if [[ "$c" == "q" ]]; then exit 0; fi
        f=$(echo "scale=2; ($c * 9/5) + 32" | bc)
        echo "$c C = $f F"
        ;;
    2)
        echo -n "Celsius: "
        read c
        if [[ "$c" == "q" ]]; then exit 0; fi
        k=$(echo "scale=2; $c + 273.15" | bc)
        echo "$c C = $k K"
        ;;
    3)
        echo -n "Fahrenheit: "
        read f
        if [[ "$f" == "q" ]]; then exit 0; fi
        c=$(echo "scale=2; ($f - 32) * 5/9" | bc)
        echo "$f F = $c C"
        ;;
esac

echo ""
