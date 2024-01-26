.PHONY: record-myip
record-myip:
	@# https://stackoverflow.com/a/8542420/7753274
	@echo `curl --silent ipv4.icanhazip.com`$$'\t'`/usr/sbin/networksetup -getairportnetwork en0 | cut -c 24-`$$'\t'`date` \
		>> ~/.config/myip/crontab.logs

.PHONY: check-if-ip-has-changed
check-if-ip-has-changed:
	@last_recorded_ip=$$(tail -n 1 ~/.config/myip/crontab.logs | cut -f1); \
	current_ip=$$(curl --silent ipv4.icanhazip.com); \
	make -f ~/.config/myip/Makefile record-myip; \
	if [ "$$last_recorded_ip" != "$$current_ip" ]; then \
		/opt/homebrew/bin/terminal-notifier \
			-message "Your public IP has changed. New IP copied to clipboard." \
			-sound default; \
		echo "$$current_ip" | pbcopy; \
	else \
		echo "Your public IP has not changed"; \
	fi
