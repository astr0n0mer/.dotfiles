# INFO: .dotfiles
alias dotfile="find ~/.dotfiles \( -path '*/.git/*' \) -prune -o -type f -print \
                | fzf --preview 'bat {} --force-colorization --style=numbers' \
                    --preview-window=bottom:90% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
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
alias repo="find ~/.dotfiles ~/{projects,projects_work} \
                    -maxdepth 4 -type d -name \".git\" -prune -exec dirname {} \; \
                | xargs -I {} git -C {} worktree list \
                | awk '{print \$1}' \
                | sort --ignore-case --reverse \
                | fzf --preview 'git -C {} status' \
                    --preview-window=right:50% --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'"
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
repoof() {
    local repo_dir
    repo_dir=$(repo)
    if [ -n "$repo_dir" ]; then
        source_repo_env "$repo_dir"
        nvim "$repo_dir" --cmd "cd $repo_dir" +':lua require("telescope.builtin").find_files()'
    fi
}
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
alias setup_servers_session="tmux has-session -t ${SERVERS_SESSION_NAME} 2>/dev/null || tmux new-session -d -s ${SERVERS_SESSION_NAME}"

alias ollama_start="setup_servers_session && \
    tmux new-window -t ${SERVERS_SESSION_NAME}: 'ollama serve'"

alias syncthing_start="setup_servers_session && \
    tmux new-window -t ${SERVERS_SESSION_NAME}: 'syncthing serve --no-default-folder --no-browser'"
alias syncthing_open="open http://localhost:8384/"

alias start_servers="ollama_start && syncthing_start"


