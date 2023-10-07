# VS Code

## Setup instructions

Create symbolic links from config files in `.dotfiles` repo to your local config files.

Syntax:

```bash
ln -s /path/to/source/file_or_folder /path/to/link/file_or_folder
```

```bash
# VS Code extensions:
ln -s ~/projects/.dotfiles/text-editors/vscode/extensions.json ~/.vscode-oss/extensions/extensions.json

# VS Code settings:
ln -s ~/projects/.dotfiles/text-editors/vscode/settings.json ~/.config/VSCodium/User/settings.json

# VS Code user snippets:
ln -s ~/projects/.dotfiles/text-editors/vscode/snippets ~/.config/VSCodium/User/snippets
```

## References

### Snippets

- [Create your own snippets | VS Code Docs](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets)

- [How To Create A VSCode Snippet | Web Dev Simplified Blog](https://blog.webdevsimplified.com/2022-03/vscode-snippet/)

### VS Codium

- [Migrating from Visual Studio Code to VSCodium | VSCodium Docs](https://github.com/VSCodium/vscodium/blob/master/DOCS.md#migrating-from-visual-studio-code-to-vscodium)
