#!/bin/bash

echo "=== Raspberry Pi Vitals ==="
echo ""

echo "--- System ---"
uptime

echo ""
echo "--- CPU ---"
cat /proc/cpuinfo | grep "model name" | head -1
echo "Frequency: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq 2>/dev/null | awk '{print $1/1000}') MHz"
echo "Temperature: $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000}')°C"

echo ""
echo "--- Memory ---"
free -h

echo ""
echo "--- Disk ---"
df -h | grep -E "^/dev|Filesystem"

echo ""
echo "--- Network ---"
ip -br addr show | grep -v "^lo "
echo "Wireless signal: $(iwconfig wlan0 2>/dev/null | grep -i signal | awk '{print $4}' | sed 's/Signal=//')"

echo ""
echo "--- Top Processes ---"
ps aux --sort=-%mem | head -6

echo ""
echo "--- Uptime & Load ---"
uptime -p 2>/dev/null || uptime
