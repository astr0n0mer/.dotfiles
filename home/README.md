# home

Collection of my /home/astronomer config files.

## Setup instructions

Create symbolic links from config files in `.dotfiles` repo to your local config files.

- Syntax:

  ```bash
  ln -s /path/to/source/file_or_folder /path/to/link/file_or_folder
  ```

- [Makefile](./Makefile):

  ```bash
  rm ~/Makefile
  ln -s ~/projects/.dotfiles/home/Makefile $_
  ```
