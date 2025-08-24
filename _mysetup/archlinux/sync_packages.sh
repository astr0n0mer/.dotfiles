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
    systemctl --user enable --now syncthing.service
    # systemctl --user start  syncthing.service
    # INFO: view logs
    # journalctl --user --follow --unit syncthing.service
fi

# if command -v kanata > /dev/null && ! systemctl --user --quiet is-active kanata.service; then
#     echo "service is disabled"
#     # sudo groupadd uinput
#     # sudo usermod -aG input $USER
#     # sudo usermod -aG uinput $USER
#     # echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' > "/lib/udev/rules.d/99-kanata.rules"
#     # sudo modprobe uinput
#
#     # sudo cp /usr/lib/systemd/system/kanata.service /usr/lib/systemd/user/kanata.service
#     # sudo sed --in-place "s/ --cfg.*//" /usr/lib/systemd/user/kanata.service
#     # sudo sed "s/ --cfg.*//" /usr/lib/systemd/system/kanata.service > /usr/lib/systemd/user/kanata.service
#     # systemctl --user enable --now kanata.service
#     # systemctl --user start  kanata.service
# fi
# if command -v kanata > /dev/null && ! systemctl --system --quiet is-active kanata.service; then
#     systemctl --system enable --now kanata.service
#     # systemctl --user start  kanata.service
# fi
