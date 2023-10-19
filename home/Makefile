.PHONY: default
default:
	@echo "no_target_specified"

.PHONY: monkeytype.com.json
monkeytype.com.json:
	xclip -selection c -out | json_xs > ~/projects/.dotfiles/websites/$@

.PHONY: vimium-options.json
vimium-options.json:
	cat ~/Downloads/$@ | json_xs | tee ~/Downloads/$@
	mv ~/Downloads/$@ ~/projects/.dotfiles/browser-extensions/$@ -f
