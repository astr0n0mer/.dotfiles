#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# INFO: The `sed` command here:
# - substitutes "#" and anything after it with ""
# - substitutes leading spaces with ""
# - substitutes trailing spaces with ""
# - deletes empty lines
sed -E 's/#.*//; s/^[[:space:]]+//; s/[[:space:]]+$//; /^[[:space:]]*$/d' ./packages/pacman.txt \
    | sudo pacman --sync --needed --noconfirm -- -
sed -E 's/#.*//; s/^[[:space:]]+//; s/[[:space:]]+$//; /^[[:space:]]*$/d' ./packages/yay.txt \
    | yay         --sync --needed --noconfirm -- -

systemctl --user enable syncthing.service
systemctl --user start syncthing.service
systemctl --user status syncthing.service
# INFO: view logs using `journalctl --user --follow --unit syncthing.service`
