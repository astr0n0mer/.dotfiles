# dashy
alias dashystart="make -f ~/.config/dashy/Makefile start"
alias dashystop="make -f ~/.config/dashy/Makefile stop"
alias dashypublish="make -f ~/.config/dashy/Makefile publish"


# .dotfiles
dot() {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@;
}

dotedit() {
    GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME ${1:-codium} $HOME
}


# haxor-news
alias haxor="workon haxor-news && haxor-news && deactivate"


# IP address
myip() {
    make -f ~/.config/myip/Makefile get-myip version="$1"
}


# killport
killport() {
    kill -9 $(lsof -t -i:$1) && echo "Killed port: ${1}"
}


# screen
alias sc="screen"


# timer
timer() {
    terminal-notifier -message "Timer started for ${1:=25} min" -sound default
    (sleep $((${1:=25} * 60)) && \
        terminal-notifier -message ${2:="Timer for ${1:=25} min ended"} -sound default) &
}
