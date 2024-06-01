# fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# gvm
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias gvm="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
# DO NOT USE $HOME/.pyenv/shims/virtualenvwrapper.sh
# Reference: https://stackoverflow.com/a/65866266/7753274
source $HOME/.pyenv/versions/3.12.1/bin/virtualenvwrapper.sh
