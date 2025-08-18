# INFO: .dotfiles
alias dotfile="find ~/.dotfiles \( -path '*/.git/*' \) -prune -o -type f -print \
                | fzf --preview 'bat {} --force-colorization --style=numbers' \
                    --preview-window=bottom:75% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
alias doted="dotfile | xargs nvim --cmd \"cd ~/.dotfiles\""
alias dotlg="lazygit --path ~/.dotfiles"
# dot() {
#     /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@;
# }
# dotgit() {
#     GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME $@
# }


# env
alias getenvvar='printenv | cut -d"=" -f1 | fzf | xargs printenv | tr -d "\n"'


# INFO: git
alias gbi="git branch | fzf"
alias ghn="gh api notifications | jq '.[].subject'"
alias ghnl="gh api notifications | jq '.[].subject' | less"
alias gstaai="git stash list | fzf | cut -d ':' -f1 | xargs git stash apply"
alias gswi="git branch | fzf | xargs git switch"
alias lg="lazygit"
alias repo="find ~/.dotfiles ~/root/{projects,projects_work} \
                    -maxdepth 4 -type d -name \".git\" -prune -exec dirname {} \; \
                | xargs -I {} git -C {} worktree list \
                | awk '{print \$1}' \
                | sort --ignore-case --reverse \
                | uniq \
                | fzf --preview 'git -C {} status' \
                    --preview-window=bottom:75% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
alias repolg="repo | xargs -I {} lazygit --path \"{}\""
source_repo_env() {
    local repo_dir="$1"
    [[ -d "$repo_dir/.venv" ]] && . "$repo_dir/.venv/bin/activate"

    set -a
    [[ -f "$repo_dir/.env" ]]       && . "$repo_dir/.env"
    [[ -f "$repo_dir/.env.local" ]] && . "$repo_dir/.env.local"
    set +a
}
repoo() {
    local repo_dir
    repo_dir=$(repo)
    if [ -n "$repo_dir" ]; then
        source_repo_env "$repo_dir"
        nvim "$repo_dir" --cmd "cd $repo_dir"
    fi
}
# repoof() {
#     local repo_dir
#     repo_dir=$(repo)
#     if [ -n "$repo_dir" ]; then
#         source_repo_env "$repo_dir"
#         nvim "$repo_dir" --cmd "cd $repo_dir" +':lua require("telescope.builtin").find_files()'
#     fi
# }
repog() {
    local repo_dir
    repo_dir=$(repo)
    if [ -n "$repo_dir" ]; then
        source_repo_env "$repo_dir"
        pushd "$repo_dir"
    fi
}


# INFO: servers
SERVERS_SESSION_NAME="servers_session"
alias servers_session_start="tmux has-session -t ${SERVERS_SESSION_NAME} 2>/dev/null || tmux new-session -d -s ${SERVERS_SESSION_NAME}"

alias digital_garden_serve="servers_session_start && \
    tmux new-window -t ${SERVERS_SESSION_NAME}: 'cd ~/root/projects/digital_garden_v2 && npx quartz build --serve'"

alias ollama_start="servers_session_start && \
    tmux new-window -t ${SERVERS_SESSION_NAME}: 'ollama serve'"

# INFO: better to use `brew services start syncthing` instead of this alias on macOS
alias syncthing_start="servers_session_start && \
    tmux new-window -t ${SERVERS_SESSION_NAME}: 'syncthing serve --no-browser'"
alias syncthing_open="open http://localhost:8384/"

alias servers_start="digital_garden_serve && ollama_start && syncthing_start"


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
