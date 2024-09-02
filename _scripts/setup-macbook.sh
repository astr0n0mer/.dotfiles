#!/bin/bash

# set up dotfiles
cd ~
git clone https://github.com/astr0n0mer/.dotfiles.git
cd ~/.dotfiles
git switch post/explore/gnu-stow

# set up nix
curl --proto "=https" --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
exec $SHELL
sudo rm /etc/nix/nix.conf

# set up nix-darwin
nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin -- switch --flake ~/.dotfiles/nix-darwin-config/.config/nix-darwin-config
exec $SHELL

# set up git ssh keys
# https://dgarden.vercel.app/#/page/65bbd580-a619-4432-84be-09456abcea9c
mkdir -p ~/.ssh

# set up oh-my-zsh
# https://dgarden.vercel.app/#/page/65896e1b-bc82-4093-9415-2a50207f3e70
# INFO: this is now being done using nix-darwin
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# stow dotfiles
cd ~/.dotfiles
make stow_all

# set up oh-my-zsh-plugins
cd ~/.oh-my-zsh-custom
make download-plugins

# set up node using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
exec $SHELL
nvm --version
nvm install --lts

# set up python
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
pyenv install 3.11.9
pyenv global 3.11.9

# manual setup
open /Applications/Raycast.app
