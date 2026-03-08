#!/bin/bash

echo ""
echo "🍅 POMODORO TIMER 🍅"
echo ""
echo "Work: 25 min | Break: 5 min"
echo "Press 'q' to quit at any time"
echo ""

check_quit() {
    if read -t 1 -n1 key; then
        if [[ "$key" == "q" || "$key" == "Q" ]]; then
            echo ""
            echo "👋 Timer cancelled!"
            exit 0
        fi
    fi
}

if [ "$1" = "short" ]; then
    work=5
    break_time=1
    cycles=2
elif [ "$1" = "long" ]; then
    work=15
    break_time=3
    cycles=2
else
    work=25
    break_time=5
    cycles=4
fi

for cycle in $(seq 1 $cycles); do
    echo "=== Cycle $cycle/$cycles ==="
    echo "🍅 Working..."
    
    secs=$((work * 60))
    while [ $secs -gt 0 ]; do
        printf "\r   %02d:%02d " $((secs/60)) $((secs%60))
        sleep 1
        secs=$((secs - 1))
        check_quit
    done
    
    echo ""
    echo "   ✅ Time for a break!"
    
    if [ $cycle -lt $cycles ]; then
        echo "☕ Break time! ($break_time min)"
        secs=$((break_time * 60))
        while [ $secs -gt 0 ]; do
            printf "\r   %02d:%02d " $((secs/60)) $((secs%60))
            sleep 1
            secs=$((secs - 1))
            check_quit
        done
        echo ""
    fi
done

echo ""
echo "🎉 ALL CYCLES COMPLETE!"
echo ""
