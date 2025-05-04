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
curl --location --remote-name https://raw.githubusercontent.com/astr0n0mer/.dotfiles/main/_scripts/setup_macos_with_shell_scripts/setup.sh
curl --location --remote-name https://raw.githubusercontent.com/astr0n0mer/.dotfiles/main/_scripts/setup_macos_with_shell_scripts/set_system_settings.sh
curl --location --remote-name https://raw.githubusercontent.com/astr0n0mer/.dotfiles/main/_scripts/setup_macos_with_shell_scripts/setup_dotfiles_repo.sh
curl --location --remote-name https://raw.githubusercontent.com/astr0n0mer/.dotfiles/main/_scripts/setup_macos_with_shell_scripts/post_setup.sh
chmod u+x setup.sh
chmod u+x set_system_settings.sh
chmod u+x setup_dotfiles_repo.sh
chmod u+x post_setup.sh
./setup.sh
```

## [Dashy](https://idashy.vercel.app/)
