# Source antigen
source ~/.zsh/antigen.zsh
source ~/.zsh/aliases.zsh


# full color terminal
export TERM=xterm-256color

autoload -U bashcompinit && bashcompinit

setopt HIST_IGNORE_DUPS

export ALTERNATE_EDITOR=''

# emacs, not vim, as default
export EDITOR='emacsclient -t'

CASE_SENSITIVE="true"

# tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=true

export PYENV_VIRTUALENVWRAPPER_PREFER_PYENV='true'

antigen use oh-my-zsh

antigen theme robbyrussell/oh-my-zsh themes/awesomepanda

antigen bundles <<EOBUNDLES

  bundler
  colored-man
  #command-not-found
  gem
  git
  git-prompt
  heroku
  lein
  nvm
  npm
  pip
  pyenv
  rake
  rbenv
  ruby
  tmux
  tmuxinator
  z
  zsh_reload

EOBUNDLES

antigen bundle robbyrussell/oh-my-zsh plugins/rails

# autoloads keychain for ssh
eval `keychain --eval --agents ssh -Q --quiet id_rsa`

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
      /usr/bin
      $path)

export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export PKG_CONFIG_PATH='/usr/lib/x86_64-linux-gnu/pkgconfig'
export PKG_CONFIG_LIBDIR='/usr/lib/pkgconfig'


if [ -f ~/.zsh/bash_completion/exercism_completion.bash ]; then
  . ~/.zsh/bash_completion/exercism_completion.bash
fi

export NVM_DIR=$HOME"/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

function gi() { curl -s https://www.gitignore.io/api/$@ ;}
