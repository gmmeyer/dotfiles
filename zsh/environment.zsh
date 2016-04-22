#
# Environment Variable Settings
#

# full color terminal
# we don't want this on some terminals!
# export TERM=xterm-256color

autoload -U bashcompinit && bashcompinit
autoload -U compinit && compinit

setopt HIST_IGNORE_DUPS

# emacs, not vim, as default
export EDITOR='emacsclient -t'
export ALTERNATE_EDITOR=''

export CASE_SENSITIVE="true"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYENV='true'

export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR=$HOME"/.nvm"

source $HOME/.zsh/environment/path.zsh
source $HOME/.zsh/environment/misc.zsh

fpath=($HOME/.zsh/completion $fpath)
