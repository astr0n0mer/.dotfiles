#!/bin/bash

# enable debugging
set -x

# pre-requisites
touch ~/.zshrc

# set up dotfiles
cd ~
git clone --recurse-submodules https://github.com/astr0n0mer/.dotfiles.git
cd ~/.dotfiles
git fetch --all
git switch switch-macbook
git remote remove origin
git remote add origin git@github.com:astr0n0mer/.dotfiles.git
rm -r dotfiles_sensitive
git clone https://gitlab.com/astr0n0mer/dotfiles_sensitive.git
# git submodule init
# git submodule update

# set up ssh keys
cd ~/.dotfiles/dotfiles_sensitive/.ssh
git remote remove origin
git remote add origin git@gitlab.com:astr0n0mer/dotfiles_sensitive.git
make decrypt
cd ..
make setup_with_dotfiles

# pre-requisite for AWS VPN Client
sudo softwareupdate --install-rosetta

# set up nix
curl --proto "=https" --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
source ~/.zshrc
sudo rm /etc/nix/nix.conf

# set up nix-darwin
LOCAL_HOSTNAME=$(scutil --get LocalHostName)
sed -i '' "s/cube/${LOCAL_HOSTNAME}/" ~/.dotfiles/nix-darwin/.config/nix-darwin/flake.nix
nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin -- switch --flake ~/.dotfiles/nix-darwin/.config/nix-darwin
source ~/.zshrc

bash ~/post-setup-macbook.sh

# # set up oh-my-zsh
# # https://dgarden.vercel.app/#/page/65896e1b-bc82-4093-9415-2a50207f3e70
# # INFO: this is now being done using nix-darwin
# # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 
# # stow dotfiles
# cd ~/.dotfiles
# make stow_all
# 
# # INFO: this is now being done using oh-my-zsh
# # set up oh-my-zsh-plugins
# # cd ~/.oh-my-zsh-custom
# # make download-plugins
# 
# # set up node using nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
# source ~/.zshrc
# nvm --version
# nvm install --lts
# 
# # set up python
# eval "$(pyenv init -)"
# # eval "$(pyenv virtualenv-init -)"
# pyenv install 3.11.9
# pyenv global 3.11.9
# 
# # manual setup
# open /Applications/Raycast.app
