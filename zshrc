# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

autoload -U bashcompinit && bashcompinit
autoload -U compinit && compinit

alias chrome='google-chrome-stable'

# prefer pry to irb
alias irb='pry'

# editor aliases.
alias emacs='emacs24-nox'
alias e='emacs24-nox'
alias st='subl'
alias stt='subl .'
alias at='atom'
alias att='atom .'

# emacs, not vim, as default
export EDITOR='emacs'

# better apt-gets
alias apt4='sudo apt-get update && sudo apt-get dist-upgrade &&
            sudo apt-get autoremove && sudo apt-get autoclean'
alias apt6='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade &&
            sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'

# rails aliases
alias be='bundle exec'

# reload zsh
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

ZSH_THEME="awesomepanda"

CASE_SENSITIVE="true"

plugins=(bundler colored-man git lein nvm rails zsh_reload)

# autoloads keychain for ssh
eval `keychain --eval --agents ssh -Q --quiet id_rsa`

# last-working-dir github
source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

export NVM_DIR="/home/greg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function gi() { curl -s https://www.gitignore.io/api/$@ ;}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
