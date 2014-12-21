# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# full color terminal
export TERM=xterm-256color

# I'll set this up later
# emacs --daemon > /dev/null

autoload -U bashcompinit && bashcompinit
autoload -U compinit && compinit

setopt HIST_IGNORE_DUPS

# prefer pry to irb
alias irb='pry'

export ALTERNATE_EDITOR=''

# editor aliases.
alias emacs='emacsclient -t'
alias e='emacsclient -t'
alias st='subl'
alias stt='subl .'
alias at='atom'
alias att='atom .'

alias js='node'
alias nodejs='node'

# emacs, not vim, as default
export EDITOR='emacsclient -c'

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

# tmux

export PYENV_VIRTUALENVWRAPPER_PREFER_PYENV='true'

plugins=(bundler colored-man gem git lein nvm npm pip pyenv
          rails rbenv ruby tmux zsh_reload)


# autoloads keychain for ssh
# eval `keychain --eval --agents ssh -Q --quiet id_rsa`

# last-working-dir github
source $ZSH/oh-my-zsh.sh

# tmuxinator
# source ~/.zsh/tmuxinator.zsh

typeset -U path
path=(/usr/local/opt/pyenv/shims
      /usr/local/opt/rbenv/shims
      ~/.rbenv/bin
      /usr/local/opt/rbenv/bin
      /usr/local/heroku/bin
      /usr/local/opt/pyenv/bin
      ~/.pyenv/bin
      ~/.cabal/bin
      ~/bin
      ~/.bin
      /bin
      /usr/local/bin
      /usr/local/sbin
      /usr/bin
      $path)

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

export NVM_DIR=$HOME"/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

function gi() { curl -s https://www.gitignore.io/api/$@ ;}
