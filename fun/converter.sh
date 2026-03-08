#!/bin/bash

echo ""
echo "📐 UNIT CONVERTER"
echo "Press 'q' to quit"
echo ""

echo "1. Celsius to Fahrenheit"
echo "2. Fahrenheit to Celsius"
echo "3. Kilometers to Miles"
echo "4. Miles to Kilograms"
echo "5. Pounds to Kilograms"
echo "6. Kilograms to Pounds"
echo ""

read -p "Choose conversion: " choice

case $choice in
    1)
        echo -n "Celsius: "
        read c
        if [[ "$c" == "q" ]]; then exit 0; fi
        f=$(echo "scale=2; ($c * 9/5) + 32" | bc)
        echo "$c°C = $f°F"
        ;;
    2)
        echo -n "Fahrenheit: "
        read f
        if [[ "$f" == "q" ]]; then exit 0; fi
        c=$(echo "scale=2; ($f - 32) * 5/9" | bc)
        echo "$f°F = $c°C"
        ;;
    3)
        echo -n "Kilometers: "
        read km
        if [[ "$km" == "q" ]]; then exit 0; fi
        mi=$(echo "scale=2; $km * 0.621371" | bc)
        echo "$km km = $mi miles"
        ;;
    4)
        echo -n "Miles: "
        read mi
        if [[ "$mi" == "q" ]]; then exit 0; fi
        km=$(echo "scale=2; $mi * 1.60934" | bc)
        echo "$mi miles = $km km"
        ;;
    5)
        echo -n "Pounds: "
        read lb
        if [[ "$lb" == "q" ]]; then exit 0; fi
        kg=$(echo "scale=2; $lb * 0.453592" | bc)
        echo "$lb lb = $kg kg"
        ;;
    6)
        echo -n "Kilograms: "
        read kg
        if [[ "$kg" == "q" ]]; then exit 0; fi
        lb=$(echo "scale=2; $kg * 2.20462" | bc)
        echo "$kg kg = $lb lb"
        ;;
    *) echo "Invalid choice" ;;
esac

echo ""
