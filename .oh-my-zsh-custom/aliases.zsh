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


# IP address
myip() {
    # Reference: https://askubuntu.com/a/145169
    if [[ "$1" == "v6" ]]; then
        curl icanhazip.com
    else
        curl ipv4.icanhazip.com
        make --silent -f ~/.config/myip/Makefile record-myip
    fi
}


# killport
killport() {
    kill -9 $(lsof -t -i:$1) && echo "Killed port: ${1}"
}


# screen
alias sc="screen"
