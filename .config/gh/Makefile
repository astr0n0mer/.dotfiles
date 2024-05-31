.PHONY: backup
backup:
	cd ~/.config/gh && \
	gh extension list > extensions.txt

# untested recipe
.PHONY: restore
restore:
	cd ~/.config/gh && \
	awk '{print $2}' extensions.txt | xargs gh extension install
