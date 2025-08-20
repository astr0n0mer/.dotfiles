#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# timedatectl list-timezones # INFO: check available timezones
sudo timedatectl set-timezone "Asia/Kolkata"
timedatectl status

sudo systemctl enable bluetooth.service
sudo systemctl start  bluetooth.service
systemctl status bluetooth.service

chsh -s $(which zsh) # INFO: need to logout and login again for this to take effect
