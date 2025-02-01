#!/bin/bash

# enable debugging
set -e
set -x

# pre-requisites
touch ~/.zshrc

# set up dotfiles
cd ~
git clone --recurse-submodules https://github.com/astr0n0mer/.dotfiles.git
cd ~/.dotfiles
git fetch --all
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

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# set up nix
curl --proto "=https" --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
sudo rm -f /etc/nix/nix.conf

# INFO: need to restart the shell here for `nix` command to become available
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh # this should remove the need to restart the shell

# set up nix-darwin
LOCAL_HOSTNAME=$(scutil --get LocalHostName)
sed -i '' "s/cube/${LOCAL_HOSTNAME}/" ~/.dotfiles/nix-darwin/.config/nix-darwin/flake.nix
nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin/master#darwin-rebuild -- switch --flake ~/.dotfiles/nix-darwin/.config/nix-darwin

bash ~/post-setup-macbook.sh
