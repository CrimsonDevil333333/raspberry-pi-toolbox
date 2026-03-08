#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/.build_bin"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"/{games,fun,system,tools,visuals}

echo "Building toolbox binary..."

# Copy all files
cp "$SCRIPT_DIR/toolbox.sh" "$BUILD_DIR/"
cp "$SCRIPT_DIR"/games/*.sh "$BUILD_DIR/games/" 2>/dev/null || true
cp "$SCRIPT_DIR"/fun/*.sh "$BUILD_DIR/fun/" 2>/dev/null || true
cp "$SCRIPT_DIR"/system/*.sh "$BUILD_DIR/system/" 2>/dev/null || true
cp "$SCRIPT_DIR"/tools/*.sh "$BUILD_DIR/tools/" 2>/dev/null || true
cp "$SCRIPT_DIR"/visuals/*.sh "$BUILD_DIR/visuals/" 2>/dev/null || true

# Create simple launcher that extracts to /tmp then runs
cat > "$BUILD_DIR/run.sh" << 'EOF'
#!/bin/bash
DIR="/tmp/toolbox_bin_$$"
mkdir -p "$DIR"/{games,fun,system,tools,visuals}
trap "rm -rf $DIR" EXIT
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -r "$SCRIPT_DIR"/* "$DIR/"
cd "$DIR"
exec ./toolbox.sh "$@"
EOF

chmod +x "$BUILD_DIR/run.sh"

echo "Compiling with shc..."
shc -f "$BUILD_DIR/run.sh" -o "$SCRIPT_DIR/toolbox_binary"

rm -rf "$BUILD_DIR"

echo "Done! Binary: $SCRIPT_DIR/toolbox_binary ($(du -h "$SCRIPT_DIR/toolbox_binary" | cut -f1))"
