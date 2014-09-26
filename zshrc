# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Load RVM into a shell session *as a function*

# emacs, not vim, as default
export EDITOR='emacs -nw'
# export EDITOR='vim'

# autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

alias chrome='google-chrome-stable'

# prefer pry to irb
alias irb='pry'

#bundler aliases
alias be="bundle exec"
alias bl="bundle list"
alias bp="bundle package"
alias bo="bundle open"
alias bu="bundle update"
alias bi="bundle_install"

# alias node, two characters matters.
# alias node='nodejs'
# editor aliases.
alias emacs='emacs24-nox'
alias e='emacs24-nox'
alias st='subl'
alias at='atom'

# I do not want nautilus to open
# on the desktop every time I open nautilus
alias nautilus='nautilus --no-desktop'
alias term='terminator'

# better apt-gets
alias apt4='sudo apt-get update && sudo apt-get dist-upgrade &&
            sudo apt-get autoremove && sudo apt-get autoclean'
alias apt6='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade &&
            sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# rails aliases
alias be='bundle exec'

# reload zsh
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

ZSH_THEME="awesomepanda"

CASE_SENSITIVE="true"

plugins=(colored-man git nvm rails ssh-agent
	virtualenvwrapper zsh_reload)

# last-working-dir github
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
export NVM_DIR="/home/greg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function gi() { curl -s https://www.gitignore.io/api/$@ ;}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
