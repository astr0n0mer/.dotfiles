PROFILES := python javascript

define backup-profile
	$1 --profile $2 --list-extensions | sort --ignore-case > $2.code-profile
endef

define restore-profile
	cat $2.code-profile | xargs -L 1 $1 --profile $2 --install-extension
endef

.PHONY: backup
backup:
	cd ~/.config/VSCodium && \
	command -v codium && $(foreach profile,$(PROFILES),$(call backup-profile,codium,codium-$(profile));)
	command -v code && $(foreach profile,$(PROFILES),$(call backup-profile,code,code-$(profile));)

.PHONY: restore
restore:
	cd ~/.config/VSCodium && \
	if command -v codium; then \
		$(foreach profile,$(PROFILES),$(call restore-profile,codium,codium-$(profile));) \
	fi; \
	if command -v code; then \
		$(foreach profile,$(PROFILES),$(call restore-profile,code,code-$(profile));) \
	fi;

.PHONY: test
test:
	codium --profile codium-javascript --list-extensions
