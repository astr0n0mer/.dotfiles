# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


# XDG Base Directory Specification: https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp/xdg-runtime-$UID}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Add user bin to PATH (if not already)
case ":$PATH:" in
    *":$XDG_BIN_HOME:"*) ;;
    *) PATH="$XDG_BIN_HOME:$PATH" ;;
esac
export PATH

# Create necessary directories
mkdir -p \
    "$XDG_BIN_HOME" \
    "$XDG_CACHE_HOME" \
    "$XDG_CONFIG_HOME" \
    "$XDG_DATA_HOME" \
    "$XDG_RUNTIME_DIR" \
    "$XDG_STATE_HOME"

chmod 700 "$XDG_RUNTIME_DIR"


if [ "$(uname)" = "Darwin" ]; then
    # homebrew
    [ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
    # [ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ "$(uname)" = "Linux" ]; then
    command -v gsettings > /dev/null && gsettings set org.gnome.desktop.peripherals.keyboard delay 150
    command -v gsettings > /dev/null && gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15
fi
