#
# Environment Variable Settings
#

# full color terminal
export TERM=xterm-256color

autoload -U bashcompinit && bashcompinit
autoload -U compinit && compinit

setopt HIST_IGNORE_DUPS

export ALTERNATE_EDITOR=''

# emacs, not vim, as default
export EDITOR='emacsclient -t'

export CASE_SENSITIVE="true"

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true

export PYENV_VIRTUALENVWRAPPER_PREFER_PYENV='true'

export _JAVA_AWT_WM_NONREPARENTING=1

plugins=(bundler colored-man gem git
         nvm npm pyenv
         rake rails rbenv
         ruby tmux tmuxinator
         zsh_reload)

ZSH_THEME="awesomepanda"

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

export GOPATH="~/.go"
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR=$HOME"/.nvm"

# And the path
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
