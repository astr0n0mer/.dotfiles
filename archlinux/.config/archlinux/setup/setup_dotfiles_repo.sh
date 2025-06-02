#!/bin/sh

# enable debugging
set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


if [[ "$(uname)" == "Darwin" ]]; then
	# INFO: xcode: install if not already installed
	xcode-select -p || xcode-select --install
fi

# INFO: add github.com and gitlab.com to known hosts
ssh-keyscan -H github.com gitlab.com >> ~/.ssh/known_hosts

# INFO: dotfiles: clone and set up
cd ~
# INFO: using `git` for the first time will trigger `xcode-select --install` unless installed already
# `git` is a pre-requisite for homebrew as well so `xcode-select --install` will be triggered when installing homebrew
git clone --recurse-submodules https://github.com/astr0n0mer/.dotfiles.git
cd .dotfiles
git fetch --all
git remote remove origin
git remote add origin git@github.com:astr0n0mer/.dotfiles.git

# set up ssh keys
cd dotfiles_sensitive/.ssh
git remote remove origin
git remote add origin git@gitlab.com:astr0n0mer/dotfiles_sensitive.git
make decrypt
cd ..
make setup_with_dotfiles
