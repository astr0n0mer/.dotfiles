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
