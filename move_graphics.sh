#!/bin/bash

# Define source and destination directories
SOURCE_DIR="$HOME/Documents/Organized"
DEST_DIR="$HOME/Documents/Graphics"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Loop through the source directory and move the files
for file in "$SOURCE_DIR"/*.{png,jpg,jpeg,svg,gif}; do
  if [ -e "$file" ]; then
    mv "$file" "$DEST_DIR"
  fi
done

echo "Files moved to $DEST_DIR."