#!/bin/bash

# Define the source directories
DOCUMENTS_DIR="$HOME/Documents"
DOWNLOADS_DIR="$HOME/Downloads"

# Define the target directory (keith folder in Documents)
TARGET_DIR="$DOCUMENTS_DIR/keith"

# Create the keith folder if it doesn't exist
mkdir -p "$TARGET_DIR"

# Function to move and organize files
organize_files() {
    local source_dir="$1"
    # Move all files and folders from the source directory to the target directory
    find "$source_dir" -mindepth 1 -maxdepth 1 -exec mv {} "$TARGET_DIR" \;
}

# Move and organize files from Documents
organize_files "$DOCUMENTS_DIR"

# Move and organize files from Downloads
organize_files "$DOWNLOADS_DIR"

# Organize files in the keith folder by file type
cd "$TARGET_DIR" || exit

for file in *; do
    # Skip if it's a directory
    if [ -d "$file" ]; then
        continue
    fi

    # Get the file extension
    extension="${file##*.}"

    # Skip if the file has no extension
    if [ "$extension" == "$file" ]; then
        continue
    fi

    # Create a directory for the file type if it doesn't exist
    if [ ! -d "$extension" ]; then
        mkdir "$extension"
    fi

    # Move the file into the corresponding directory
    mv "$file" "$extension/"
done

echo "Files from Documents and Downloads have been combined and organized in the 'keith' folder."