#!/bin/bash

length=${1:-16}
use_special=${2:-yes}

charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

if [[ "$use_special" == "yes" ]]; then
    charset+="!@#$%^&*()_+-=[]{}|;:,.<>?"
fi

password=""
for i in $(seq 1 $length); do
    password+="${charset:$((RANDOM % ${#charset})):1}"
done

echo ""
echo "🔐 Generated Password:"
echo ""
echo "   $password"
echo ""
echo "   Length: $length"
echo "   Special chars: $use_special"
echo ""

if command -v xclip >/dev/null 2>&1; then
    echo -n "$password" | xclip -selection clipboard
    echo "   📋 Copied to clipboard!"
fi
echo ""
