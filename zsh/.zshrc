# INFO: zsh options man page: https://zsh.sourceforge.io/Doc/Release/Options.html
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CORRECT
setopt CORRECT_ALL
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt PUSHD_IGNORE_DUPS

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
REPORTTIME=3 # INFO: show execution time for commands that take longer than 3 seconds
# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# INFO: instead of pressing ↑ for every previous command, make ↑ and ↓ search based on what you've typed
bindkey "^[[A" history-beginning-search-backward # up_arrow
bindkey "^[[B" history-beginning-search-forward  # down_arrow
bindkey '^R' history-incremental-search-backward # search history with Ctrl+R
bindkey -v # enable vim mode

# source "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  bindkey '^G' autosuggest-accept # INFO: accept zsh-autosuggestion with Ctrl+G
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$HOME/.dotfiles/oh-my-zsh/.oh-my-zsh/custom/aliases.zsh"
source "$HOME/.dotfiles/oh-my-zsh/.oh-my-zsh/custom/addons.zsh"

source "$HOME/.dotfiles/oh-my-zsh/.oh-my-zsh/custom/plugins/git.zsh"

autoload -Uz vcs_info

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # INFO: enable case-insensitive tab completion
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'

precmd() {
  vcs_info

  # Check if VIRTUAL_ENV is set AND the venv is activated (i.e., in $PATH)
  if [[ -n "$VIRTUAL_ENV" && "$PATH" == "$VIRTUAL_ENV/bin:"* ]]; then
    PROMPT="%F{yellow}($(basename "$VIRTUAL_ENV")) %~$%f "
    RPROMPT="%F{yellow}${vcs_info_msg_0_} %T%f"
  else
    PROMPT="%F{green}%~$%f "
    RPROMPT="%F{green}${vcs_info_msg_0_} %T%f"
  fi
}

# Add local binaries to $PATH
export PATH=$PATH:$HOME/.local/bin

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#     alias-finder
#     bgnotify
#     command-not-found
#     gh
#     git
#     history
#     npm
#     nvm
#     sudo
#     vi-mode
#     vscode
#     web-search
#     z
#     zsh-autosuggestions
#     zsh-syntax-highlighting
# )
