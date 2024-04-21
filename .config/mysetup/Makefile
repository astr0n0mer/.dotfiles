.PHONY: all
all: prerequisites tools


.PHONY: prerequisites
prerequisites: homebrew gh

.PHONY: homebrew
homebrew:
	@which brew || ( \
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
		(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile && \
		eval "$(/opt/homebrew/bin/brew shellenv)")

.PHONY: gh
gh:
	@which gh || ( \
		brew install gh && \
		gh --version)


.PHONY: tools
tools: getnf

.PHONY: getnf
getnf:
	@which getnf || ( \
		curl -fsSL https://raw.githubusercontent.com/ronniedroid/getnf/master/install.sh | bash && \
		getnf --help)
