#!/bin/sh

set -e # Exit on error
set -x # Enable debugging

sudo pacman --sync --needed - < ./pacman_pkgs.txt
yay --sync --needed - < ./yay_pkgs.txt

# sudo pacman --sync --needed - < $(sed -E 's/#.*//' ./pacman_pkgs.txt | sed -E '/^\s*/d')
