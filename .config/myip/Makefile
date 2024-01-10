.PHONY: record-myip
record-myip:
	echo `curl --silent ipv4.icanhazip.com`$$'\t'`date` \
		>> ~/.config/myip/crontab.logs

.PHONY: check-if-ip-has-changed
check-if-ip-has-changed:
	@last_recorded_ip=$$(tail -n 1 ~/.config/myip/crontab.logs | cut -f1); \
	current_ip=$$(curl --silent ipv4.icanhazip.com); \
	if [ "$$last_recorded_ip" != "$$current_ip" ]; then \
        say "Your public IP has changed"; \
		make -f ~/.config/myip/Makefile record-myip; \
    fi
