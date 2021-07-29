#
# Scripts
#

# All of these scripts insist on being last
# So, here they are.


function load_scripts() {
  # tmuxinator
  # source $HOME/.zsh/tmuxinator.zsh

  # tmux
  # if [ -f $HOME/.zsh/tmux.zsh ]; then
  #     source $HOME/.zsh/tmux.zsh
  # fi

  # SCRIPTS=$(find  $HOME/.zsh/scripts  \( -type f -or -type l \) -name \*.zsh)
  # for f in $SCRIPTS; do
  #   source $f
  # done

#   source $HOME/.zsh/scripts/tmuxinator.zsh

  # if [ -f $HOME/.opam/opam-init/init.zsh ]; then
  #     source $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
  # fi

  export NVM_DIR="$HOME/.nvm"
  if [ -f "$NVM_DIR/nvm.sh" ]; then
      source "$NVM_DIR/nvm.sh" # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi

  if [ -f /etc/zsh_command_not_found ]; then
      source /etc/zsh_command_not_found
  fi

  if [ -f /usr/local/etc/profile.d/z.sh ]; then
      source /usr/local/etc/profile.d/z.sh
  fi

  # GVM
  # if [ -f "$HOME/.gvm/scripts/gvm" ]; then
  #     source "$HOME/.gvm/scripts/gvm"
  # fi

  if command -v gimme > /dev/null 2>&1; then
      eval $(gimme 1.15.6) > /dev/null 2>&1
  fi

  # if [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  #     source $HOME/.nix-profile/etc/profile.d/nix.sh
  # fi

  # if I have the travis gem installed, use it!
  # [ -f /Users/gregmeyer/.travis/travis.sh ] && source /Users/gregmeyer/.travis/travis.sh

  if command -v npm > /dev/null 2>&1; then
      . <(npm completion)
  fi

  if [ -f $HOME/.fzf.zsh ]; then
    source $HOME/.fzf.zsh
  fi

  if command -v direnv > /dev/null 2>&1; then
      eval "$(direnv hook zsh)"
  fi

  if type nodenv >/dev/null 2>&1; then
      eval "$(nodenv init -)"
  fi

}

if [ -f $HOME/.zsh/private.zsh ]; then
    source $HOME/.zsh/private.zsh
fi

# load scripts async
load_scripts
