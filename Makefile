OS_NAME := $(shell uname -s)
TERMINAL_NOTIFIER := $(if $(filter Darwin,$(OS_NAME)), \
						/opt/homebrew/bin/terminal-notifier, \
						$(HOME)/.local/bin/terminal-notifier)

.PHONY: default
default:
	@echo "error: no_target_specified"

# .PHONY: sync-all
# sync-all: pull push

# .PHONY: add
# add:
# 	git add .

# .PHONY: commit
# commit: add
# 	git commit -m "$(shell date)"

# .PHONY: push
# push: commit
# 	git push origin main

# .PHONY: pull
# pull:
# 	git pull

.PHONY: monkeytype-settings.json
monkeytype-settings.json:
	xclip -selection c -out | json_xs > ~/.config/monkeytype/settings.json

.PHONY: raycast-settings.rayconfig
raycast-settings.rayconfig:
	@SOURCE_BACKUP_FILEPATH=~/Downloads/Raycast*.rayconfig; \
	DESTINATION_FILEPATH=~/.config/raycast/settings.rayconfig; \
	if mv -f $$SOURCE_BACKUP_FILEPATH $$DESTINATION_FILEPATH; then \
		MESSAGE="Backup complete"; \
	else \
		MESSAGE="No backup file found. No files changed."; \
	fi; \
	if [ -n "$(notify)" ]; then \
		${TERMINAL_NOTIFIER} \
			-title Raycast \
			-message "$$MESSAGE" \
			-sound default; \
	fi

.PHONY: vimium-options.json
vimium-options.json:
	((cat ~/Downloads/$@ | json_xs | tee ~/Downloads/$@ > /dev/null ) \
	&& (mv -f ~/Downloads/$@ ~/.config/vimium/$@)) \
	|| (echo "\nerror encountered. no files changed.")

.PHONY: cron-daily
cron-daily:
	make -f ~/Makefile raycast-settings.rayconfig notify=1 && sleep 1
	make -f ~/.config/crontab/Makefile getconfig notify=1 && sleep 1
	make -f ~/.config/dashy/Makefile cron notify=1 && sleep 1
	make -f ~/.config/macos/Makefile backup notify=1

.PHONY: syncthing-start
syncthing-start:
	screen -dmS syncthing-session syncthing

.PHONY: syncthing-stop
syncthing-stop:
	pkill syncthing

.PHONY: startup
startup:
	${TERMINAL_NOTIFIER} -title "Startup" -message "Running startup commands" -sound default
	{ \
		echo; \
		date; \
		make -f ~/Makefile syncthing-start; \
	} >> ~/crontab-startup.logs 2>&1
