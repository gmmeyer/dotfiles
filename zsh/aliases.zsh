#
# My Aliases
#


# prefer pry to irb
alias irb='pry'

# editor aliases.
alias e='emacsclient -t'
alias emacs='emacsclient -t'

# emacs standalone
if [[ `uname` == 'Darwin' ]]; then
    alias es='/usr/local/bin/emacs'
    alias emacss='/usr/local/bin/emacs'
fi


alias vi='vim'

alias st='subl'
alias stt='subl .'
alias at='atom'
alias att='atom .'

alias js='node'

# rails aliases
alias be='bundle exec'

# reload zsh
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias gl='git pull'
compdef _git gl=git-pull
alias gll='git log --topo-order --pretty=format:"${_git_log_medium_format}"'

alias clear="clear && printf '\e[3J'"
