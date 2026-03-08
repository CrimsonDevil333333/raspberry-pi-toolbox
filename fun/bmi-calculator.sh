#!/bin/bash

echo ""
echo "⚖️  BMI CALCULATOR"
echo "Press 'q' to quit"
echo ""

read -p "Enter weight (kg): " weight

if [[ "$weight" == "q" || "$weight" == "Q" ]]; then
    exit 0
fi

read -p "Enter height (cm): " height

if [[ "$height" == "q" || "$height" == "Q" ]]; then
    exit 0
fi

height_m=$(echo "scale=2; $height / 100" | bc)
bmi=$(echo "scale=1; $weight / ($height_m * $height_m)" | bc)

echo ""
echo "📊 Your BMI: $bmi"

if (( $(echo "$bmi < 18.5" | bc -l) )); then
    echo "📉 Category: Underweight"
elif (( $(echo "$bmi < 25" | bc -l) )); then
    echo "✅ Category: Normal weight"
elif (( $(echo "$bmi < 30" | bc -l) )); then
    echo "⚠️ Category: Overweight"
else
    echo "🚨 Category: Obese"
fi

echo ""
