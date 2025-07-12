alias getemptydirs="find . -type d -empty -maxdepth 10 | fzf --multi"

# INFO: `multilog` usage:
# multilog <label> <log_category>
# python -m http.server | multilog "http_server" 1 &
# npx quartz build --serve | multilog "quartz" 2 &
# some_file > (multilog "some_file_label" 1) &
multilog() {
  local label="${1}"
  local log_category="${2:-1}"
  shift 2

  # Define an array of ANSI color codes
  local colors=(
    $'\033[0;31m'  # Red
    $'\033[0;32m'  # Green
    $'\033[0;33m'  # Yellow
    $'\033[0;34m'  # Blue
    $'\033[0;35m'  # Purple
    $'\033[0;36m'  # Cyan
    $'\033[1;31m'  # Bold Red
    $'\033[1;32m'  # Bold Green
    $'\033[1;34m'  # Bold Blue
  )
  local nc=$'\033[0m'  # reset

  # Select color based on log_category (wrap around colors)
  local color_index=$((log_category % ${#colors[@]}))
  local color="${colors[$color_index]}"

  sed "s/^/${color}[${label}]${nc} /"
}


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


