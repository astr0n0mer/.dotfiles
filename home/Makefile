.PHONY: default
default:
	@echo "no_target_specified"

.PHONY: monkeytype.com.json
monkeytype.com.json:
	xclip -selection c -out | json_xs > ~/projects/.dotfiles/websites/$@

.PHONY: Raycast.rayconfig
Raycast.rayconfig:
	mv ~/Downloads/Raycast*.rayconfig ~/projects/.dotfiles/devtools/$@ -f

.PHONY: vimium-options.json
vimium-options.json:
	cat ~/Downloads/$@ | json_xs | tee ~/Downloads/$@
	mv ~/Downloads/$@ ~/projects/.dotfiles/browser-extensions/$@ -f
