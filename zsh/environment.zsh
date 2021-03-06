#
# Environment Variable Settings
#

# for env_file in $(ls $HOME/.zsh/environment); do
#     source $env_file
# done

ENV_SCRIPTS=($(find $HOME/.zsh/environment \( -type f -or -type l \) -name \*.zsh))
for f in $ENV_SCRIPTS; do
  source $f
done

# full color terminal
# we don't want this on some terminals!
export TERM=xterm-256color
# export TERM=rxvt-256color
if [[ "$TERM" == 'rxvt' || "$TERM" == 'rxvt-256color' ]]; then
  export TERM=rxvt-256color
else
  export TERM=$TERM
fi

HOMEBREW_NO_ANALYTICS=1

autoload -Uz bashcompinit && bashcompinit
autoload -Uz compinit && compinit
# autoload -Uz /usr/local/share/zsh/functions/compinit && compinit
# autoload -Uz /usr/local/share/zsh/functions/bashcompinit && bashcompinit


# emacs, not vim, as default
export EDITOR='emacsclient -t'
export ALTERNATE_EDITOR=''
export VISUAL='emacsclient -t'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

export CASE_SENSITIVE="true"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYENV='true'

# export NVM_DIR=$HOME"/.nvm"

fpath=($HOME/.zsh/completion $fpath)
