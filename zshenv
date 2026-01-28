
# Only load this file for non-interactive shells; interactive shells use zshrc.
[[ -o interactive ]] && return

source $HOME/.zsh/environment.zsh

if [[ `uname` == 'Darwin' ]]; then
    source $HOME/.zsh/osx.zsh
fi

source $HOME/.zsh/functions.zsh

source $HOME/.zsh/overrides.zsh

source $HOME/.zsh/load_scripts.zsh

source $HOME/.zsh/aliases.zsh