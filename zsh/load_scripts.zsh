#
# Scripts
#

# All of these scripts insist on being last
# So, here they are.


function load_scripts() {
  if [ -f /etc/zsh_command_not_found ]; then
      source /etc/zsh_command_not_found
  fi

  # fzf keybindings + completion (brew's fzf has no ~/.fzf.zsh; use --zsh)
  if (( $+commands[fzf] )); then
    source <(fzf --zsh)
  fi

  if (( $+commands[direnv] )); then
      eval "$(direnv hook zsh)"
  fi
}

if [ -f $HOME/.zsh/private.zsh ]; then
    source $HOME/.zsh/private.zsh
fi

load_scripts
