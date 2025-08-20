#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# INFO: The `sed` command here substitutes comments with "" and removes empty lines.
sed -E 's/#.*//; /^[[:space:]]*$/d' ./packages/pacman.txt | sudo pacman --sync --needed --noconfirm -
sed -E 's/#.*//; /^[[:space:]]*$/d' ./packages/yay.txt    | yay         --sync --needed --noconfirm -
