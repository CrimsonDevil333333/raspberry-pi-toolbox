#!/bin/bash

echo ""
echo "QR CODE GENERATOR"
echo ""

if ! command -v qrencode &> /dev/null; then
    echo "Installing qrencode..."
    sudo apt install -y qrencode 2>/dev/null || echo "Cannot install qrencode"
fi

echo "Enter text or URL: "
read text

if [ -z "$text" ]; then exit 1; fi

if command -v qrencode &> /dev/null; then
    echo ""
    qrencode -t ANSI "$text"
    echo ""
else
    echo "qrencode not available"
    echo "Text: $text"
    echo "URL: https://qrserver.com/api/?text=$(echo "$text" | urlencode)"
fi
