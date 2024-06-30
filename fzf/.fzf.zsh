# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"

  # Auto-completion
  # ---------------
  if [ -d "/opt/homebrew/opt/fzf/shell/completion.zsh" ] ; then
    source "/opt/homebrew/opt/fzf/shell/completion.zsh"
  fi
  if [ -d "/home/linuxbrew/.linuxbrew/bin/fzf" ] ; then
    source "/home/linuxbrew/.linuxbrew/bin/fzf"
  fi

  # Key bindings
  # ------------
  # source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi
