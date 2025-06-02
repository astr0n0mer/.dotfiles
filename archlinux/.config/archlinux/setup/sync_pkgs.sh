#!/bin/sh

set -e # Exit on error
set -x # Enable debugging

sudo pacman --sync --needed - < ./pacman_pkgs.txt
yay --sync --needed - < ./yay_pkgs.txt
