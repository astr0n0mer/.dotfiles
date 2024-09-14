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
alias doted="dotfile | xargs nvim"
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


# git
alias gbi="git branch | fzf"
alias ghn="gh api notifications | jq '.[].subject'"
alias ghnl="gh api notifications | jq '.[].subject' | less"
alias gstaai="git stash list | fzf | cut -d ':' -f1 | xargs git stash apply"
alias gswi="git branch | fzf | xargs git switch"
alias lg="lazygit"
alias repo="find ~/.dotfiles ~/projects ~/projects-work \
                    -type d -maxdepth 5 -name \".git\" -prune -exec dirname {} \; \
                | sort --ignore-case --reverse \
                | fzf --preview 'git -C {} status' \
                    --preview-window=right:50% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
alias repolg="repo | xargs -I {} lazygit --path \"{}\""
repoo() {
    repo_dir=$(repo)
    if [ -n "$repo_dir" ]; then
        [ -d "$repo_dir/.venv" ] && source "$repo_dir/.venv/bin/activate"
        cd "$repo_dir" && nvim . && popd > /dev/null
        [ -d "$repo_dir/.venv" ] && deactivate
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
alias lssymlinks="find . -maxdepth 1 -type l -exec ls -l {} \;"


# man page
alias mani="compgen -c | fzf --preview 'man {}' --preview-window=right:50% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"


# music
alias musicstart="screen -S music-session ytermusic"
alias musicstop="screen -S music-session -X quit"


# nix
# INFO: darwin-rebuild
alias rebuildd="darwin-rebuild switch --flake ~/.dotfiles/nix-darwin/.config/nix-darwin"


# projects
# alias codei="find ~/projects/ ~/projects-work/ -type d \( -name node_modules -o -name .venv -o -name .git -o -name site-packages \) -prune -false -o -type f -print | fzf"


# screen
alias sc="screen"


# screenshot
# get last screenshot
SCREENSHOT_LOCATION="$HOME/Downloads/screenshots"
lss() {
    echo "$SCREENSHOT_LOCATION/$(ls -t1 $SCREENSHOT_LOCATION | head -n 1)"
}
olss() {
    open "$SCREENSHOT_LOCATION/$(ls -t1 $SCREENSHOT_LOCATION | head -n 1)"
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
