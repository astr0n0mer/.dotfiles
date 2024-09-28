.PHONY: stow_tree
stow_tree:
	ls -a . | grep "[^(.git)]" | xargs tree -al

.PHONY: stow_all
stow_all:
	find . -maxdepth 1 -type d | sed 's|^\./||' | grep '^[A-Za-z]' | grep --invert-match "dotfiles_sensitive" | xargs stow --adopt

.PHONY: unstow_all
unstow_all:
	find . -maxdepth 1 -type d | sed 's|^\./||' | grep '^[A-Za-z]' | xargs stow --delete --verbose

.PHONY: adopt
adopt:
	bash _scripts/move_to_stow.sh ${dotfile}

.PHONY: fixup_vscodium
fixup_vscodium:
	stow -D vscodium \
	&& rm -rf ~/.config/VSCodium \
	&& rm -rf ~/Library/Application Support/VSCodium/User \
	&& mv ./vscodium/.config/VSCodium ~/.config/VSCodium \
	&& stow --adopt vscodium \
	&& git restore ./vscodium
