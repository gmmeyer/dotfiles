#
# Scripts
#

# All of these scripts insist on being last
# So, here they are.


function load_scripts() {
  if [ -f /etc/zsh_command_not_found ]; then
      source /etc/zsh_command_not_found
  fi

  if [ -f $HOME/.fzf.zsh ]; then
    source $HOME/.fzf.zsh
  fi

  if command -v direnv > /dev/null 2>&1; then
      eval "$(direnv hook zsh)"
  fi
}

if [ -f $HOME/.zsh/private.zsh ]; then
    source $HOME/.zsh/private.zsh
fi

if [ -f $HOME/.zsh/git.zsh ]; then
    # git aliases and colors
    source $HOME/.zsh/git.zsh
fi

load_scripts
