#!/bin/bash

MONITOR_FILE="/tmp/monitored_processes.txt"
RESTART_COMMAND=""

add_process() {
    if [ -z "$1" ]; then
        echo "Usage: $0 add <process_name> [restart_command]"
        exit 1
    fi
    echo "$1:$2" >> "$MONITOR_FILE"
    echo "Added monitoring for: $1"
}

remove_process() {
    if [ -z "$1" ]; then
        echo "Usage: $0 remove <process_name>"
        exit 1
    fi
    sed -i "/^$1:/d" "$MONITOR_FILE"
    echo "Removed monitoring for: $1"
}

list_processes() {
    echo "=== Monitored Processes ==="
    if [ -f "$MONITOR_FILE" ]; then
        cat "$MONITOR_FILE"
    else
        echo "No processes being monitored"
    fi
}

check_process() {
    if [ ! -f "$MONITOR_FILE" ]; then
        return
    fi
    
    while IFS=: read -r proc cmd; do
        if [ -z "$proc" ]; then
            continue
        fi
        
        if pgrep -x "$proc" >/dev/null 2>&1; then
            echo "✅ $proc is running"
        else
            echo "❌ $proc is NOT running"
            
            if [ -n "$cmd" ]; then
                echo "   Attempting to restart..."
                eval "$cmd" >/dev/null 2>&1 &
                sleep 2
                if pgrep -x "$proc" >/dev/null 2>&1; then
                    echo "   ✅ Restarted successfully"
                else
                    echo "   ❌ Restart failed"
                fi
            fi
        fi
    done < "$MONITOR_FILE"
}

status_all() {
    echo "=== Process Status ==="
    echo ""
    echo "Top Memory Users:"
    ps aux --sort=-%mem | head -11 | tail -10
    
    echo ""
    echo "Top CPU Users:"
    ps aux --sort=-%cpu | head -11 | tail -10
    
    echo ""
    echo "Zombie Processes:"
    ps aux | grep -c "[Z]" || echo "None"
}

case "$1" in
    add)
        add_process "$2" "$3"
        ;;
    remove)
        remove_process "$2"
        ;;
    list)
        list_processes
        ;;
    check)
        check_process
        ;;
    status)
        status_all
        ;;
    *)
        echo "Usage: $0 {add|remove|list|check|status}"
        echo ""
        echo "Commands:"
        echo "  add <process> [cmd]  - Monitor a process"
        echo "  remove <process>     - Stop monitoring"
        echo "  list                 - Show monitored processes"
        echo "  check                - Check all monitored processes"
        echo "  status               - Show process stats"
        ;;
esac
