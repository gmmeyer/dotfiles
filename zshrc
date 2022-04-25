# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

source $HOME/.zsh/environment.zsh

if [[ `uname` == 'Darwin' ]]; then
    source $HOME/.zsh/osx.zsh
fi

source $HOME/.zsh/functions.zsh

# eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# source $ZSH/oh-my-zsh.sh

# autoloads keychain for ssh
# if command -v keychain >/dev/null 2>&1; then
#     eval `keychain --eval --agents ssh -Q --quiet id_rsa`
# fi

# gitignore!
function gi() { curl -s https://www.toptal.com/developers/gitignore/api/$@ ;}

if [[ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.zsh/overrides.zsh

# all of these insist on being last, so they are.
source $HOME/.zsh/load_scripts.zsh

source $HOME/.zsh/aliases.zsh
export "SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh"
# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you dont have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
