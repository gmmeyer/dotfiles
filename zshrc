# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#     source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

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

# emacs, not vim, as default
export EDITOR='emacsclient -t'

# rails aliases
alias be='bundle exec'

# reload zsh
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

CASE_SENSITIVE="true"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=true

source ~/.zsh/tmux.zsh

export PYENV_VIRTUALENVWRAPPER_PREFER_PYENV='true'

export _JAVA_AWT_WM_NONREPARENTING=1

plugins=(bundler colored-man gem git
         nvm npm pyenv
         rake rails rbenv
         ruby tmux tmuxinator
         zsh_reload)

ZSH_THEME="awesomepanda"

# autoloads keychain for ssh
eval `keychain --eval --agents ssh -Q --quiet id_rsa`

source $ZSH/oh-my-zsh.sh

# tmuxinator
# source ~/.zsh/tmuxinator.zsh

export GOPATH="~/.go"

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
      ~/.linuxbrew/bin
      ~/.linuxbrew/sbin
      ~/android-studio/bin/
      /usr/bin
      $GOPATH/bin
      $path)

classpath=(~/java/javassist/
           ~/java/swt/
           ~/java/TIJ4-code/
           ~/java/practice/
          )

CLASSPATH=$classpath

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export PKG_CONFIG_PATH='~/.linuxbrew/lib/pkgconfig/:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig'
export PKG_CONFIG_LIBDIR='~/.linuxbrew/lib/pkgconfig/:/usr/lib/pkgconfig'

if [ -f ~/.opam/opam-init/init.zsh ]; then
    source /home/greg/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi

if [ -f ~/.zsh/bash_completion/exercism_completion.bash ]; then
    source ~/.zsh/bash_completion/exercism_completion.bash
fi

if [ -f ~/.zsh/private.zsh ]; then
    source ~/.zsh/private.zsh
fi

export NVM_DIR=$HOME"/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

function gi() { curl -s https://www.gitignore.io/api/$@ ;}

# GVM
[[ -s "/home/greg/.gvm/scripts/gvm" ]] && source "/home/greg/.gvm/scripts/gvm"

if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
    source ~/.nix-profile/etc/profile.d/nix.sh
fi
