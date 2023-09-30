# dotfiles

Collection of my config files for operating systems, tools and utilities.

- [Bash](.bashrc)
- [VS Code/Codium](./vscode/)

## Setup instructions

Create symbolic links from config files in `.dotfiles` repo to your local config files.

Syntax:

```bash
ln -s /path/to/source/file_or_folder /path/to/link/file_or_folder
```

.bashrc:

```bash
ln -s ~/projects/.dotfiles/.bashrc ~/.bashrc
```
