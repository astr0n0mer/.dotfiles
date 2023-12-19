.PHONY: default
default:
	@echo "no_target_specified"

.PHONY: monkeytype.com.json
monkeytype.com.json:
	xclip -selection c -out | json_xs > ~/projects/.dotfiles/websites/$@

.PHONY: Raycast.rayconfig
Raycast.rayconfig:
	mv -f ~/Downloads/Raycast*.rayconfig ~/projects/.dotfiles/devtools/$@

.PHONY: vimium-options.json
vimium-options.json:
	cat ~/Downloads/$@ | json_xs | tee ~/Downloads/$@
	mv -f ~/Downloads/$@ ~/projects/.dotfiles/browser-extensions/$@
