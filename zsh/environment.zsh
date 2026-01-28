#
# Environment Variable Settings
#

ENV_SCRIPTS=($(find $HOME/.zsh/environment \( -type f -or -type l \) -name \*.zsh))
for f in $ENV_SCRIPTS; do
  source $f
done

export TERM=xterm-256color
if [[ "$TERM" == 'rxvt' || "$TERM" == 'rxvt-256color' ]]; then
  export TERM=rxvt-256color
fi

export HOMEBREW_NO_ANALYTICS=1

autoload -Uz bashcompinit && bashcompinit

# Cached compinit - only regenerate once per day
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi


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

fpath=($HOME/.zsh/completion $fpath)

export GPG_TTY=$(tty)
