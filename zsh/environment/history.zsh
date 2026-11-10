#
# History Settings
#
# HISTFILE / HISTSIZE / SAVEHIST and the history setopts are owned by Prezto's
# `history` module, which overwrites anything set here. Configure them with
# the ':prezto:module:history' zstyles in zpreztorc instead.
#

alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
