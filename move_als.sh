#!/bin/bash

# Define source and destination directories
SOURCE_DIR="$HOME/Documents/Organized"
DEST_DIR="$HOME/Documents/Audio"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move all .als folders from the source directory to the destination directory
find "$SOURCE_DIR" -type d -name "*.als" -exec mv {} "$DEST_DIR" \;

# Check if any folders were moved
if [ $? -eq 0 ]; then
    echo "All .als folders have been moved to $DEST_DIR"
else
    echo "No .als folders to move or an error occurred."
fi