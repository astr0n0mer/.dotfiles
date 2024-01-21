# fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
# DO NOT USE $HOME/.pyenv/shims/virtualenvwrapper.sh
# Reference: https://stackoverflow.com/a/65866266/7753274
source $HOME/.pyenv/versions/3.12.1/bin/virtualenvwrapper.sh
