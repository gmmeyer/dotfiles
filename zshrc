# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

if [[ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.zsh/environment.zsh
source $HOME/.zsh/aliases.zsh

if [[ `uname` == 'Darwin' ]]; then
    source $HOME/.zsh/osx.zsh
fi

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# source $ZSH/oh-my-zsh.sh

# autoloads keychain for ssh
# if command -v keychain >/dev/null 2>&1; then
#     eval `keychain --eval --agents ssh -Q --quiet id_rsa`
# fi

# gitignore!
function gi() { curl -s https://www.gitignore.io/api/$@ ;}

# all of these insist on being last, so they are.
source $HOME/.zsh/load_scripts.zsh
