#!/bin/bash

BACKUP_DIR="/backup"
SOURCE_DIRS=("/home" "/etc" "/var/www")
REMOTE_HOST=""
REMOTE_USER=""
REMOTE_PATH=""
COMPRESSION="gzip"
DAYS_TO_KEEP=7

usage() {
    echo "Usage: $0 {local|remote|list|restore} [options]"
    echo ""
    echo "Commands:"
    echo "  local              - Create local backup"
    echo "  remote             - Create remote backup (requires SSH config)"
    echo "  list               - List existing backups"
    echo "  restore <file>    - Restore from backup"
    echo ""
    echo "Options:"
    echo "  -d <dir>   - Backup directory (default: $BACKUP_DIR)"
    echo "  -k <days>  - Days to keep backups (default: $DAYS_TO_KEEP)"
    exit 1
}

create_backup() {
    timestamp=$(date +%Y%m%d_%H%M%S)
    backup_name="backup_${timestamp}.tar.gz"
    
    mkdir -p "$BACKUP_DIR"
    
    echo "Creating backup: $backup_name"
    echo "Sources: ${SOURCE_DIRS[*]}"
    
    tar -czf "$BACKUP_DIR/$backup_name" "${SOURCE_DIRS[@]}" 2>/dev/null
    
    if [ -f "$BACKUP_DIR/$backup_name" ]; then
        size=$(du -h "$BACKUP_DIR/$backup_name" | cut -f1)
        echo "✅ Backup created: $backup_name ($size)"
        
        echo "Cleaning old backups (keeping last $DAYS_TO_KEEP days)..."
        find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$DAYS_TO_KEEP -delete
    else
        echo "❌ Backup failed"
        exit 1
    fi
}

remote_backup() {
    if [ -z "$REMOTE_HOST" ]; then
        echo "❌ Remote host not configured"
        echo "Edit script to set REMOTE_HOST, REMOTE_USER, REMOTE_PATH"
        exit 1
    fi
    
    create_backup
    backup_name=$(ls -t "$BACKUP_DIR" | head -1)
    
    echo "Transferring to remote..."
    scp "$BACKUP_DIR/$backup_name" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"
    
    if [ $? -eq 0 ]; then
        echo "✅ Transferred to remote"
    else
        echo "❌ Transfer failed"
    fi
}

list_backups() {
    echo "=== Available Backups ==="
    ls -lh "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null || echo "No backups found"
    echo ""
    echo "Total backups: $(ls -1 "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | wc -l)"
}

restore_backup() {
    if [ -z "$1" ]; then
        echo "Usage: $0 restore <filename>"
        exit 1
    fi
    
    backup_file="$BACKUP_DIR/$1"
    
    if [ ! -f "$backup_file" ]; then
        echo "❌ Backup file not found: $backup_file"
        exit 1
    fi
    
    echo "⚠️  This will restore from: $backup_file"
    echo "⚠️  Press Ctrl+C to cancel, Enter to continue"
    read
    
    tar -xzf "$backup_file" -C /
    echo "✅ Restore complete"
}

while getopts "d:k:" opt; do
    case $opt in
        d) BACKUP_DIR="$OPTARG" ;;
        k) DAYS_TO_KEEP="$OPTARG" ;;
    esac
done
shift $((OPTIND-1))

case "$1" in
    local) create_backup ;;
    remote) remote_backup ;;
    list) list_backups ;;
    restore) restore_backup "$2" ;;
    *) usage ;;
esac
