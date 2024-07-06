#!/bin/bash

STOW_DIR=$HOME/.dotfiles
CONFIG_NAME=$(basename $1)
CONFIG_DIRPATH_IN_STOW=${1/$HOME/$STOW_DIR\/$CONFIG_NAME}

mkdir -p $(dirname $CONFIG_DIRPATH_IN_STOW)
mv $1 $CONFIG_DIRPATH_IN_STOW
stow $CONFIG_NAME --dir $STOW_DIR
ls -al $1
