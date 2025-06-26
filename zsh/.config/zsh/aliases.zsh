export ZSH_CONFIG="${XDG_CONFIG_HOME}/zsh"
. "${ZSH_CONFIG}/aliases.development.zsh"
. "${ZSH_CONFIG}/aliases.utilities.zsh"

if [[ "$(uname)" == "Darwin" ]]; then
    . "${ZSH_CONFIG}/aliases.macos_only.zsh"
elif [[ "$(uname)" == "Linux" ]]; then
    # INFO: Linux specific aliases
    # speedtest
    alias speedtest="curl --silent https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - "
fi

# brave
alias getsyncedtabs="open -a 'Brave Browser' brave://history/syncedTabs; \
                        cat ~/.config/brave/get_synced_tabs.js | pbcopy"


# dashy
# alias dashystart="make -f ~/.config/dashy/Makefile start"
# alias dashystop="make -f ~/.config/dashy/Makefile stop"
# alias dashycleanup="make -f ~/.config/dashy/Makefile cleanup"
# alias dashypublish="make -f ~/.config/dashy/Makefile publish"


# # digital_garden
# alias diary="nvim --cmd 'cd ~/projects/digital_garden_vimwiki/' +':VimwikiMakeDiaryNote'"
# alias gardenpublish="make -f ~/projects/digital_garden/Makefile publish"


# history
# alias histi='history | awk '\''{$1=""; print substr($0,2)}'\'' | sort | uniq | fzf'


# IP address
myip() {
    make -f ~/.config/myip/Makefile get-myip version="$1"
}


# killport
killport() {
    kill -9 $(lsof -t -i:$1) && echo "Killed port: ${1}"
}


# ls
alias lssymlinks="find . -maxdepth 7 -type l -exec ls -l {} \;"


# man page
alias mani="compgen -c | fzf --preview 'man {}' --preview-window=right:50% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"


# music
# alias musicstart="screen -S music-session ytermusic"
# alias musicstop="screen -S music-session -X quit"


# INFO: install pip packages
alias pipxi="cat ~/.dotfiles/home/.config/home/requirements.in | xargs -I {} pipx install {}"


# search
search() {
    local search_engines engine query url
    search_engines="$HOME/.dotfiles/zsh/.config/zsh/search_engines.json"
    engine=$(jq --raw-output '.[] | "\(.trigger); \(.name): \(.url)"' "$search_engines" | fzf | sed "s/.*: //")
    if [ -z "$engine" ]; then
        return 1
    fi
    read -r "query?Enter search query: "
    url=$(echo "$engine" | sed "s/%s/$query/i")
    echo "$url"
}
so() {
    local result
    result=$(search)
    if [ -n "$result" ]; then
        open "$result"
    fi
}


# INFO: shorthand aliases for common commands
alias ff="fastfetch"
alias y="yazi"
