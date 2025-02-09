#!/bin/bash

# Define the source and target directories
SOURCE_DIR="$HOME/Documents/Organized"
TARGET_DIR="$HOME/Documents/Audio"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Move .aiff and .wav files
find "$SOURCE_DIR" -type f \( -iname "*.aiff" -o -iname "*.wav" \) | while read -r file; do
    # Move the file to the target directory
    mv "$file" "$TARGET_DIR/"
    echo "Moved file: $file to $TARGET_DIR/"
done

# Move Ableton-related files and folders
find "$SOURCE_DIR" \( -type f -o -type d \) -iname "*ableton*" | while read -r item; do
    # Skip the target directory itself
    if [[ "$item" == "$TARGET_DIR" || "$item" == "$TARGET_DIR"/* ]]; then
        continue
    fi

    # Move the item to the target directory
    mv "$item" "$TARGET_DIR/"
    echo "Moved Ableton item: $item to $TARGET_DIR/"
done

echo "All .aiff, .wav, and Ableton-related files/folders have been moved to $TARGET_DIR."