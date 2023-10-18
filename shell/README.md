# shell

Collection of my shell config files.

## Setup instructions

Create symbolic links from config files in `.dotfiles` repo to your local config files.

- Syntax:

  ```bash
  ln -s /path/to/source/file_or_folder /path/to/link/file_or_folder
  ```

- [Bash](./.bashrc):

  ```bash
  rm ~/.bashrc
  ln -s ~/projects/.dotfiles/shell/.bashrc $_
  ```

## Bash commands you should know:

| Command                                            | Description                                                                      |
| -------------------------------------------------- | -------------------------------------------------------------------------------- |
| [autojump](https://command-not-found.com/autojump) | Quickly jump among the directories you visit the most.                           |
| [find](https://command-not-found.com/find)         | Find files or directories under the given directory tree, recursively.           |
| [gio](https://command-not-found.com/gio)           | A library of handy utility functions.                                            |
| [xargs](https://command-not-found.com/xargs)       | Execute a command with piped arguments coming from another command, a file, etc. |
| [xclip](https://command-not-found.com/xclip)       | X11 clipboard manipulation tool, similar to xsel.                                |
