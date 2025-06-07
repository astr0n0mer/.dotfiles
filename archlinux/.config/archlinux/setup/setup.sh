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

# TODO: setup dotfiles
rm -f ~/.zshrc
make --file ~/.dotfiles/Makefile stow_all


# INFO: tmux: set up plugins
make --file ~/.dotfiles/tmux/.config/tmux/Makefile setup_plugins_force
