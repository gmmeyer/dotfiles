# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

if [[ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/.zsh/environment.zsh
source ~/.zsh/aliases.zsh

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# source $ZSH/oh-my-zsh.sh

# autoloads keychain for ssh
eval `keychain --eval --agents ssh -Q --quiet id_rsa`

# gitignore!
function gi() { curl -s https://www.gitignore.io/api/$@ ;}

# all of these insist on being last, so they are.
source ~/.zsh/load_scripts.zsh
