#!/bin/bash

echo ""
echo "🌐 IP & NETWORK INFO"
echo ""

echo "📡 Public IP: $(curl -s ifconfig.me 2>/dev/null || echo 'N/A')"
echo "🏠 Local IP: $(hostname -I | awk '{print $1}')"
echo ""

echo "📊 Network Interfaces:"
ip -br addr show | grep -v "^lo "

echo ""
echo "🌍 DNS Servers:"
cat /etc/resolv.conf 2>/dev/null | grep nameserver

echo ""
echo "📈 Connection Status:"
if ping -c 1 -W 1 8.8.8.8 &>/dev/null; then
    echo "✅ Internet: Connected"
else
    echo "❌ Internet: Disconnected"
fi

echo ""
