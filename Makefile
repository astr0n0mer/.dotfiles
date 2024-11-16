.PHONY: stow_tree
stow_tree:
	ls -a . | tree -aI ".git"

.PHONY: stow_all
stow_all:
	find . -maxdepth 1 -type d | sed 's|^\./||' | grep '^[A-Za-z]' | grep --invert-match "dotfiles_sensitive" | xargs stow --adopt

.PHONY: unstow_all
unstow_all:
	find . -maxdepth 1 -type d | sed 's|^\./||' | grep '^[A-Za-z]' | xargs stow --delete --verbose

# .PHONY: adopt
# adopt:
# 	bash _scripts/move_to_stow.sh ${dotfile}

# .PHONY: fixup_vscodium # INFO: this might not be needed
# fixup_vscodium:
# 	stow --delete vscodium vscode \
# 	&& rm -rf ~/.config/{VSCodium,Code} \
# 	&& rm -rf ~/Library/Application Support/{VSCodium,Code}/User \
# 	&& mv ./vscodium/.config/VSCodium ~/.config/VSCodium \
# 	&& mv ./vscode/.config/Code ~/.config/Code \
# 	&& stow --adopt vscodium vscode \
# 	&& git restore vscodium vscode
