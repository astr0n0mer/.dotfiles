#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


# INFO: install or update yay AUR helper
if ! command -v yay >/dev/null 2>&1; then
	cwd="$(pwd)"
	cd "$(mktemp -d)"
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd "$cwd"
else
	echo "yay is already installed, updating..."
	yay -Syu --noconfirm
fi

./sync_packages.sh
