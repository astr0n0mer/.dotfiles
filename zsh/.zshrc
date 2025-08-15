# 1. Path & Environment Variables
[ -f "$HOME/.profile" ] && source "$HOME/.profile"
[ -f "$HOME/.dotfiles/shell/.profile" ] && source "$HOME/.dotfiles/shell/.profile"

# Preferred editor depending on session
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Homebrew options
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Show execution time for commands > 3s
REPORTTIME=3


# 2. Zsh Options
# Reference: https://zsh.sourceforge.io/Doc/Release/Options.html

export HISTFILE=${HISTFILE:-~/.zsh_history}
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CORRECT
setopt CORRECT_ALL
# setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
# setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS
setopt PUSHD_IGNORE_DUPS
setopt SHARE_HISTORY


# 3. Completion System Setup
# INFO: Instead of rebuilding the completion cache every time, we only do it once a day
# https://scottspence.com/posts/speeding-up-my-zsh-shell#fixing-the-completion-system-3076--10

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi
_comp_options+=(globdots) # include hidden files in completion

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select


# 4. Keybindings & History Search

# Vim keybindings
bindkey -v

# History search with arrows
bindkey "^[[A" history-beginning-search-backward  # up_arrow
bindkey "^[[B" history-beginning-search-forward   # down_arrow
bindkey '^R' history-incremental-search-backward  # Ctrl+R

# Enable Ctrl+X Ctrl+E to open the current command in $EDITOR
# reference: https://thevaluable.dev/zsh-install-configure-mouseless/#editing-command-lines-in-vim
autoload -Uz edit-command-line
zle -N edit-command-line
# bindkey '^X^E' edit-command-line
bindkey -M vicmd v edit-command-line

# Adding text objects for zsh vi mode
# https://thevaluable.dev/zsh-install-configure-mouseless/#adding-text-objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done


# 5. Plugins & Features

if [[ "$(uname)" == "Darwin" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  # source "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
elif [[ "$(uname)" == "Linux" ]]; then
  source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
bindkey '^G' autosuggest-accept  # Accept suggestion with Ctrl+G


# Git plugin
source "$HOME/.dotfiles/zsh/.config/zsh/plugins/git.plugin.zsh"

# Custom alias and addon scripts
source "$HOME/.dotfiles/zsh/.config/zsh/aliases.zsh"
source "$HOME/.dotfiles/zsh/.config/zsh/addons.zsh"


# 6. Git Info in Prompt (vcs_info)

autoload -Uz vcs_info
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
