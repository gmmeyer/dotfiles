HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt bang_hist
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
setopt hist_beep
setopt inc_append_history
setopt share_history

alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
