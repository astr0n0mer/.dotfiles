CONFIG_MYIP := ~/.config/myip
NETWORKSETUP := /usr/sbin/networksetup
IPV4_URL := ipv4.icanhazip.com

OS_NAME := $(shell uname -s)
COPY_TO_CLIPBOARD := $(if $(filter Darwin,$(OS_NAME)), pbcopy, xclip -selection clipboard)
TERMINAL_NOTIFIER := $(if $(filter Darwin,$(OS_NAME)), \
						/opt/homebrew/bin/terminal-notifier, \
						$(HOME)/.local/bin/terminal-notifier)

.PHONY: record-myip
record-myip:
	@# https://stackoverflow.com/a/8542420/7753274
	@echo `curl --silent ${IPV4_URL}`$$'\t'`${NETWORKSETUP} -getairportnetwork en0 | cut -c 24-`$$'\t'`date` \
		>> ${CONFIG_MYIP}/crontab.logs

.PHONY: check-if-ip-has-changed
check-if-ip-has-changed:
	@LAST_RECORDED_IP="$$(tail -n 1 ${CONFIG_MYIP}/crontab.logs | cut -f1)"; \
	CURRENT_IP="$$(curl --silent ${IPV4_URL})"; \
	make -f ${CONFIG_MYIP}/Makefile record-myip; \
	if [ "$$LAST_RECORDED_IP" != "$$CURRENT_IP" ]; then \
		${TERMINAL_NOTIFIER} \
			-title "MyIP" \
			-message "Your public IP has changed. Click to copy new IP." \
			-sound default; \
		printf "$${CURRENT_IP}" | ${COPY_TO_CLIPBOARD}; \
	else \
		echo "Your public IP has not changed"; \
	fi
