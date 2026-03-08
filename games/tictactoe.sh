#!/bin/bash

board=(" " " " " " " " " " " " " " " ")
player="X"
winner=""

print_board() {
    echo ""
    echo "   ${board[0]} | ${board[1]} | ${board[2]}"
    echo "  ---+---+---"
    echo "   ${board[3]} | ${board[4]} | ${board[5]}"
    echo "  ---+---+---"
    echo "   ${board[6]} | ${board[7]} | ${board[8]}"
    echo ""
}

check_winner() {
    wins=("012" "345" "678" "036" "147" "258" "048" "246")
    for w in "${wins[@]}"; do
        a="${w:0:1}" b="${w:1:1}" c="${w:2:1}"
        if [[ "${board[$a]}" != " " && "${board[$a]}" == "${board[$b]}" && "${board[$b]}" == "${board[$c]}" ]]; then
            winner="${board[$a]}"
            return
        fi
    done
}

check_draw() {
    if [[ ! " ${board[@]} " =~ " " ]]; then
        winner="draw"
    fi
}

echo ""
echo "================================"
echo "       🎮 TIC-TAC-TOE 🎮"
echo "================================"
echo ""
echo "Player X vs Player O"
echo "Enter number (1-9) to place your mark"
echo "Press 'q' to quit"
echo ""

for move in {1..9}; do
    print_board
    echo "Player $player's turn (1-9): "
    read -n1 choice
    echo ""
    
    if [[ "$choice" == "q" || "$choice" == "Q" ]]; then
        echo "👋 Game aborted!"
        exit 0
    fi
    
    idx=$((choice - 1))
    
    if [[ $choice -lt 1 || $choice -gt 9 || "${board[$idx]}" != " " ]]; then
        echo "Invalid move!"
        continue
    fi
    
    board[$idx]="$player"
    
    check_winner
    if [[ -n "$winner" ]]; then
        print_board
        if [[ "$winner" == "draw" ]]; then
            echo "🤝 It's a DRAW!"
        else
            echo "🎉 Player $winner WINS!"
        fi
        echo ""
        exit 0
    fi
    
    check_draw
    if [[ -n "$winner" ]]; then
        print_board
        echo "🤝 It's a DRAW!"
        echo ""
        exit 0
    fi
    
    player=$([[ "$player" == "X" ]] && echo "O" || echo "X")
done
