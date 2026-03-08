#!/bin/bash

echo ""
echo "📋 SYSTEM UPTIME & INFO"
echo ""

uptime -p 2>/dev/null || uptime

echo ""
echo "👥 Users Logged In:"
who

echo ""
echo "📅 System Date: $(date)"
echo ""
