#!/bin/sh

set -e # Exit on error
set -x # Enable debugging

sudo pacman --sync base-devel git

cwd=$(pwd)
# INFO: install yay AUR helper
cd $(mktemp -d)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd "$cwd"

./sync_pkgs.sh
./setup_dotfiles_repo.sh
./post_setup.sh
