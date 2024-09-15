#!/bin/bash

# INFO: Reference: https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes
# INFO: Reference: https://tech.aufomm.com/my-nix-journey-use-nix-with-ubuntu/

# enable debugging
set -e
set -x

# install nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
nix --version

mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# set up home-manager
export USER=$(whoami)
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# init home-manager
nix run home-manager/master -- init --switch

# demo
sed -i "s/# pkgs\.hello/# pkgs.hello\n    pkgs.fastfetch/" ~/.config/home-manager/home.nix
home-manager switch --flake ~/.config/home-manager
fastfetch
