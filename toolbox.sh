#!/bin/bash
clear
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m'
BOLD='\033[1m'
BG_BLACK='\033[40m'

declare -A CATEGORIES=(
    ["games"]="🎮 Games"
    ["fun"]="🎉 Fun & Entertainment"
    ["visuals"]="🎨 Visual Effects"
    ["system"]="📊 System Utilities"
    ["tools"]="🔧 Tools & Misc"
)

declare -A GAME_NAMES=(
    ["hangman"]="🪢 Hangman - Word guessing"
    ["tictactoe"]="❌⭕ Tic-Tac-Toe"
    ["guess-number"]="🎯 Guess Number (1-100)"
    ["simon-says"]="🧠 Simon Says"
    ["riddles"]="❓ Riddles"
    ["roll-dice"]="🎲 Roll Dice"
    ["coinflip"]="🪙 Coin Flip"
    ["magic8ball"]="🔮 Magic 8 Ball"
)

declare -A FUN_NAMES=(
    ["pizza-timer"]="🍕 Pizza Timer"
    ["pomodoro"]="🍅 Pomodoro Timer"
    ["countdown"]="⏱️  Countdown"
    ["stopwatch"]="🛑 Stopwatch"
    ["joke"]="😂 Random Joke"
    ["pi-facts"]="📚 Pi Facts"
    ["quote"]="💬 Quote of Day"
    ["fortune-cookie"]="🍪 Fortune Cookie"
    ["password"]="🔐 Password Generator"
    ["type"]="⌨️  Typing Effect"
)

declare -A VISUAL_NAMES=(
    ["matrix"]="💚 Matrix Rain"
    ["text-rain"]="📜 Text Rain"
    ["fire"]="🔥 ASCII Fire"
    ["stars"]="⭐ Stars"
    ["clock"]="🕐 Live Clock"
    ["colors"]="🎨 Colors"
    ["progressbar"]="📊 Progress Bar"
    ["spinner"]="⏳ Spinner"
)

declare -A SYSTEM_NAMES=(
    ["system-monitor"]="📈 System Monitor - CPU, RAM, Disk, Temp"
    ["network-diag"]="🌐 Network Diagnostics - Ping, DNS, Speed"
    ["process-manager"]="⚙️  Process Manager"
    ["security-scanner"]="🔒 Security Scanner"
    ["backup"]="💾 Backup Tool"
    ["pi-vitals"]="🍓 Pi Vitals"
)

declare -A TOOL_NAMES=(
    ["ascii-art"]="🎨 ASCII Art (needs figlet)"
    ["cow"]="🐄 Cow Says"
    ["hacker-sim"]="💻 Hacker Sim"
)

get_script_name() {
    local script="$1"
    local category="$2"
    local name=""
    
    case "$category" in
        games) name="${GAME_NAMES[$script]:-}" ;;
        fun) name="${FUN_NAMES[$script]:-}" ;;
        visuals) name="${VISUAL_NAMES[$script]:-}" ;;
        system) name="${SYSTEM_NAMES[$script]:-}" ;;
        tools) name="${TOOL_NAMES[$script]:-}" ;;
    esac
    
    if [ -n "$name" ]; then
        echo "$name"
        return
    fi
    
    local emoji=""
    case "$category" in
        games) emoji="🎮" ;;
        fun) emoji="🎉" ;;
        visuals) emoji="🎨" ;;
        system) emoji="📊" ;;
        tools) emoji="🔧" ;;
        *) emoji="📄" ;;
    esac
    
    local formatted=$(echo "$script" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
    echo "$emoji $formatted"
}

