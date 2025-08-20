.PHONY: setup_plugins
setup_plugins:
	mkdir -p ~/.config/tmux/plugins && \
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

.PHONY: remove_plugins
remove_plugins:
	rm -rf ~/.config/tmux/plugins

.PHONY: setup_plugins_force
setup_plugins_force: remove_plugins setup_plugins
