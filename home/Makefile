OS_NAME := $(shell uname -s)
PASTE := $(if $(filter Darwin,$(OS_NAME)), \
			pbpaste, \
			xclip -selection c -out)

# sync local config files to remote
.PHONY: dotfiles-pull
dotfiles-pull:
	export GIT_DIR=${HOME}/.dotfiles; export GIT_WORK_TREE=${HOME}; git fetch --all && git pull;

.PHONY: kanata-start
kanata-start:
	/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate && \
	screen -dmS kanata-session sudo ~/.local/bin/kanata --cfg ~/.config/kanata/kanata.kbd

.PHONY: kanata-stop
kanata-stop:
	screen -S kanata-session -X quit

# sync local files across devices
.PHONY: syncthing-start
syncthing-start:
	screen -dmS syncthing-session ~/.local/bin/syncthing

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

.PHONY: dark-reader-settings.json
dark-reader-settings.json:
	test -f ~/Downloads/Dark-Reader-Settings.json && \
		((cat ~/Downloads/Dark-Reader-Settings.json | json_xs | tee ~/.config/dark-reader/$@ > /dev/null ) && \
		(trash ~/Downloads/Dark-Reader-Settings.json)) || \
		(open -a 'Brave Browser' chrome-extension://eimadpbcbfnmbkopoojfekhnkhdbieeh/ui/options/index.html)

.PHONY: tampermonkey-backup.json
tampermonkey-backup.json:
	test -f ~/Downloads/tampermonkey-backup-*.txt && \
		((cat ~/Downloads/tampermonkey-backup-*.txt | json_xs | tee ~/.config/tampermonkey/$@ > /dev/null ) && \
		(trash ~/Downloads/tampermonkey-backup-*.txt)) || \
		(open -a 'Brave Browser' chrome-extension://dhdgffkkebhmkfjojejmpbldmpobfkfo/options.html#nav=utils)

.PHONY: browser-extensions-backup
browser-extensions-backup: vimium-options.json dark-reader-settings.json tampermonkey-backup.json

# cron jobs
.PHONY: startup
startup:
	${TERMINAL_NOTIFIER} -title "Cron startup" -message "Running startup commands" -sound default
	{ \
		echo "\n======== $(shell date) ========"; \
		make -f ~/Makefile dotfiles-pull; \
		make -f ~/Makefile syncthing-start; \
		make -f ~/Makefile kanata-start; \
	} >> ~/crontab-startup.log 2>&1

.PHONY: cron-daily
cron-daily:
	${TERMINAL_NOTIFIER} -title "Cron daily" -message "Running daily commands" -sound default
	{ \
		echo "\n======== $(shell date) ========"; \
		make -f ~/Makefile raycast-settings.rayconfig notify=1 && sleep 1; \
		make -f ~/.config/crontab/Makefile getconfig notify=1 && sleep 1; \
		make -f ~/.config/dashy/Makefile cron notify=1 && sleep 1; \
		make -f ~/.config/gh/Makefile backup; \
		make -f ~/.config/VSCodium/Makefile backup && \
			${TERMINAL_NOTIFIER} -title "VSCodium" -message "Backup complete" -sound default; \
		make -f ~/.config/mysetup/Makefile backup && \
			${TERMINAL_NOTIFIER} -title "MySetup" -message "Backup complete" -sound default; \
	} >> ~/crontab-daily.log 2>&1

.PHONY: cron-weekly
cron-weekly:
	${TERMINAL_NOTIFIER} -title "Cron weekly" -message "not implemented yet" -sound default

# setup
.PHONY: mysetup
mysetup:
	make -f ~/.config/mysetup/Makefile all

# ========================================================
include ~/.config/utils/Makefile
.PHONY: testing-import
testing-import:
	${TERMINAL_NOTIFIER} -title "Testing import" -message "Imported utils" -sound default
