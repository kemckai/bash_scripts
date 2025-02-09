#!/bin/bash

# Define the source directory (e.g., Desktop or any other directory)
SOURCE_DIR="$HOME/Documents/Organized"
TARGET_DIR="$HOME/Documents/dotjs"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Find all folders containing .js files and move them to the target directory
find "$SOURCE_DIR" -type d | while read -r folder; do
    # Skip the target directory itself
    if [[ "$folder" == "$TARGET_DIR" || "$folder" == "$TARGET_DIR"/* ]]; then
        continue
    fi

    # Check if the folder contains any .js files
    if find "$folder" -maxdepth 1 -type f -name "*.js" | grep -q .; then
        # Move the folder to the target directory
        mv "$folder" "$TARGET_DIR/"
        echo "Moved folder: $folder to $TARGET_DIR/"
    fi
done

echo "All folders containing .js files have been moved to $TARGET_DIR."