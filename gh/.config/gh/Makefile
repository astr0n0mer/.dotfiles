.PHONY: install
install:
	cat ~/.config/gh/extensions.txt | xargs gh extension install

.PHONY: uninstall
uninstall:
	gh extension list | cut -f2 | xargs gh extension remove

.PHONY: reinstall
reinstall: uninstall install

.PHONY: backup
backup:
	gh extension list | cut -f2 > ~/.config/gh/extensions.txt

.PHONY: upgrade
upgrade:
	gh extension upgrade --all