draw_box() {
    local title="$1"
    local height="$2"
    local width="$3"
    local y="$4"
    local x="$5"
    
    tput cup "$y" "$x"
    echo -ne "${BG_BLACK}${CYAN}╔${NC}"
    for i in $(seq 1 $((width - 2))); do echo -ne "${BG_BLACK}${CYAN}═${NC}"; done
    echo -ne "${BG_BLACK}${CYAN}╗${NC}"
    
    for j in $(seq 1 $((height - 2))); do
        tput cup $((y + j)) "$x"
        echo -ne "${BG_BLACK}${CYAN}║${NC}"
        printf "%*s" $((width - 2)) ""
        tput cup $((y + j)) $((x + width - 1))
        echo -ne "${BG_BLACK}${CYAN}║${NC}"
    done
    
    tput cup $((y + height - 1)) "$x"
    echo -ne "${BG_BLACK}${CYAN}╚${NC}"
    for i in $(seq 1 $((width - 2))); do echo -ne "${BG_BLACK}${CYAN}═${NC}"; done
    echo -ne "${BG_BLACK}${CYAN}╝${NC}"
    
    if [ -n "$title" ]; then
        tput cup "$y" $((x + (width - ${#title} - 2) / 2))
        echo -ne "${BG_BLACK}${YELLOW}$title${NC}"
    fi
}

print_header() {
    clear
    echo ""
    echo -e "${CYAN}    ╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}    ║${NC}       ${MAGENTA}▀█▀ █▀█ █▄▀ █ █▄ █ ▄▀█ █▀█ █▄▀ ▄▀█ █▀▄ █ ▄▀█${NC}         ${CYAN}║${NC}"
    echo -e "${CYAN}    ║${NC}       ${MAGENTA}░█░ █▀▄ █░█ █ █▀▄ █▄▀ █▀▄ █░█ █▄█ █▄▀ █▀█ █▄▄${NC}         ${CYAN}║${NC}"
    echo -e "${CYAN}    ║${NC}              ${YELLOW}🫐 RASPBERRY PI TOOLBOX 🫐${NC}                ${CYAN}║${NC}"
    echo -e "${CYAN}    ╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_menu() {
    local title="$1"
    shift
    local items=("$@")
    local selected="$selected_idx"
    
    local height=$((7 + ${#items[@]}))
    local width=70
    local y=8
    local x=5
    
    tput cup 0 0
    printf "%*s" $((width + 20)) "" | tr ' ' '\n'
    tput cup 0 0
    
    draw_box "$title" "$height" "$width" "$y" "$x"
    
    for i in "${!items[@]}"; do
        local item="${items[$i]}"
        local prefix="  "
        local color="${GRAY}"
        
        if [ $i -eq $selected ]; then
            prefix=" ${GREEN}▶${NC} "
            color="${WHITE}${BOLD}"
        fi
        
        tput cup $((y + 2 + i)) $((x + 2))
        
        if [ $i -eq $selected ]; then
            echo -ne "${GREEN}[$((i+1))]${NC} ${color}${item}${NC}"
        else
            echo -ne "${GRAY}[$((i+1))]${NC} ${color}${item}${NC}"
        fi
    done
    
    tput cup $((y + height - 2)) $((x + 2))
    echo -ne "${GRAY}↑↓ navigate • Enter select • q/0 quit • b back${NC}"
    
    tput cup $((y + height)) $x
}

get_input() {
    local key
    IFS= read -rsn1 key
    
    case "$key" in
        $'\x1b')
            read -rsn2 -t 0.1 key
            case "$key" in
                "[A") echo "up" ;;
                "[B") echo "down" ;;
                "[C") echo "right" ;;
                "[D") echo "left" ;;
            esac
            ;;
        "")
            echo "enter"
            ;;
        "")
            echo "q"|"Qquit"
            ;;
        "0")
            echo "exit0"
            ;;
        "b"|"B")
            echo "back"
            ;;
        [1-9])
            echo "num:$key"
            ;;
    esac
}

