# dashy
alias startdashy="make -f ~/.config/dashy/Makefile start"
alias stopdashy="make -f ~/.config/dashy/Makefile stop"


# .dotfiles
dot() {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@;
}

dotedit() {
    GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME ${1:-codium} $HOME
}


# killport
killport() {
    kill -9 $(lsof -t -i:$1) && echo "Killed port: ${1}"
}


# screen
alias sc="screen"
