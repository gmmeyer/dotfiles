if [ -z "${ZSH_TMUX_AUTOSTART}" ]; then
  export ZSH_TMUX_AUTOSTART=true
fi
if [ -z "${ZSH_TMUX_AUTOSTART_ONCE}" ]; then
  export ZSH_TMUX_AUTOSTART_ONCE=true
fi
if [ -z "${ZSH_TMUX_AUTOCONNECT}" ]; then
  export ZSH_TMUX_AUTOSTART=true
fi

# for oh my zsh, if I wanna go back
plugins=(bundler colored-man gem git
         nvm npm pyenv
         rake rails rbenv
         ruby tmux tmuxinator
         zsh_reload)

ZSH_THEME="awesomepanda"

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
