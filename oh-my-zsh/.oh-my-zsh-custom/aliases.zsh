# apps
#! macOS only
alias appopen="ls -1 /Applications /Applications/AWS\ VPN\ Client /System/Applications /System/Applications/Utilities | grep '.app' | fzf | xargs -I {} open -a \"{}\""
alias appquit="ls -1 /Applications /Applications/AWS\ VPN\ Client /System/Applications /System/Applications/Utilities | grep '.app' | fzf | xargs -I {} osascript -e 'quit app \"{}\"'"
#! ==========


# brave
alias getsyncedtabs="open -a 'Brave Browser' brave://history/syncedTabs; cat ~/.config/brave/get-synced-tabs.js | pbcopy"


# dashy
alias dashystart="make -f ~/.config/dashy/Makefile start"
alias dashystop="make -f ~/.config/dashy/Makefile stop"
alias dashycleanup="make -f ~/.config/dashy/Makefile cleanup"
alias dashypublish="make -f ~/.config/dashy/Makefile publish"


# digital-garden
alias gardenpublish="make -f ~/projects/digital-garden/Makefile publish"


# .dotfiles
dot() {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@;
}

dotedit() {
    GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME $@
}


# git
alias gbi="git branch | fzf"
alias gstaai="git stash list | fzf | cut -d ':' -f1 | xargs git stash apply"
alias gswi="git branch | fzf | xargs git switch"
alias lg="lazygit"


# haxor-news
alias haxor="workon haxor-news && haxor-news && deactivate"


# history
# history | awk '{$1=""; print substr($0,2)}' | sort | uniq | fzf
alias historyi='history | awk '\''{$1=""; print substr($0,2)}'\'' | sort | uniq | fzf'


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
alias mani="compgen -c | fzf | xargs man"


# music
alias musicstart="screen -S music-session ytermusic"
alias musicstop="screen -S music-session -X quit"


# projects
alias icode="find ~/projects/ ~/projects-work/ -type d \( -name node_modules -o -name .venv -o -name .git -o -name site-packages \) -prune -false -o -type f -print | fzf"


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
