#!/bin/bash

echo ""
echo "📝 TODO LIST"
echo "File: ~/todo.txt"
echo ""

todo_file="$HOME/todo.txt"

if [ ! -f "$todo_file" ]; then
    touch "$todo_file"
fi

while true; do
    echo "Options: (a)dd, (l)ist, (d)elete, (c)lear, (q)uit"
    echo -n "Choice: "
    read -n1 choice
    echo ""
    
    case "$choice" in
        a|A)
            echo -n "Task: "
            read task
            echo "[ ] $task" >> "$todo_file"
            echo "Added!"
            ;;
        l|L)
            if [ -s "$todo_file" ]; then
                cat -n "$todo_file"
            else
                echo "(No tasks)"
            fi
            ;;
        d|D)
            echo -n "Task number to delete: "
            read num
            if [ -n "$num" ]; then
                sed -i "${num}d" "$todo_file" 2>/dev/null
                echo "Deleted!"
            fi
            ;;
        c|C)
            > "$todo_file"
            echo "Cleared!"
            ;;
        q|Q)
            exit 0
            ;;
    esac
    echo ""
done
