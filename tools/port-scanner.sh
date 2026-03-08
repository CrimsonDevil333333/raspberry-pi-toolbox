#!/bin/bash

echo ""
echo "🔌 OPEN PORTS"
echo ""

echo "📡 Listening Services:"
ss -tulpn | grep LISTEN | awk '{print $1, $5, $7}' | column -t

echo ""
echo "🌐 Active Connections:"
ss -tn | awk '{print $4, $5}' | grep -v "Local" | cut -d: -f1 | sort | uniq -c | sort -rn | head -10

echo ""
