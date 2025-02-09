#!/bin/bash

# Define the Documents directory
DOCUMENTS_DIR="$HOME/Documents"

# Change to the Documents directory
cd "$DOCUMENTS_DIR" || exit

# Loop through all files in the Documents directory
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

echo "Files in the Documents folder have been organized by type."