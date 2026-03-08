#!/bin/bash

echo ""
echo "BASE64 ENCODER/DECODER"
echo ""

echo "1. Encode"
echo "2. Decode"
read -p "Choice: " choice

case $choice in
    1)
        echo -n "Text to encode: "
        read text
        if [ -n "$text" ]; then
            echo "Encoded: $(echo "$text" | base64)"
        fi
        ;;
    2)
        echo -n "Text to decode: "
        read text
        if [ -n "$text" ]; then
            decoded=$(echo "$text" | base64 -d 2>/dev/null)
            if [ $? -eq 0 ]; then
                echo "Decoded: $decoded"
            else
                echo "Invalid base64"
            fi
        fi
        ;;
esac

echo ""
