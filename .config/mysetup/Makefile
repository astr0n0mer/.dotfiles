.PHONY: all
all: prerequisites cli-tools gui-tools

.PHONY: prerequisites
prerequisites: homebrew node

.PHONY: cli-tools
cli-tools: getnf omz

.PHONY: gui-tools
gui-tools:
	echo "No GUI tools to install"


.PHONY: getnf
getnf:
	@which getnf || ( \
		curl -fsSL https://raw.githubusercontent.com/ronniedroid/getnf/master/install.sh | bash && \
		getnf --help)

.PHONY: homebrew
homebrew:
	@which brew || ( \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
		(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile && \
		eval "$(/opt/homebrew/bin/brew shellenv)")

.PHONY: node
node: nvm
	@node --version || ( \
		nvm install --lts && \
		nvm current && \
		node --version)

.PHONY: nvm
nvm:
	@test -d ~/.nvm || ( \
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
		command -v nvm && \
		nvm --version)

.PHONY: omz
omz: zsh
	@which omz || ( \
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")

.PHONY: zsh
zsh:
	@which zsh || ( \
		apt install zsh && \
		chsh -s $(shell which zsh) && \
		zsh --version)

.PHONY: backup
backup:
	brew bundle dump --global

.PHONY: restore
restore:
	brew bundle install --global
