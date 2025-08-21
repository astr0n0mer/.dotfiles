export ZSH_CONFIG="${XDG_CONFIG_HOME}/zsh"
. "${ZSH_CONFIG}/aliases.development.zsh"
. "${ZSH_CONFIG}/aliases.utilities.zsh"

if [[ "$(uname)" == "Darwin" ]]; then
    . "${ZSH_CONFIG}/aliases.macos.zsh"
elif [[ "$(uname)" == "Linux" ]]; then
    . "${ZSH_CONFIG}/aliases.archlinux.zsh"
fi

# brave
alias getsyncedtabs="open -a 'Brave Browser' brave://history/syncedTabs; \
                        cat ~/.config/brave/get_synced_tabs.js | pbcopy"


# # digital_garden
# alias diary="nvim --cmd 'cd ~/root/projects/digital_garden_vimwiki/' +':VimwikiMakeDiaryNote'"
# alias gardenpublish="make -f ~/root/projects/digital_garden/Makefile publish"


# killport
killport() {
    kill -9 $(lsof -t -i:$1) && echo "Killed port: ${1}"
}


# ls
alias lssymlinks="find . -maxdepth 7 -type l -exec ls -l {} \;"


alias pipx_install="cat ~/.dotfiles/home/.config/home/requirements.in | xargs -I {} pipx install \"{}\""


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
alias f="fastfetch"
alias y="yazi"
