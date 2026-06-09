#
# Environment Variable Settings
#

ENV_SCRIPTS=($(find $HOME/.zsh/environment \( -type f -or -type l \) -name \*.zsh))
for f in $ENV_SCRIPTS; do
  source $f
done

export HOMEBREW_NO_ANALYTICS=1

# emacs, not vim, as default
export EDITOR='emacsclient -t'
export ALTERNATE_EDITOR=''
export VISUAL='emacsclient -t'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

export CASE_SENSITIVE="true"
