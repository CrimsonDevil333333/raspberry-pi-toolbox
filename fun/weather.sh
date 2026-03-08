#!/bin/bash

echo ""
echo "🌤️  WEATHER INFO"
echo "Press 'q' to quit"
echo ""

if command -v curl &> /dev/null; then
    echo "Fetching weather data..."
    weather=$(curl -s "wttr.in?format=%c%t+%h" 2>/dev/null)
    
    if [ -n "$weather" ]; then
        echo ""
        echo "$weather"
    else
        echo "Weather unavailable. Check internet connection."
    fi
else
    echo "curl not installed. Install with: sudo apt install curl"
fi

echo ""
