#
# Core environment shared by interactive and non-interactive shells.
# zshenv sources this directly (for scripts/subprocesses); interactive
# shells pick it up via the zsh/environment/*.zsh loop in environment.zsh.
#

export HOMEBREW_NO_ANALYTICS=1

# emacs, not vim, as the default editor. ALTERNATE_EDITOR='' makes
# emacsclient start a daemon automatically if none is running, so it
# never blocks waiting for one.
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export ALTERNATE_EDITOR=''
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
