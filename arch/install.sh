#!/bin/bash

# File with package list
PACKAGE_FILE="arch-pkglist.txt"

if [[ ! -f "$PACKAGE_FILE" ]]; then
	echo "Error: $PACKAGE_FILE not found!"
	exit 1
fi

echo "Installing packages from $PACKAGE_FILE using yay..."
yay -S --needed --noconfirm "$(<"$PACKAGE_FILE")"
