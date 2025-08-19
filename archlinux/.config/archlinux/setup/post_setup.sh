#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


rm -f ~/.zshrc
cd ~/.dotfiles # TODO: this line may not be needed
make --file ~/.dotfiles/Makefile stow_all


# INFO: tmux: set up plugins
cd ~/.dotfiles # TODO: this line may not be needed
make --file ~/.dotfiles/tmux/.config/tmux/Makefile setup_plugins_force


if [[ "$(uname)" == "Linux" ]]; then
	./archlinux/set_system_settings.sh
elif [[ "$(uname)" == "Darwin" ]]; then
	./macos/set_system_settings.sh
fi
