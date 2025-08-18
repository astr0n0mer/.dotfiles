#!/bin/sh

set -e # Exit on error
set -x # Enable debugging

# INFO: The `sed` command here substitutes comments with "" and removes empty lines.
sed -E 's/#.*//; /^[[:space:]]*$/d' ./packages/pacman.txt | sudo pacman -S --needed -
sed -E 's/#.*//; /^[[:space:]]*$/d' ./packages/yay.txt    | yay --sync --needed -
