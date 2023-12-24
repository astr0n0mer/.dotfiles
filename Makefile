.PHONY: default
default:
	@echo "error: no_target_specified"
	@make help --silent

.PHONY: help
help:
	@echo "Available targets: sync-all, add, commit, push, pull"

.PHONY: sync-all
sync-all: pull push

.PHONY: add
add:
	git add .

.PHONY: commit
commit: add
	git commit -m "$(shell date)"

.PHONY: push
push: commit
	git push origin main

.PHONY: pull
pull:
	git pull

.PHONY: monkeytype-settings.json
monkeytype-settings.json:
	xclip -selection c -out | json_xs > ~/.config/monkeytype/settings.json

.PHONY: raycast-settings.rayconfig
raycast-settings.rayconfig:
	mv -f ~/Downloads/Raycast*.rayconfig ~/.config/raycast/settings.rayconfig

.PHONY: vimium-options.json
vimium-options.json:
	cat ~/Downloads/$@ | json_xs | tee ~/Downloads/$@
	mv -f ~/Downloads/$@ ~/.config/vimium/$@
