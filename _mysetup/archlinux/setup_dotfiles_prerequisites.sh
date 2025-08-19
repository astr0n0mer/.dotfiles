#!/bin/sh

set -e # INFO: fail on first error
set -x # INFO: print all commands before execution


git --version || sudo pacman --sync base-devel git
