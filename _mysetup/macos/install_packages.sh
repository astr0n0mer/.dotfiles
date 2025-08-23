#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# INFO: AWS VPN Client: pre-requisite for installation
sudo softwareupdate --install-rosetta --agree-to-license

brew bundle --file ~/.dotfiles/homebrew/.Brewfile
brew services start syncthing
brew services list
