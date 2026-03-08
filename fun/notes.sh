#!/bin/bash

echo ""
echo "📝 QUICK NOTES"
echo "File: ~/notes.txt"
echo "Press 'q' to quit, 'l' to list, 'c' to clear"
echo ""

notes_file="$HOME/notes.txt"

while true; do
    echo -n "Add note: "
    read note
    
    if [[ "$note" == "q" || "$note" == "Q" ]]; then
        exit 0
    elif [[ "$note" == "l" || "$note" == "L" ]]; then
        echo ""
        if [ -f "$notes_file" ]; then
            cat "$notes_file"
        else
            echo "(No notes yet)"
        fi
        echo ""
    elif [[ "$note" == "c" || "$note" == "C" ]]; then
        > "$notes_file"
        echo "Notes cleared!"
    elif [ -n "$note" ]; then
        echo "[$(date '+%Y-%m-%d %H:%M')] $note" >> "$notes_file"
        echo "Saved!"
    fi
done
