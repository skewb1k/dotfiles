#!/bin/bash

# File to save the package list
OUTPUT_FILE="arch-pkglist.txt"

echo "Listing explicitly installed packages (names only)..."

# Get package names only (first column)
pacman -Qen | awk '{print $1}' > "$OUTPUT_FILE"

echo "Done. Saved to $OUTPUT_FILE"

