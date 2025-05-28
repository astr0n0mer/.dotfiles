#!/bin/sh

set -e # Exit on error
set -x # Enable debugging

# INFO: install yay AUR helper
cd $(mktemp -d)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

./sync_pkgs.sh
