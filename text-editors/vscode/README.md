# VS Code

## Setup instructions

Create symbolic links from config files in `.dotfiles` repo to your local config files.

Syntax:

```bash
ln -s /path/to/source/file_or_folder /path/to/link/file_or_folder
```

```bash
# for VSCodium
rm -r ~/.config/VSCodium/User # on Linux
rm -r ~/Library/Application\ Support/VSCodium/User # on macOS
rm -r %APPDATA%\VSCodium\User # on Windows
```

```bash
# for VS Code
rm -r ~/.config/Code/User # on Linux
rm -r ~/Library/Application\ Support/Code/User # on macOS
rm -r %APPDATA%\Code\User # on Windows
```

```bash
ln -s ~/projects/.dotfiles/text-editors/vscode/user $_
```

## References

### Profiles

- [Profiles in Visual Studio Code](https://code.visualstudio.com/docs/editor/profiles)

### Snippets

- [Create your own snippets | VS Code Docs](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets)

- [How To Create A VSCode Snippet | Web Dev Simplified Blog](https://blog.webdevsimplified.com/2022-03/vscode-snippet/)

### VS Codium

- [Migrating from Visual Studio Code to VSCodium | VSCodium Docs](https://github.com/VSCodium/vscodium/blob/master/docs/index.md#migrating)
