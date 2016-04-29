# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/environment.zsh

if [[ `uname` == 'Darwin' ]]; then
    source $HOME/.zsh/osx.zsh
fi

source $HOME/.zsh/functions.zsh

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

if [[ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export NVM_DIR="/home/greg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
