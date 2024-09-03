# INFO: run this recipie in a new shell without setting GIT_DIR and GIT_WORK_TREE env variables
# References:
# https://superuser.com/a/1555742
# https://stackoverflow.com/a/61908260/7753274
.PHONY: download_plugins
download_plugins:
	git clone git@github.com:zsh-users/zsh-autosuggestions.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
