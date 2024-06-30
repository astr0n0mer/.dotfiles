CONFIG_MYIP := ~/.config/myip
NETWORKSETUP := /usr/sbin/networksetup
IPV4_URL := ipv4.icanhazip.com
IPV6_URL := icanhazip.com

OS_NAME := $(shell uname -s)
COPY_TO_CLIPBOARD := $(if $(filter Darwin,$(OS_NAME)), pbcopy, xclip -selection clipboard)
TERMINAL_NOTIFIER := $(if $(filter Darwin,$(OS_NAME)), \
						/opt/homebrew/bin/terminal-notifier, \
						$(HOME)/.local/bin/terminal-notifier)

.PHONY: get-myip
get-myip:
	@if [[ "${version}" == "6" ]]; then \
		curl --silent ${IPV6_URL}; \
	else \
		curl --silent ${IPV4_URL}; \
		make -f ${CONFIG_MYIP}/Makefile record-myip; \
	fi

.PHONY: record-myip
record-myip:
	@# icanhazip.com ref: https://askubuntu.com/a/145169
	@# networksetup ref: https://stackoverflow.com/a/8542420/7753274
	@echo `curl --silent ${IPV4_URL}`$$'\t'`${NETWORKSETUP} -getairportnetwork en0 | cut -c 24-`$$'\t'`date` \
		>> ${CONFIG_MYIP}/crontab.log

.PHONY: check-if-ip-has-changed
check-if-ip-has-changed:
	@LAST_RECORDED_IP="$$(tail -n 1 ${CONFIG_MYIP}/crontab.log | cut -f1)"; \
	CURRENT_IP="$$(curl --silent ${IPV4_URL})"; \
	make -f ${CONFIG_MYIP}/Makefile record-myip; \
	if [ "$$LAST_RECORDED_IP" != "$$CURRENT_IP" ]; then \
		${TERMINAL_NOTIFIER} \
			-title "MyIP" \
			-message "Your public IPv4 has changed. New IP copied to clipboard." \
			-sound default; \
		printf "$${CURRENT_IP}" | ${COPY_TO_CLIPBOARD}; \
	else \
		echo "Your public IPv4 has not changed"; \
	fi
