#!/bin/bash

echo "=== Network Diagnostics ==="
echo ""

echo "--- Interfaces ---"
ip -br addr show | grep -v "^lo "

echo ""
echo "--- Default Gateway ---"
ip route | grep default

echo ""
echo "--- DNS Servers ---"
cat /etc/resolv.conf 2>/dev/null | grep nameserver

echo ""
echo "--- Internet Connectivity ---"
if ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1; then
    echo "✅ Internet: Connected"
else
    echo "❌ Internet: Disconnected"
fi

echo ""
echo "--- DNS Resolution ---"
if nslookup google.com >/dev/null 2>&1; then
    echo "✅ DNS: Working"
else
    echo "❌ DNS: Not working"
fi

echo ""
echo "--- Latency Test ---"
ping -c 4 8.8.8.8 2>/dev/null | tail -1

echo ""
echo "--- Packet Loss ---"
ping -c 10 8.8.8.8 2>/dev/null | grep "packet loss"

echo ""
echo "--- External IP ---"
curl -s ifconfig.me 2>/dev/null || echo "Unable to fetch"

echo ""
echo "--- DNS Lookup Speed ---"
time nslookup google.com >/dev/null 2>&1

echo ""
echo "--- Bandwidth Test (download) ---"
if command -v speedtest-cli >/dev/null 2>&1; then
    speedtest-cli --simple 2>/dev/null || echo "Install: pip install speedtest-cli"
else
    echo "Install speedtest-cli for bandwidth testing"
fi
