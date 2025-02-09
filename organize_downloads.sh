#!/bin/bash

# Define the Downloads directory
DOWNLOADS_DIR="$HOME/Downloads"

# Change to the Downloads directory
cd "$DOWNLOADS_DIR" || exit

# Loop through all files in the Downloads directory
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

echo "Files have been organized by type."