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


# haxor-news
alias haxor="workon haxor-news && haxor-news && deactivate"


# ls
alias lssymlinks="find . -maxdepth 1 -type l -exec ls -l {} \;"


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


# openapp
alias openapp="ls -1 /Applications /System/Applications /System/Applications/Utilities | grep '.app' | fzf | xargs -I {} open -a \"{}\""


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