run_script() {
    local script="$1"
    local folder="$2"
    shift
    shift
    local args="$@"
    
    clear
    echo ""
    echo -e "${YELLOW}▶ Running: ${WHITE}$script${NC}"
    echo -e "${YELLOW}────────────────────────────────────────${NC}"
    echo ""
    
    if [ -f "$folder/$script.sh" ]; then
        if [ -n "$args" ]; then
            "./$folder/$script.sh" $args
        else
            "./$folder/$script.sh"
        fi
    else
        echo -e "${RED}Script not found: $folder/$script.sh${NC}"
        sleep 2
    fi
    
    echo ""
    echo -e "${CYAN}────────────────────────────────────────${NC}"
    echo -e "${CYAN}Press Enter to continue...${NC}"
    read
}

run_special() {
    local func="$1"
    shift
    local args="$@"
    
    clear
    echo ""
    echo -e "${YELLOW}▶ Running: ${WHITE}$func${NC}"
    echo -e "${YELLOW}────────────────────────────────────────${NC}"
    echo ""
    
    $func $args
    
    echo ""
    echo -e "${CYAN}────────────────────────────────────────${NC}"
    echo -e "${CYAN}Press Enter to continue...${NC}"
    read
}

show_about() {
    print_header
    echo -e "${CYAN}    ╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}    ║${NC}                    ${YELLOW}ℹ️  ABOUT${NC}                          ${CYAN}║${NC}"
    echo -e "${CYAN}    ╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}  🫐 Raspberry Pi Toolbox v3.0${NC}"
    echo ""
    echo -e "${GRAY}  A collection of useful scripts for your Raspberry Pi.${NC}"
    echo ""
    echo -e "${WHITE}  Features:${NC}"
    echo -e "${GRAY}    • System monitoring & diagnostics${NC}"
    echo -e "${GRAY}    • Fun games & entertainment${NC}"
    echo -e "${GRAY}    • Visual effects${NC}"
    echo -e "${GRAY}    • Productivity tools${NC}"
    echo ""
    echo -e "${WHITE}  Controls:${NC}"
    echo -e "${GREEN}    ↑↓${GRAY} - Navigate${NC}"
    echo -e "${GREEN}    Enter${GRAY} - Select${NC}"
    echo -e "${GREEN}    q/0${GRAY} - Quit${NC}"
    echo -e "${GREEN}    b${GRAY} - Back${NC}"
    echo ""
    echo -en "${CYAN}  Press Enter to continue...${NC}"
    read
}

