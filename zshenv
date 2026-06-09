# Loaded by every zsh, including non-interactive ones (scripts, $(...),
# editor subprocesses). Keep it to PATH and essential env vars only;
# interactive shells get the full config from zshrc.
[[ -o interactive ]] && return

source $HOME/.zsh/environment/path.zsh

export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
