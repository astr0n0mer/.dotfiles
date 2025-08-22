alias get_empty_dirs="find . -type d -empty -maxdepth 10 | fzf --multi"
alias get_my_ip="curl --silent https://api.ipify.org"
alias get_my_ip_v6="curl --silent https://api64.ipify.org"
alias ls_symlinks="find . -maxdepth 7 -type l -exec ls -l {} \;"

# INFO: screenshot
SCREENSHOT_LOCATION="$HOME/Downloads/screenshots"
# ss(){
#     cd "$SCREENSHOT_LOCATION" || return 1
#     ls -t1 \
#         | head -n ${1:-20} \
#         | xargs -I {} realpath "{}"
#     popd > /dev/null
# }
# alias ssopen="ss | fzf | xargs -I {} open {}"
alias ssopen="open ${SCREENSHOT_LOCATION}/Screenshot*"
sscleanup() {
    find "$SCREENSHOT_LOCATION" -type f -mtime ${1:-+30} -exec trash --verbose "{}" \;
}


