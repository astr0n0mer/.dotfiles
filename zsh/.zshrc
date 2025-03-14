# INFO: zsh options man page: https://zsh.sourceforge.io/Doc/Release/Options.html
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CORRECT
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt PUSHD_IGNORE_DUPS

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
REPORTTIME=2 # INFO: show execution time for commands that take longer than 2 seconds

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# INFO: instead of pressing ↑ for every previous command, make ↑ and ↓ search based on what you've typed
bindkey "^[[A" history-beginning-search-backward # up_arrow
bindkey "^[[B" history-beginning-search-forward  # down_arrow
bindkey '^r' history-incremental-search-backward # INFO: search history with Ctrl+R

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

# source $HOME/.dotfiles/oh-my-zsh/.oh-my-zsh/custom/theme.zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# ZSH_CUSTOM=~/.oh-my-zsh-custom/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
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

# source $ZSH/oh-my-zsh.sh

# plugins' settings
# zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
