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
    | yay         --sync --needed --noconfirm -

# # Enable only if not already enabled
# if ! systemctl --user is-enabled --quiet syncthing.service; then
#     systemctl --user enable syncthing.service
# fi

if ! systemctl --user --quiet is-active syncthing.service; then
    systemctl --user enable syncthing.service
    systemctl --user start syncthing.service
    # INFO: view logs
    # journalctl --user --follow --unit syncthing.service
fi
