#!/bin/bash

# Define the source directory (Feb2025Desktop on the Desktop)
SOURCE_DIR="$HOME/Desktop/Feb2025Desktop"
TARGET_DIR="$HOME/Documents/Organized"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Function to extract the common prefix from a filename
get_prefix() {
    local filename=$(basename "$1")
    # Extract the common prefix (e.g., "report" from "report_v1.pdf")
    echo "$filename" | sed -E 's/_[^_]+\.\w+$//; s/\.[^.]+\.[^.]+\.[^.]+$//; s/\.[^.]+\.[^.]+$//; s/\.[^.]+$//'
}

# Organize files by similar names
find "$SOURCE_DIR" -type f | while read -r file; do
    # Get the common prefix of the file
    prefix=$(get_prefix "$file")

    # Skip if no prefix is found
    if [[ -z "$prefix" ]]; then
        continue
    fi

    # Create a folder for the prefix if it doesn't exist
    mkdir -p "$TARGET_DIR/$prefix"

    # Move the file into the corresponding folder
    mv "$file" "$TARGET_DIR/$prefix/"
done

echo "Files from Feb2025Desktop have been organized by similar names into folders."