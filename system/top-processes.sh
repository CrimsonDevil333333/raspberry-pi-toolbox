#!/bin/bash

echo ""
echo "📋 RUNNING PROCESSES"
echo ""

echo "Top 15 processes by CPU:"
ps aux --sort=-%cpu | head -16

echo ""
