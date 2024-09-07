#!/bin/bash

# enable debugging
set -x

# set up oh-my-zsh
# https://dgarden.vercel.app/#/page/65896e1b-bc82-4093-9415-2a50207f3e70
# INFO: this is now being done using nix-darwin
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# pre-requisites
rm ~/.zshrc

# stow dotfiles
cd ~/.dotfiles
make stow_all

# INFO: this is now being done using oh-my-zsh
# set up oh-my-zsh-plugins
# cd ~/.oh-my-zsh-custom
# make download-plugins

# set up node using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.zshrc
nvm --version
nvm install --lts

# set up python
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
pyenv install 3.11.9
pyenv global 3.11.9

# manual setup
open /Applications/Raycast.app
