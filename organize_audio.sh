#!/bin/bash

# Define the source and target directories
SOURCE_DIR="$HOME/Documents/Organized"
TARGET_DIR="$HOME/Documents/Audio"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Move folders with "audio" in the name
find "$SOURCE_DIR" -type d -iname "*audio*" | while read -r folder; do
    # Skip the target directory itself
    if [[ "$folder" == "$TARGET_DIR" || "$folder" == "$TARGET_DIR"/* ]]; then
        continue
    fi

    # Move the folder to the target directory
    mv "$folder" "$TARGET_DIR/"
    echo "Moved folder: $folder to $TARGET_DIR/"
done

echo "All folders with 'audio' in the name have been moved to $TARGET_DIR."