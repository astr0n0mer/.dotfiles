# apps
alias app="find /Applications /System/Applications -maxdepth 2 -name \"*.app\" \
    | sort --ignore-case \
    | fzf"
alias appopen="app | xargs -I {} open -a \"{}\""
alias appquit="app | xargs -I {} osascript -e 'quit app \"{}\"'"
alias settings="defaults domains | tr -d ' ' | tr ',' '\n' \
    | fzf \
        --preview 'defaults read {} \
            | bat --force-colorization --style=numbers --language=json' \
        --preview-window=right:60% \
        --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"


# homebrew
alias brew_backup="brew bundle dump --force --global &"
alias brew_restore="brew bundle --global &"


# image manipulation
get_max_image_height() {
    local max=0
    for file in "$@"; do
        if [[ -f "$file" ]]; then
            height=$(sips --getProperty pixelHeight "$file" 2>/dev/null | awk 'NR==2 {print $2}')
            if [[ "$height" =~ ^[0-9]+$ ]] && (( height > max )); then
                max=$height
            fi
        fi
    done
    echo "$max"
}
get_max_image_width() {
    local max=0
    for file in "$@"; do
        if [[ -f "$file" ]]; then
            width=$(sips --getProperty pixelWidth "$file" 2>/dev/null | awk 'NR==2 {print $2}')
            if [[ "$width" =~ ^[0-9]+$ ]] && (( width > max )); then
                max=$width
            fi
        fi
    done
    echo "$max"
}


# logout
alias logout="launchctl reboot logout"


# notify
alias notify="fc -ln -1 | terminal-notifier -sound default"


# speedtest
# alias speedtest="networkQuality -v"


# timer
timer() {
    terminal-notifier -message "Timer started for ${1:=25} min" -sound default
    (sleep $((${1:=25} * 60)) && \
        terminal-notifier -message ${2:="Timer for ${1:=25} min ended"} -sound default) &
}
