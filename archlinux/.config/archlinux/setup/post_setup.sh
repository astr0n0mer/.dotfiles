rm -f ~/.zshrc
make --file ~/.dotfiles/Makefile stow_all


# INFO: tmux: set up plugins
make --file ~/.dotfiles/tmux/.config/tmux/Makefile setup_plugins_force

chsh -s $(which zsh) # need to logout and login again for this to take effect
