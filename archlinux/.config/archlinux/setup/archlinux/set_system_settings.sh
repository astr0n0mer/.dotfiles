#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


chsh -s $(which zsh) # INFO: need to logout and login again for this to take effect

sudo systemctl enable bluetooth.service
sudo systemctl start  bluetooth.service
systemctl status bluetooth.service
