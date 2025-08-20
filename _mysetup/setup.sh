#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


if [[ "$(uname)" == "Linux" ]]; then
	./archlinux/setup_dotfiles_prerequisites.sh
elif [[ "$(uname)" == "Darwin" ]]; then
	xcode-select -p || xcode-select --install
fi

./setup_dotfiles_repo.sh

. ~/.dotfiles/shell/.profile
echo "$XDG_CONFIG_HOME"


if [[ "$(uname)" == "Linux" ]]; then
	cwd=$(pwd)
	cd archlinux
	./install_packages.sh
	cd "$cwd"
elif [[ "$(uname)" == "Darwin" ]]; then
	./macos/install_packages.sh
fi

./post_setup.sh
./setup_opendns.sh
