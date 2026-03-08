# Agent Guidelines

## Project Overview

A cross-platform shell script toolbox with a dynamic menu system. Contains games, fun utilities, visual effects, system tools, and misc utilities. Works on any Linux system with bash.

## Directory Structure

```
.
├── toolbox.sh          # Original launcher (requires subfolders)
├── toolbox             # Self-contained script (single file - all embedded)
├── toolbox_binary      # Compiled binary (standalone, ARM)
├── build.sh            # Builds self-contained ./toolbox
├── build_binary.sh    # Builds compiled ./toolbox_binary
├── games/              # Game scripts
├── fun/                # Fun & entertainment scripts
├── visuals/            # Visual effect scripts
├── system/             # System utility scripts
└── tools/              # Miscellaneous tools
```

## Running the Project

```bash
# Option 1: Self-contained (recommended) - works on any Linux
./toolbox

# Option 2: Compiled binary (ARM only)
./toolbox_binary

# Option 3: Original (requires subfolders)
./toolbox.sh
```

## Building Self-Contained Version

After adding/modifying scripts in subfolders:

```bash
# Creates ./toolbox (single file, works everywhere)
./build.sh

# Creates ./toolbox_binary (compiled, ARM only)
./build_binary.sh
```

## Adding New Scripts

1. Place `.sh` file in appropriate folder (`games/`, `fun/`, `visuals/`, `system/`, or `tools/`)
2. Make executable: `chmod +x script-name.sh`
3. Run `./build.sh` to rebuild self-contained version

## Coding Patterns

### Menu Navigation
- Uses `get_input()` for arrow key detection
- `selected_idx` tracks current selection
- Arrow keys: up/down navigate, Enter selects

### Script Execution
- `run_script "script-name - runs a" "folder"` simple script
- `run_special function_name` - runs function with input prompts

### Quit Handling
Scripts should support `q` to quit. Pattern:
```bash
if read -t 1 -n1 key; then
    if [[ "$key" == "q" || "$key" == "Q" ]]; then
        exit 0
    fi
fi
```

### Color Codes
Defined at top of toolbox.sh:
- `RED`, `GREEN`, `YELLOW`, `BLUE`, `CYAN`, `MAGENTA`, `WHITE`, `GRAY`, `NC` (no color), `BOLD`, `BG_BLACK`

## Testing

Syntax check all scripts:
```bash
for f in **/*.sh; do bash -n "$f" && echo "OK: $f"; done
```

## Notes

- All scripts must be executable
- `toolbox.sh` auto-discovers scripts in subdirectories
- Visual effects use ANSI escape codes for colors/positioning
- `./toolbox` is the distributable single file - contains all scripts embedded
