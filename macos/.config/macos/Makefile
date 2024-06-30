SETTINGS_LIBRARY := ~/Library
CONFIG_MACOS := ~/.config/macos

# Add filepath after ~/Library/
DOCK := Preferences/com.apple.dock.plist
FINDER := Preferences/com.apple.finder.plist
MOUSE := Preferences/com.apple.AppleMultitouchMouse.plist
RAYCAST := Preferences/com.raycast.macos.plist
SPOTLIGHT := Preferences/com.apple.Spotlight.plist
TERMINAL := Preferences/com.apple.Terminal.plist
TRACKPAD := Preferences/com.apple.AppleMultitouchTrackpad.plist

# Add a space after each plist filepath
SETTINGS := $(DOCK) $(FINDER) $(MOUSE) $(RAYCAST) $(SPOTLIGHT) $(TERMINAL) $(TRACKPAD)

OS_NAME := $(shell uname -s)
TERMINAL_NOTIFIER := $(if $(filter Darwin,$(OS_NAME)), \
						/opt/homebrew/bin/terminal-notifier, \
						$(HOME)/.local/bin/terminal-notifier)

.PHONY: backup
backup:
	@for SETTING in $(SETTINGS); do \
		PATH_IN_LIBRARY=$(SETTINGS_LIBRARY)/$$SETTING; \
		PATH_IN_DOTFILES=$(CONFIG_MACOS)/$$SETTING; \
		PLIST_PARENT_DIR=$$(dirname "$$PATH_IN_DOTFILES"); \
		mkdir -p "$$PLIST_PARENT_DIR"; \
		defaults export "$$PATH_IN_LIBRARY" "$$PATH_IN_DOTFILES"; \
	done \
	&& \
	if [ -n "$(notify)" ]; then \
		${TERMINAL_NOTIFIER} \
			-title "macOS" \
			-message "Backup complete" \
			-sound default; \
	fi

# I haven't tested this yet
.PHONY: restore
restore:
	@for SETTING in $(SETTINGS); do \
		PATH_IN_LIBRARY=$(SETTINGS_LIBRARY)/$$SETTING; \
		PATH_IN_DOTFILES=$(CONFIG_MACOS)/$$SETTING; \
		PLIST_PARENT_DIR=$$(dirname "$$PATH_IN_LIBRARY"); \
		mkdir -p "$$PLIST_PARENT_DIR"; \
		defaults import "$$PATH_IN_LIBRARY" "$$PATH_IN_DOTFILES"; \
	done
