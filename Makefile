OS_NAME := $(shell uname -s)
TERMINAL_NOTIFIER := $(if $(filter Darwin,$(OS_NAME)), \
						/opt/homebrew/bin/terminal-notifier, \
						$(HOME)/.local/bin/terminal-notifier)
PASTE := $(if $(filter Darwin,$(OS_NAME)), \
			pbpaste, \
			xclip -selection c -out)

.PHONY: default
default:
	@echo "error: no_target_specified"

# sync local config files to remote
.PHONY: dotfiles-pull
dotfiles-pull:
	export GIT_DIR=${HOME}/.dotfiles; export GIT_WORK_TREE=${HOME}; git fetch --all && git pull;

# sync local files across devices
.PHONY: syncthing-start
syncthing-start:
	screen -dmS syncthing-session syncthing

.PHONY: syncthing-stop
syncthing-stop:
	pkill syncthing

.PHONY: syncthing-open
syncthing-open:
	open http://localhost:8384/

# config file backups
.PHONY: monkeytype-settings.json
monkeytype-settings.json:
	# open https://monkeytype.com/settings#exportSettingsButton
	${PASTE} | json_xs > ~/.config/monkeytype/settings.json

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
	test -f ~/Downloads/$@ && \
		((cat ~/Downloads/$@ | json_xs | tee ~/Downloads/$@ > /dev/null ) && \
		(mv -f ~/Downloads/$@ ~/.config/vimium/$@)) || \
		(open -a 'Brave Browser' chrome-extension://dbepggeogbaibhgnhhndojpepiihcmeb/pages/options.html)

.PHONY: tampermonkey-backup.json
tampermonkey-backup.json:
	test -f ~/Downloads/tampermonkey-backup-*.txt && \
		((cat ~/Downloads/tampermonkey-backup-*.txt | json_xs | tee ~/.config/tampermonkey/$@ > /dev/null ) && \
		(trash ~/Downloads/tampermonkey-backup-*.txt)) || \
		(open -a 'Brave Browser' chrome-extension://dhdgffkkebhmkfjojejmpbldmpobfkfo/options.html#nav=utils)

# cron jobs
.PHONY: startup
startup:
	${TERMINAL_NOTIFIER} -title "Cron startup" -message "Running startup commands" -sound default
	{ \
		echo "\n======== $(shell date) ========"; \
		make -f ~/Makefile dotfiles-pull; \
		make -f ~/Makefile syncthing-start; \
	} >> ~/crontab-startup.log 2>&1

.PHONY: cron-daily
cron-daily:
	${TERMINAL_NOTIFIER} -title "Cron daily" -message "Running daily commands" -sound default
	{ \
		echo "\n======== $(shell date) ========"; \
		make -f ~/Makefile raycast-settings.rayconfig notify=1 && sleep 1; \
		make -f ~/.config/crontab/Makefile getconfig notify=1 && sleep 1; \
		make -f ~/.config/dashy/Makefile cron notify=1 && sleep 1; \
		make -f ~/.config/macos/Makefile backup notify=1; \
		make -f ~/.config/VSCodium/Makefile backup notify=1; \
	} >> ~/crontab-daily.log 2>&1

.PHONY: cron-weekly
cron-weekly:
	${TERMINAL_NOTIFIER} -title "Cron weekly" -message "not implemented yet" -sound default

# setup
.PHONY: mysetup
mysetup:
	make -f ~/.config/mysetup/Makefile all
