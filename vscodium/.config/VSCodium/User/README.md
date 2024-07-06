# VS Code

## Setup instructions

Create symbolic links from VSCodium to VS Code config files.

Syntax:

```bash
ln -s /path/to/source/file_or_folder /path/to/link/file_or_folder
```

Linux:

```bash
ln -s ~/.config/VSCodium/User ~/.config/Code/User
```

macOS:

```bash
ln -s ~/Library/Application\ Support/VSCodium/User ~/Library/Application\ Support/Code/User
```

Windows:

```bash
# untested command
mklink %APPDATA%\Code\User %APPDATA%\VSCodium\User
```

## References

### Profiles

- [Profiles in Visual Studio Code](https://code.visualstudio.com/docs/editor/profiles)

### Snippets

- [Create your own snippets | VS Code Docs](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets)

- [How To Create A VSCode Snippet | Web Dev Simplified Blog](https://blog.webdevsimplified.com/2022-03/vscode-snippet/)

### VS Codium

- [Migrating from Visual Studio Code to VSCodium | VSCodium Docs](https://github.com/VSCodium/vscodium/blob/master/docs/index.md#migrating)
