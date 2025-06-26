rm -f ~/.zshrc
cd ~/.dotfiles
make --file ~/.dotfiles/Makefile stow_all


# INFO: tmux: set up plugins
cd ~/.dotfiles
make --file ~/.dotfiles/tmux/.config/tmux/Makefile setup_plugins_force

chsh -s $(which zsh) # need to logout and login again for this to take effect

sudo systemctl enable bluetooth.service
sudo systemctl start  bluetooth.service
systemctl status bluetooth.service
