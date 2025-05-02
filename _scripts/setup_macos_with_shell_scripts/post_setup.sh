#!/bin/bash

# set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# INFO: homebrew: install and set up packages
brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# INFO: AWS VPN Client: pre-requisite for installation
sudo softwareupdate --install-rosetta

brew bundle --file ~/.dotfiles/homebrew/.Brewfile


# INFO: nvm: install and set up node
command -v nvm >/dev/null || {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	export NVM_DIR="$XDG_CONFIG_HOME/nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
	command -v nvm >/dev/null && nvm install --lts
}


rm -f ~/.zshrc
make --file ~/.dotfiles/Makefile stow_all


# INFO: tmux: set up plugins
make --file ~/.dotfiles/tmux/.config/tmux/Makefile setup_plugins_force
