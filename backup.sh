#!/bin/bash

# Folder to save backups
DEST_DIR="$HOME/backups"
mkdir -p "$DEST_DIR"

# Backup name with timestamp
BACKUP_NAME="logs_$(date +%F_%T).tar.gz"

# Target log directory
SOURCE_DIR="/var/log"

# Run as root check
if [[ $EUID -ne 0 ]]; then
   echo "Please run as root"
   exit 1
fi

# Create archive
tar -czf "$DEST_DIR/$BACKUP_NAME" $SOURCE_DIR

echo "Logs backed up to: $DEST_DIR/$BACKUP_NAME"
