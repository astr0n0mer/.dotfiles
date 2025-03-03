.PHONY: backup
backup:
	gh extension list | cut -f2 > ~/.config/gh/extensions.txt

.PHONY: restore
restore:
	cat ~/.config/gh/extensions.txt | xargs gh extension install

.PHONY: upgrade
upgrade:
	gh extension upgrade --all
