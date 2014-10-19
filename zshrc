# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# full color terminal
export TERM=xterm-256color

autoload -U bashcompinit && bashcompinit
autoload -U compinit && compinit

setopt HIST_IGNORE_DUPS

# prefer pry to irb
alias irb='pry'

# editor aliases.
alias emacs='emacs -nw'
alias e='emacs -nw'
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

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=true

plugins=(bundler colored-man git lein nvm pip rvm rails tmux)

# autoloads keychain for ssh
eval `keychain --eval --agents ssh -Q --quiet id_rsa`

# last-working-dir github
source $ZSH/oh-my-zsh.sh

# tmuxinator
source ~/.zsh/tmuxinator.zsh

typeset -U path
path=(~/.rvm/bin
      $path
      /usr/local/heroku/bin
      ~/.pyenv/bin
      ~/bin
      ~/.bin
      /bin
      /usr/local/bin
      /usr/bin
)

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

function gi() { curl -s https://www.gitignore.io/api/$@ ;}

# Makes sure RVM is loaded correctly.
# God I hate RVM.
source ~/.rvm/environments/default
