#
# My Aliases
#

alias e='emacsclient -t'
alias emacs='emacsclient -t'

# emacs standalone
if [[ `uname` == 'Darwin' ]]; then
    alias es='command emacs'
    alias emacss='command emacs'
fi

alias mux='tmuxinator'

alias vi='vim'

alias pnt='pnpm turbo run --no-daemon'

alias js='node'

# rails aliases
alias be='bundle exec'

# reload zsh
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias gl='git pull'
compdef _git gl=git-pull
alias gll='git log --topo-order --pretty=format:"${_git_log_medium_format}"'

alias clear="clear && printf '\e[3J'"

alias k="kubectl"

alias claude-mem='bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
