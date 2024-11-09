# apps
# INFO: macOS only
alias app="find /Applications /System/Applications -maxdepth 2 -name \"*.app\" \
                | sort --ignore-case \
                | fzf"
alias appopen="app | xargs -I {} open -a \"{}\""
alias appquit="app | xargs -I {} osascript -e 'quit app \"{}\"'"
alias settings="defaults domains | tr -d ' ' | tr ',' '\n' \
                    | fzf --preview 'defaults read {}' \
                        --preview-window=right:60% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
#! ==========


# brave
alias getsyncedtabs="open -a 'Brave Browser' brave://history/syncedTabs; \
                        cat ~/.config/brave/get-synced-tabs.js | pbcopy"


# dashy
alias dashystart="make -f ~/.config/dashy/Makefile start"
alias dashystop="make -f ~/.config/dashy/Makefile stop"
alias dashycleanup="make -f ~/.config/dashy/Makefile cleanup"
alias dashypublish="make -f ~/.config/dashy/Makefile publish"


# digital-garden
alias gardenpublish="make -f ~/projects/digital-garden/Makefile publish"


# .dotfiles
alias dotfile="find ~/.dotfiles \( -path '*/.git/*' \) -prune -o -type f -print \
                | fzf --preview 'bat {} --force-colorization --style=numbers' \
                    --preview-window=bottom:90% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
alias doted="dotfile | xargs nvim --cmd \"cd ~/.dotfiles\""
alias dotlg="lazygit --path ~/.dotfiles"
alias rmemptydirs="find . -type d -empty -maxdepth 10 | fzf --multi | xargs rm -r"
dot() {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@;
}
dotgit() {
    GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME $@
}


# env
alias getenvvar='printenv | cut -d"=" -f1 | fzf | xargs printenv | tr -d "\n"'


# fastfetch
alias ff="fastfetch --logo Linux"


# git
alias gbi="git branch | fzf"
alias ghn="gh api notifications | jq '.[].subject'"
alias ghnl="gh api notifications | jq '.[].subject' | less"
alias gstaai="git stash list | fzf | cut -d ':' -f1 | xargs git stash apply"
alias gswi="git branch | fzf | xargs git switch"
alias gitprunebranches="git branch -vv \
                        | grep ': gone]' \
                        | awk '{print \$1}' \
                        | xargs git branch -D"
alias lg="lazygit"
alias repo="find ~/.dotfiles ~/{projects,projects-work} \
                    -type d -maxdepth 4 -name \".git\" -prune -exec dirname {} \; \
                | xargs -I {} git -C {} worktree list \
                | awk '{print \$1}' \
                | sort --ignore-case --reverse \
                | fzf --preview 'git -C {} status' \
                    --preview-window=right:50% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
alias repolg="repo | xargs -I {} lazygit --path \"{}\""
repoo() {
    repo_dir=$(repo)
    if [ -n "$repo_dir" ]; then
        [ -d "$repo_dir/.venv" ] && . "$repo_dir/.venv/bin/activate"
        nvim "$repo_dir" --cmd "cd $repo_dir"
    fi
}
repoof() {
    repo_dir=$(repo)
    if [ -n "$repo_dir" ]; then
        [ -d "$repo_dir/.venv" ] && . "$repo_dir/.venv/bin/activate"
        nvim "$repo_dir" --cmd "cd $repo_dir" +':lua require("telescope.builtin").find_files()'
    fi
}
repog() {
    repo_dir=$(repo)
    if [ -n "$repo_dir" ]; then
        pushd "$repo_dir"
        [ -d "$repo_dir/.venv" ] && . "$repo_dir/.venv/bin/activate"
    fi
}


# haxor-news
alias haxor="workon haxor-news && haxor-news && deactivate"


# history
# history | awk '{$1=""; print substr($0,2)}' | sort | uniq | fzf
alias histi='history | awk '\''{$1=""; print substr($0,2)}'\'' | sort | uniq | fzf'


# IP address
myip() {
    make -f ~/.config/myip/Makefile get-myip version="$1"
}


# killport
killport() {
    kill -9 $(lsof -t -i:$1) && echo "Killed port: ${1}"
}


# logout
alias logout="launchctl reboot logout"


# ls
alias lssymlinks="find . -maxdepth 7 -type l -exec ls -l {} \;"


# man page
alias mani="compgen -c | fzf --preview 'man {}' --preview-window=right:50% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"


# music
alias musicstart="screen -S music-session ytermusic"
alias musicstop="screen -S music-session -X quit"


# nix
# INFO: home-manager switch
alias bldh="home-manager switch --flake ~/.dotfiles/home-manager/.config/home-manager"
# INFO: darwin-rebuild
alias bldd="darwin-rebuild switch --flake ~/.dotfiles/nix-darwin/.config/nix-darwin"


# screen
alias sc="screen"


# screenshot
SCREENSHOT_LOCATION="$HOME/Downloads/screenshots"
ss(){
    cd "$SCREENSHOT_LOCATION" || return 1
    ls -t1 \
        | head -n ${1:-20} \
        | xargs -I {} realpath "{}"
    popd > /dev/null
}
alias ssopen="ss | fzf | xargs -I {} open {}"
sscleanup() {
    find "$SCREENSHOT_LOCATION" -type f -mtime ${1:-+30} -exec trash -v "{}" \;
}


# search
search() {
    local search_engines engine query url
    search_engines="$HOME/.dotfiles/oh-my-zsh/.oh-my-zsh/custom/search_engines.json"
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


# speedtest
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - "


# syncthing
alias syncstart="make -f ~/Makefile syncthing-start"
alias syncstop="make -f ~/Makefile syncthing-stop"
alias syncopen="make -f ~/Makefile syncthing-open"


# timer
timer() {
    terminal-notifier -message "Timer started for ${1:=25} min" -sound default
    (sleep $((${1:=25} * 60)) && \
        terminal-notifier -message ${2:="Timer for ${1:=25} min ended"} -sound default) &
}
