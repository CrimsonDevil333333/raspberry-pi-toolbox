#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="toolbox"

echo "Building self-contained toolbox..."

# Create self-extracting script
cat > "$SCRIPT_DIR/$OUTPUT" << 'LAUNCHER'
#!/bin/bash
EXTRACT_DIR="/tmp/toolbox_$$"
trap "rm -rf $EXTRACT_DIR" EXIT
mkdir -p "$EXTRACT_DIR"
SCRIPT_PATH="$(readlink -f "$0")"
sed -n '/^__END__$/,$p' "$SCRIPT_PATH" | tail -n +2 > /tmp/extracted_archive.tar.gz
tar -xzf /tmp/extracted_archive.tar.gz -C "$EXTRACT_DIR"
cd "$EXTRACT_DIR"
exec ./toolbox.sh "$@"

__END__
LAUNCHER

# Append tar archive (exclude only build artifacts)
tar -czf - -C "$SCRIPT_DIR" \
    --exclude='./toolbox' \
    --exclude='./toolbox' \
    --exclude='./build.sh' \
    --exclude='./AGENTS.md' \
    --exclude='./README.md' \
    --exclude='./.build' \
    . >> "$SCRIPT_DIR/$OUTPUT"

chmod +x "$SCRIPT_DIR/$OUTPUT"

echo "Done! Script: $SCRIPT_DIR/$OUTPUT ($(du -h "$SCRIPT_DIR/$OUTPUT" | cut -f1))"
