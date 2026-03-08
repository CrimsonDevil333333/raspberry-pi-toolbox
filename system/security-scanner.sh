#!/bin/bash

echo "=== Security Scanner ==="
echo "Scan time: $(date)"
echo ""

echo "--- Failed SSH Logins (last 24h) ---"
if [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log | tail -20 || echo "None found"
elif [ -f /var/log/secure ]; then
    grep "Failed password" /var/log/secure | tail -20 || echo "None found"
else
    echo "Log file not found"
fi

echo ""
echo "--- Successful SSH Logins (last 10) ---"
if [ -f /var/log/auth.log ]; then
    grep "Accepted" /var/log/auth.log | tail -10 || echo "None found"
elif [ -f /var/log/secure ]; then
    grep "Accepted" /var/log/secure | tail -10 || echo "None found"
else
    echo "Log file not found"
fi

echo ""
echo "--- Failed sudo Attempts ---"
if [ -f /var/log/auth.log ]; then
    grep "sudo.*authentication failure" /var/log/auth.log | tail -10 || echo "None found"
elif [ -f /var/log/secure ]; then
    grep "sudo.*authentication failure" /var/log/secure | tail -10 || echo "None found"
fi

echo ""
echo "--- Unusual Ports Open ---"
ss -tulpn | grep -v "State" | awk '{print $1, $5}' | grep LISTEN

echo ""
echo "--- SUID Files (potential rootkits) ---"
find /usr -perm -4000 2>/dev/null | head -20

echo ""
echo "--- Recent Files in /tmp ---"
find /tmp -type f -mtime -1 2>/dev/null | head -10

echo ""
echo "--- Running Services ---"
systemctl list-units --type=service --state=running | grep -v "UNIT\|loaded" | head -15

echo ""
echo "--- Last Reboot ---"
who -b

echo ""
echo "--- Users with Shell Access ---"
grep -E "/bin/(bash|sh|zsh)" /etc/passwd

echo ""
echo "--- IP Connections Summary ---"
ss -tn | awk '{print $4, $5}' | grep -v "Local" | cut -d: -f1 | sort | uniq -c | sort -rn | head -10
