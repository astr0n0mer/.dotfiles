# TODOS
- TODO setup cron jobs
- TODO check if we can decommission dashy configs
- TODO cleanup home/Makefile
- TODO check if we can decommission myip/Makefile
- TODO check if we can decommission utils/Makefile
- TODO check if we can trim out unnecessary lines in zsh/addons.zsh

# dotfiles

## Setup

```shell
curl --location --parallel --remote-name-all \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/post_setup.sh \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/setup.sh \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/setup_dotfiles_repo.sh \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/setup_opendns.sh

mkdir -p archlinux/packages
cd archlinux
curl --location --parallel --remote-name-all \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/archlinux/install_packages.sh \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/archlinux/set_system_settings.sh \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/archlinux/setup_dotfiles_prerequisites.sh \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/archlinux/sync_packages.sh
cd packages
curl --location --parallel --remote-name-all \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/archlinux/packages/pacman.txt \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/archlinux/packages/yay.txt
cd ../..

mkdir -p macos
cd macos
curl --location --parallel --remote-name-all \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/macos/install_packages.sh \
	https://github.com/astr0n0mer/.dotfiles/raw/refs/heads/main/_mysetup/macos/set_system_settings.sh
cd ..

find . -type f -name "*.sh" -exec chmod u+x "{}" \;

./setup.sh
```

## [Dashy](https://idashy.vercel.app/)
