PROJECTS := ~/root/projects
OS_NAME := $(shell uname -s)
TERMINAL_NOTIFIER := $(if $(filter Darwin,$(OS_NAME)), \
						/opt/homebrew/bin/terminal-notifier, \
						$(HOME)/.local/bin/terminal-notifier)

.PHONY: getconfig
getconfig:
	crontab -l > ~/.config/crontab/.config

# TODO: remove if this is not needed
# this is IN-PROGRESS
.PHONY: check-git-status
check-git-status:
	@TOTAL_UNTRACKED=0; \
	for dir in ${PROJECTS}/*; do \
		if [ -d "$$dir" ]; then \
			cd "$$dir" && \
			untracked_files=$$(git status --porcelain 2>/dev/null | grep '^??' | wc -l) && \
			if [ $$untracked_files -gt 0 ]; then \
				echo "$$dir: $$untracked_files"; \
				TOTAL_UNTRACKED=$$((TOTAL_UNTRACKED + untracked_files)); \
			fi; \
			cd - > /dev/null; \
		fi; \
	done; \
	echo "$$TOTAL_UNTRACKED"
