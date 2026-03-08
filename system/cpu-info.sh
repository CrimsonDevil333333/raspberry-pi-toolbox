#!/bin/bash

echo ""
echo "🖥️  CPU INFORMATION"
echo ""

model=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2)
cores=$(nproc)
freq=$(cat /proc/cpuinfo | grep "cpu MHz" | head -1 | cut -d: -f2)

echo "🏷️  Model: $model"
echo "🔢 Cores: $cores"
echo "⚡ Frequency: $freq MHz"

if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    temp=$(cat /sys/class/thermal/thermal_zone0/temp | awk '{print $1/1000}')
    echo "🌡️  Temperature: ${temp}°C"
fi

echo ""
echo "📊 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "   User: " $2 ", System: " $4 ", Idle: " $8}'

echo ""
