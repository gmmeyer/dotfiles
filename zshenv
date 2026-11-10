# Loaded by every zsh, including non-interactive ones (scripts, $(...),
# editor subprocesses). Keep it to PATH and essential env vars only;
# interactive shells get the full config from zshrc.
[[ -o interactive ]] && return

source $HOME/.zsh/environment/path.zsh
source $HOME/.zsh/environment/core.zsh

# Vite+ bin (https://viteplus.dev)
[ -f "$HOME/.vite-plus/env" ] && . "$HOME/.vite-plus/env"

# rustup (PATH is also covered by path.zsh; guarded so machines without rust stay quiet)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
