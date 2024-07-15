# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="af-magic"     # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#af-magic
# ZSH_THEME="agnoster"     # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster # special instructions at the end of this file
# ZSH_THEME="half-life"    # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#half-life
# ZSH_THEME="jonathan"     # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#jonathan
# ZSH_THEME="mikeh"               # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#mikeh
# ZSH_THEME="muse"         # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#muse
# ZSH_THEME="nebirhos"     # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#nebirhos # won't use again: does not print absolute cwd
# ZSH_THEME="philips"      # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#philips # won't use again: does not print absolute cwd
# ZSH_THEME="robbyrussell" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#robbyrussell
# ZSH_THEME="theunraveler"        # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#theunraveler
# ZSH_THEME="tjkirch"             # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#tjkirch
# ZSH_THEME="trapd00r"            # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#trapd00r # won't use again
# ZSH_THEME="arrow"               # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#arrow
# ZSH_THEME="macovsky"            # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#macovsky
ZSH_THEME="rgm"                 # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#rgm
# ZSH_THEME="frontcube"           # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#frontcube # won't use again: prints cwd in black color
# ZSH_THEME="crunch"              # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#crunch
# ZSH_THEME="essembeh"            # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#essembeh
# ZSH_THEME="re5et"               # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#re5et
# ZSH_THEME="xiong-chiamiov-plus" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#xiong-chiamiov-plus
# ZSH_THEME="alanpeabody"         # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#alanpeabody
# ZSH_THEME="sunrise"             # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#sunrise
# ZSH_THEME="suvash"              # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#suvash
# ZSH_THEME="terminalparty"       # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#terminalparty
# ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
ZSH_CUSTOM=~/.oh-my-zsh-custom/ 

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(
    bgnotify
    colorize
    command-not-found
    gh
    git
    history
    npm
    nvm
    screen
    sudo
    vscode
    web-search
    # yarn
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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

# Add local binaries to $PATH
export PATH=$PATH:$HOME/.local/bin

# ======= custom settings for agnoster theme =======
# to hide user@hostname when using agnoster theme
# prompt_context(){}
# =======
