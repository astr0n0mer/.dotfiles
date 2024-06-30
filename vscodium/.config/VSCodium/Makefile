PROFILES := codium-python codium-javascript

define backup-profile
	/opt/homebrew/bin/codium --profile $1 --list-extensions > $1.code-profile
endef

define restore-profile
	cat $1.code-profile | xargs -L 1 codium --profile $1 --install-extension
endef

.PHONY: backup
backup:
	cd ~/.config/VSCodium && \
	$(foreach profile,$(PROFILES),$(call backup-profile,$(profile));)

.PHONY: restore
restore:
	cd ~/.config/VSCodium && \
	$(foreach profile,$(PROFILES),$(call restore-profile,$(profile));)
