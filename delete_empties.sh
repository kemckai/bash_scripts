#!/bin/bash

# Define the source directory
SOURCE_DIR="$HOME/Documents/Organized"

# Find and delete all empty folders
find "$SOURCE_DIR" -type d -empty -delete

echo "All empty folders in $SOURCE_DIR have been deleted."