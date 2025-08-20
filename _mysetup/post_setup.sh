#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# INFO: add github.com and gitlab.com to known hosts
mkdir -p ~/.ssh
ssh-keyscan -H github.com gitlab.com >> ~/.ssh/known_hosts

rm -f ~/.zshrc
cd ~/.dotfiles # TODO: this line may not be needed
make --file ~/.dotfiles/Makefile stow_all

cd ~/.dotfiles
git remote remove origin
git remote add origin git@github.com:astr0n0mer/.dotfiles.git
git fetch --all
git branch --set-upstream-to=origin/main

cd dotfiles_sensitive
git remote remove origin
git remote add origin git@gitlab.com:astr0n0mer/dotfiles_sensitive.git
git fetch --all
git switch main
git branch --set-upstream-to=origin/main


# INFO: tmux: set up plugins
cd ~/.dotfiles # TODO: this line may not be needed
make --file ~/.dotfiles/tmux/.config/tmux/Makefile setup_plugins_force


if [[ "$(uname)" == "Linux" ]]; then
	./archlinux/set_system_settings.sh
elif [[ "$(uname)" == "Darwin" ]]; then
	./macos/set_system_settings.sh
fi
