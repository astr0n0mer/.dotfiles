.PHONY: setup-pylance
setup-pylance:
	cd $(shell find ~/.vscode-oss/extensions -name "*pylance*" -type d) && \
	cd dist && \
	cat ~/.config/VSCodium/patches/extensions/ms-python.vscode-pylance/extension.bundle.js > extension.bundle.js
