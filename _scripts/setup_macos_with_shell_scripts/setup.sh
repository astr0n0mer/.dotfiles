#!/bin/bash

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution

# pre-requisites
echo 'export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}' >> ~/.zshrc
echo 'export HOMEBREW_CASK_OPTS="--no-quarantine"' >> ~/.zshrc
source ~/.zshrc

./set_system_settings.sh \
	&& ./setup_dotfiles_repo.sh \
	&& ./post_setup.sh
