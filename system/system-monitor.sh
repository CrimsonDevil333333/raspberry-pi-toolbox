#!/bin/bash

THRESHOLD_CPU=80
THRESHOLD_MEM=80
THRESHOLD_DISK=90
THRESHOLD_TEMP=70
ALERT_EMAIL=""

check_cpu() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')
    if [ "$cpu_usage" -gt "$THRESHOLD_CPU" ]; then
        echo "⚠️  CPU usage HIGH: ${cpu_usage}%"
    else
        echo "✅ CPU usage: ${cpu_usage}%"
    fi
}

check_memory() {
    mem_usage=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
    if [ "$mem_usage" -gt "$THRESHOLD_MEM" ]; then
        echo "⚠️  Memory usage HIGH: ${mem_usage}%"
    else
        echo "✅ Memory usage: ${mem_usage}%"
    fi
}

check_disk() {
    disk_usage=$(df -h / | tail -1 | awk '{print int($5)}')
    if [ "$disk_usage" -gt "$THRESHOLD_DISK" ]; then
        echo "⚠️  Disk usage HIGH: ${disk_usage}%"
    else
        echo "✅ Disk usage: ${disk_usage}%"
    fi
}

check_temp() {
    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        temp=$(cat /sys/class/thermal/thermal_zone0/temp | awk '{print int($1/1000)}')
        if [ "$temp" -gt "$THRESHOLD_TEMP" ]; then
            echo "🌡️  Temperature HIGH: ${temp}°C"
        else
            echo "🌡️  Temperature: ${temp}°C"
        fi
    fi
}

check_swap() {
    swap_total=$(free | grep Swap | awk '{print $2}')
    if [ "$swap_total" -gt 0 ]; then
        swap_used=$(free | grep Swap | awk '{print $3}')
        swap_pct=$((swap_used * 100 / swap_total))
        if [ "$swap_pct" -gt 50 ]; then
            echo "⚠️  Swap usage HIGH: ${swap_pct}%"
        fi
    fi
}

check_load() {
    load=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//')
    cores=$(nproc)
    if (( $(echo "$load > $cores" | bc -l 2>/dev/null || echo 0) )); then
        echo "⚠️  Load average HIGH: $load (${cores} cores)"
    else
        echo "📊 Load average: $load"
    fi
}

echo "=== System Health Monitor ==="
echo "Time: $(date)"
echo ""

check_cpu
check_memory
check_disk
check_temp
check_swap
check_load

echo ""
echo "--- Process Stats ---"
echo "Total processes: $(ps aux | wc -l)"
echo "Running: $(ps aux | grep -c Running)"

if [ -n "$ALERT_EMAIL" ]; then
    echo ""
    echo "Alerts will be sent to: $ALERT_EMAIL"
fi
