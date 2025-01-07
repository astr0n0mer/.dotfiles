PROFILES := python javascript

define backup-profile
	$1 --profile "$1-$2" --list-extensions | sort --ignore-case > $2.code-profile
endef

define restore-profile
	cat $2.code-profile | xargs -L 1 $1 --profile "$1-$2" --install-extension
endef

.PHONY: backup_codium
backup_codium:
	cd ~/.dotfiles/vscodium/.config/VSCodium && \
	command -v codium && $(foreach profile,$(PROFILES),$(call backup-profile,codium,$(profile));)

.PHONY: backup_code
backup_code:
	cd ~/.dotfiles/vscodium/.config/VSCodium && \
	command -v code && $(foreach profile,$(PROFILES),$(call backup-profile,code,$(profile));)

.PHONY: backup_cursor
backup_cursor:
	cd ~/.dotfiles/vscodium/.config/VSCodium && \
	command -v cursor && $(foreach profile,$(PROFILES),$(call backup-profile,cursor,$(profile));)

.PHONY: backup_windsurf
backup_windsurf:
	cd ~/.dotfiles/vscodium/.config/VSCodium && \
	command -v windsurf && $(foreach profile,$(PROFILES),$(call backup-profile,windsurf,$(profile));)

.PHONY: backup
backup: backup_codium backup_code backup_cursor backup_windsurf

.PHONY: restore
restore:
	cd ~/.dotfiles/vscodium/.config/VSCodium && \
	if command -v codium; then \
		$(foreach profile,$(PROFILES),$(call restore-profile,codium,$(profile));) \
	fi; \
	if command -v code; then \
		$(foreach profile,$(PROFILES),$(call restore-profile,code,$(profile));) \
	fi; \
	if command -v cursor; then \
		$(foreach profile,$(PROFILES),$(call restore-profile,cursor,$(profile));) \
	fi; \
	if command -v windsurf; then \
		$(foreach profile,$(PROFILES),$(call restore-profile,windsurf,$(profile));) \
	fi;