get_folder_scripts() {
    local folder="$1"
    local scripts=()
    
    if [ -d "$folder" ]; then
        for f in "$folder"/*.sh; do
            if [ -f "$f" ]; then
                local script_name=$(basename "$f" .sh)
                scripts+=("$script_name")
            fi
        done
    fi
    
    printf '%s\n' "${scripts[@]}"
}

get_total_scripts() {
    local count=0
    for folder in "${!CATEGORIES[@]}"; do
        if [ -d "$folder" ]; then
            count=$(($(ls "$folder"/*.sh 2>/dev/null | wc -l) + count))
        fi
    done
    echo $count
}

category_menu() {
    local category="$1"
    local folder="$category"
    local title="${CATEGORIES[$category]:-$category}"
    
    local scripts=($(get_folder_scripts "$folder"))
    local count=${#scripts[@]}
    
    if [ $count -eq 0 ]; then
        clear
        echo ""
        echo -e "${YELLOW}No scripts found in $folder/${NC}"
        echo ""
        echo -en "${CYAN}Press Enter to continue...${NC}"
        read
        return
    fi
    
    local menu_items=()
    for script in "${scripts[@]}"; do
        menu_items+=("$(get_script_name "$script" "$category")")
    done
    menu_items+=("⬅️  Back")
    
    selected_idx=0
    
    while true; do
        print_menu "$title (${count})" "${menu_items[@]}"
        
        input=$(get_input)
        
        case "$input" in
            "up")
                selected_idx=$(( (selected_idx - 1 + $((count + 1))) % $((count + 1)) ))
                ;;
            "down")
                selected_idx=$(( (selected_idx + 1) % $((count + 1)) ))
                ;;
            "enter")
                if [ $selected_idx -eq $count ]; then
                    return
                fi
                local script="${scripts[$selected_idx]}"
                
                if [ "$category" == "games" ]; then
                    case "$script" in
                        roll-dice) run_special dice_roll ;;
                        magic8ball) run_special magic8ball ;;
                        *) run_script "$script" "$folder" ;;
                    esac
                elif [ "$category" == "fun" ]; then
                    case "$script" in
                        pizza-timer) run_special pizza_timer ;;
                        pomodoro) run_special pomodoro_timer ;;
                        countdown) run_special countdown ;;
                        password) run_special gen_password ;;
                        type) run_special typing_effect ;;
                        *) run_script "$script" "$folder" ;;
                    esac
                elif [ "$category" == "system" ]; then
                    case "$script" in
                        process-manager) run_special process_manager ;;
                        backup) run_special backup_menu ;;
                        *) run_script "$script" "$folder" ;;
                    esac
                elif [ "$category" == "tools" ]; then
                    case "$script" in
                        ascii-art) run_special ascii_art ;;
                        cow) run_special cow_says ;;
                        system-monitor) run_script "system-monitor" "system" ;;
                        *) run_script "$script" "$folder" ;;
                    esac
                elif [ "$category" == "visuals" ]; then
                    case "$script" in
                        progressbar) run_special progressbar_demo ;;
                        spinner) run_special spinner_demo ;;
                        *) run_script "$script" "$folder" ;;
                    esac
                else
                    run_script "$script" "$folder"
                fi
                ;;
            "back"|"quit"|"exit0")
                return
                ;;
        esac
    done
}

main_menu() {
    selected_idx=0
    
    while true; do
        local count=$(get_total_scripts)
        local menu_items=("📊 System Utilities" "🎮 Games" "🎉 Fun & Entertainment" "🎨 Visual Effects" "🔧 Tools & Misc" "📋 All Scripts" "ℹ️  About" "🚪 Exit")
        
        print_menu "📁 MAIN MENU (${count} scripts)" "${menu_items[@]}"
        
        input=$(get_input)
        
        case "$input" in
            "up")
                selected_idx=$(( (selected_idx - 1 + 8) % 8 ))
                ;;
            "down")
                selected_idx=$(( (selected_idx + 1) % 8 ))
                ;;
            "enter")
                case $selected_idx in
                    0) category_menu "system" ;;
                    1) category_menu "games" ;;
                    2) category_menu "fun" ;;
                    3) category_menu "visuals" ;;
                    4) category_menu "tools" ;;
                    5) all_scripts ;;
                    6) show_about ;;
                    7) clear; exit 0 ;;
                esac
                ;;
            "quit"|"exit0")
                clear
                exit 0
                ;;
        esac
    done
}

dice_roll() {
    echo ""
    echo -e "${WHITE}[1]${NC} - One die"
    echo -e "${WHITE}[2]${NC} - Two dice"
    read -p "Choose > " d
    ./games/roll-dice.sh $d
}

magic8ball() {
    echo ""
    read -p "Ask a question: " q
    [ -n "$q" ] && ./games/magic8ball.sh "$q"
}

pizza_timer() {
    echo ""
    echo -e "${WHITE}[1]${NC} - Small (7 min)"
    echo -e "${WHITE}[2]${NC} - Medium (10 min)"
    echo -e "${WHITE}[3]${NC} - Large (15 min)"
    read -p "Choose pizza size > " p
    case $p in
        1) ./fun/pizza-timer.sh small ;;
        2) ./fun/pizza-timer.sh medium ;;
        3) ./fun/pizza-timer.sh large ;;
    esac
}

pomodoro_timer() {
    echo ""
    echo -e "${WHITE}[1]${NC} - Standard (25/5 min)"
    echo -e "${WHITE}[2]${NC} - Short (5/1 min)"
    echo -e "${WHITE}[3]${NC} - Long (15/3 min)"
    read -p "Choose mode > " p
    case $p in
        1) ./fun/pomodoro.sh ;;
        2) ./fun/pomodoro.sh short ;;
        3) ./fun/pomodoro.sh long ;;
    esac
}

countdown() {
    echo ""
    read -p "Seconds: " s
    read -p "Message: " m
    ./fun/countdown.sh ${s:-60} "${m:-Time is up}"
}

gen_password() {
    echo ""
    read -p "Length [16]: " l
    read -p "Special chars? [y/n]: " yn
    ./fun/password.sh ${l:-16} ${yn:-y}
}

typing_effect() {
    echo ""
    read -p "Text: " t
    [ -n "$t" ] && ./fun/type.sh "$t"
}

process_manager() {
    echo ""
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}        ⚙️  PROCESS MANAGER         ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}[1]${NC} - View Status"
    echo -e "${WHITE}[2]${NC} - Add Process to Monitor"
    echo -e "${WHITE}[3]${NC} - Remove Process"
    echo -e "${WHITE}[4]${NC} - Check All Monitored"
    echo -e "${WHITE}[0]${NC} - Back"
    echo ""
    read -p "Choose > " choice
    
    case $choice in
        1) ./system/process-manager.sh status ;;
        2)
            read -p "Process name: " proc
            [ -n "$proc" ] && ./system/process-manager.sh add "$proc"
            ;;
        3)
            read -p "Process name: " proc
            [ -n "$proc" ] && ./system/process-manager.sh remove "$proc"
            ;;
        4) ./system/process-manager.sh check ;;
    esac
}

backup_menu() {
    echo ""
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}           💾 BACKUP TOOL            ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}[1]${NC} - Create Local Backup"
    echo -e "${WHITE}[2]${NC} - Create Remote Backup"
    echo -e "${WHITE}[3]${NC} - List Backups"
    echo -e "${WHITE}[4]${NC} - Restore Backup"
    echo -e "${WHITE}[0]${NC} - Back"
    echo ""
    read -p "Choose > " choice
    
    case $choice in
        1) ./system/backup.sh local ;;
        2) ./system/backup.sh remote ;;
        3) ./system/backup.sh list ;;
        4)
            read -p "Backup file: " file
            [ -n "$file" ] && ./system/backup.sh restore "$file"
            ;;
    esac
}

progressbar_demo() {
    echo ""
    read -p "Seconds [5]: " s
    ./visuals/progressbar.sh ${s:-5}
}

spinner_demo() {
    echo ""
    read -p "Seconds [5]: " s
    ./visuals/spinner.sh ${s:-5}
}

ascii_art() {
    echo ""
    read -p "Text: " t
    [ -n "$t" ] && ./tools/ascii-art.sh "$t"
}

cow_says() {
    echo ""
    read -p "Message: " m
    [ -n "$m" ] && ./tools/cow.sh "$m"
}

all_scripts() {
    clear
    echo ""
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}                   📋 ALL SCRIPTS                      ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    for category in games fun visuals system tools; do
        local title="${CATEGORIES[$category]:-$category}"
        echo -e "${YELLOW}📁 $title${NC}"
        
        if [ -d "$category" ]; then
            for f in "$category"/*.sh; do
                if [ -f "$f" ]; then
                    local script_name=$(basename "$f" .sh)
                    local display_name=$(get_script_name "$script_name" "$category")
                    echo -e "  ${GREEN}•${NC} $display_name"
                fi
            done
        fi
        echo ""
    done
    
    echo -en "${CYAN}Press Enter to continue...${NC}"
    read
}

trap 'clear; exit 0' INT TERM
stty -echoctl 2>/dev/null

main_menu
