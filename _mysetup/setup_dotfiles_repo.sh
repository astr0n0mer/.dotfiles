#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# INFO: dotfiles: clone and set up
cd ~
git clone --recurse-submodules https://github.com/astr0n0mer/.dotfiles.git

cd .dotfiles/dotfiles_sensitive/.ssh
make decrypt
cd ..
make setup_with_dotfiles
