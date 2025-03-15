#!/bin/bash

# enable debugging
set -e
set -x

# # set up oh-my-zsh
# # INFO: need to run the oh-my-zsh installer in a sub-shell
# # since it blocks the main shell after installation is complete
# # and we need to `exit` the sub-shell
# touch ~/.zshrc && rm $_ && \
# mkdir -p ~/.oh-my-zsh && rm -rf $_ && \
# curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh && \
# rm ~/.zshrc

# stow dotfiles
cd ~/.dotfiles
make stow_all

# # set up oh-my-zsh-plugins
# cd ~/.oh-my-zsh/custom
# make setup_custom_plugins

# set up tmux plugins
make --file ~/.dotfiles/tmux/.config/tmux/Makefile setup_plugins

# set up node using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm --version
nvm install --lts

# # set up python
# eval "$(pyenv init -)"
# # eval "$(pyenv virtualenv-init -)"
# pyenv install 3.11.9
# pyenv global 3.11.9
