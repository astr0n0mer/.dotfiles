.PHONY: backup
backup:
	gh extension list | awk '{print $$NF}' > ~/.config/gh/extensions.txt

.PHONY: restore
restore:
	cat ~/.config/gh/extensions.txt | xargs gh extension install
