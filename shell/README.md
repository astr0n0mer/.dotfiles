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
| [dirname](https://command-not-found.com/dirname)   | Calculates the parent directory of a given file or directory path.               |
| [ffmpeg](https://command-not-found.com/ffmpeg)     | Video conversion tool.                                                           |
| [find](https://command-not-found.com/find)         | Find files or directories under the given directory tree, recursively.           |
| [gh](https://command-not-found.com/gh)             | Work seamlessly with GitHub.                                                     |
| [gio](https://command-not-found.com/gio)           | A library of handy utility functions.                                            |
| [grep](https://command-not-found.com/grep)         | Find patterns in files using regular expressions.                                |
| [json_pp](https://command-not-found.com/json_pp)   | Extends from [json_xs](https://command-not-found.com/json_xs).                   |
| [json_xs](https://command-not-found.com/json_xs)   | Converts between some input and output formats (one of them is JSON).            |
| [sort](https://command-not-found.com/sort)         | Sort lines of text files.                                                        |
| [tee](https://command-not-found.com/tee)           | Read from stdin and write to stdout and files (or commands).                     |
| [tidy](https://command-not-found.com/tidy)         | HTML syntax checker and reformatter.                                             |
| [xargs](https://command-not-found.com/xargs)       | Execute a command with piped arguments coming from another command, a file, etc. |
| [xclip](https://command-not-found.com/xclip)       | X11 clipboard manipulation tool, similar to xsel.                                |
