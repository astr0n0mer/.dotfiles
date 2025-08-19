#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# INFO: add github.com and gitlab.com to known hosts
mkdir -p ~/.ssh
ssh-keyscan -H github.com gitlab.com >> ~/.ssh/known_hosts

# INFO: dotfiles: clone and set up
cd ~
git clone --recurse-submodules https://github.com/astr0n0mer/.dotfiles.git
cd .dotfiles
git remote remove origin
git remote add origin git@github.com:astr0n0mer/.dotfiles.git
# git fetch --all INFO: cannot fetch, because ssh keys are not set up yet
# git branch --set-upstream-to=origin/main

# set up ssh keys
cd dotfiles_sensitive/.ssh
git remote remove origin
git remote add origin git@gitlab.com:astr0n0mer/dotfiles_sensitive.git
# git fetch --all # INFO: cannot fetch, because the repo is private
# git branch --set-upstream-to=origin/main
make decrypt
cd ..
make setup_with_dotfiles
