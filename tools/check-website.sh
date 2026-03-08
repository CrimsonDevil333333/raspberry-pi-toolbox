#!/bin/bash

echo ""
echo "CHECK WEBSITE"
echo ""

read -p "Website URL: " url

if [ -z "$url" ]; then exit 1; fi

echo "Checking $url..."
echo ""

if curl -s --head --max-time 10 "$url" | head -1 | grep -q "HTTP"; then
    status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$url")
    echo "Status: $status"
    
    if [ "$status" -lt 400 ]; then
        echo "Website is UP"
    else
        echo "Website returned error"
    fi
else
    echo "Cannot reach website"
fi

echo ""
