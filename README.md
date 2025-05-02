# TODOS
- TODO check if we can decommission dashy configs
- TODO cleanup home/Makefile
- TODO check if we can decommission myip/Makefile
- TODO check if we can decommission utils/Makefile
- TODO check if we can trim out unnecessary lines in zsh/addons.zsh

# dotfiles

## Setup

```shell
git clone https://github.com/astr0n0mer/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make stow_all
```

```shell
# nix-darwin setup on macOS
curl -OL https://raw.githubusercontent.com/astr0n0mer/.dotfiles/main/_scripts/Makefile
make setup
rm Makefile
./setup-macbook.sh
```

## [Dashy](https://idashy.vercel.app/)
