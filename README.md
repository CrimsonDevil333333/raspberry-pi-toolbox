# 🫐 Raspberry Pi Toolbox

A collection of fun and useful shell scripts for Raspberry Pi with a dynamic menu system.

## 📁 Structure

```
.
├── toolbox.sh          # Main launcher (original - needs subfolders)
├── toolbox             # Self-contained script (single file - all-in-one)
├── toolbox_binary      # Compiled binary (68KB - truly standalone)
├── build.sh            # Build self-contained script
├── build_binary.sh     # Build binary
├── games/              # Game scripts
├── fun/                # Fun & entertainment scripts
├── visuals/            # Visual effect scripts
├── system/             # System utility scripts
└── tools/              # Miscellaneous tools
```

## 🚀 Quick Start

```bash
# Option 1: Self-contained script (recommended)
./toolbox

# Option 2: Compiled binary (smallest, fastest)
./toolbox_binary

# Option 3: Original (requires subfolders)
./toolbox.sh
```

## 🎮 Features

- **Games**: Hangman, Tic-Tac-Toe, Guess Number, Simon Says, Riddles, Dice, Coin Flip, Magic 8 Ball, Slot Machine, Snake, Rock-Paper-Scissors
- **Fun**: Jokes, Quotes, Pi Facts, Pizza Timer, Pomodoro Timer, Countdown, Stopwatch, Password Generator, BMI Calculator, Trivia, Brain Teasers
- **Visuals**: Matrix Rain, Text Rain, Fire, Stars, Clock, Colors, Binary Clock, ASCII Viewer
- **System**: System Monitor, Network Diagnostics, Process Manager, Security Scanner, Backup Tool, CPU/Memory Info
- **Tools**: ASCII Art, Cow Says, Hacker Sim, QR Code, Base64, IP Info, Disk Usage

## ➕ Adding New Scripts

1. **Choose a category folder**: `games/`, `fun/`, `visuals/`, `system/`, or `tools/`
2. **Create your script**: `your-script-name.sh`
3. **Make it executable**: `chmod +x your-script-name.sh`
4. **Rebuild**:
   ```bash
   ./build.sh          # creates ./toolbox (self-contained script)
   ./build_binary.sh   # creates ./toolbox_binary (compiled binary)
   ```

## 🔨 How the Build Works

### build.sh (Self-contained Script)
1. Creates a shell script with a header that extracts files
2. Embeds all files (toolbox.sh + all subfolders) as a gzip tar archive
3. Uses `__END__` marker to separate header from archive
4. Result: Single `./toolbox` file (206KB) - works on any system with bash

### build_binary.sh (Compiled Binary)
1. Copies all files to a temporary build directory
2. Creates a launcher that extracts itself to `/tmp` then runs
3. Compiles with `shc` (Shell Compiler) to create ARM binary
4. Result: Single `./toolbox_binary` file (68KB) - no bash needed

## ⌨️ Controls

| Key | Action |
|-----|--------|
| ↑↓ | Navigate menu |
| Enter | Select |
| q / 0 | Quit |
| b | Back |

## 📝 Notes

- All scripts support `q` to quit
- Run `./build.sh` or `./build_binary.sh` after adding new scripts
- The binary extracts to `/tmp/toolbox_bin_$$` on each run and cleans up on exit
