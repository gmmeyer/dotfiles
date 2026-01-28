#
# My Aliases
#

# Color aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

alias e='emacsclient -t'
alias emacs='emacsclient -t'

# emacs standalone
if [[ `uname` == 'Darwin' ]]; then
    alias es='/usr/local/bin/emacs'
    alias emacss='/usr/local/bin/emacs'
fi

alias mux='tmuxinator'

alias vi='nvim'
alias vim='nvim'

alias st='subl'
alias stt='subl .'

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
