#!/usr/bin/env zsh

# Backup script - copies home folder contents except:
# 1. Dot files/folders in home directory root
# 2. node_modules folders anywhere
# 3. Library folder

# Set destination (use provided path or default)
DESTINATION="${1:-/Volumes/Backup/backup}"
SOURCE="$HOME"

# Create destination if it doesn't exist
mkdir -p "$DESTINATION"

echo "Starting backup from $SOURCE to $DESTINATION"
echo "Excluding:"
echo "  - Dot files/folders in home directory root"
echo "  - node_modules folders everywhere"
echo "  - Library folder"
echo ""

# Use rsync with filters:
# - Include everything in root that doesn't start with dot
# - Exclude node_modules everywhere
# - Exclude Library folder
# - Preserve permissions, timestamps, etc.
rsync -av \
    --progress \
    --delete \
    --exclude='.*' \
    --exclude='node_modules' \
    --exclude='Library' \
    "$SOURCE/" "$DESTINATION/"

echo ""
echo "Backup completed!"
