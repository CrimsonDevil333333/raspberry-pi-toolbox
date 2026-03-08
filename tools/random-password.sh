#!/bin/bash

echo ""
echo "🔐 RANDOM PASSWORD"
echo ""

length=${1:-16}
chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*"

password=""
for i in $(seq 1 $length); do
    password+="${chars:$((RANDOM % ${#chars})):1}"
done

echo "Password ($length chars):"
echo ""
echo "  $password"
echo ""
