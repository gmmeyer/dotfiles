#
# Scripts
#

# All of these scripts insist on being last
# So, here they are.

# tmuxinator
# source $HOME/.zsh/tmuxinator.zsh

# tmux
if [ -f $HOME/.zsh/tmux.zsh ]; then
  source $HOME/.zsh/tmux.zsh
fi

if [ -f $HOME/.opam/opam-init/init.zsh ]; then
    source /home/greg/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi

if [ -f $HOME/.zsh/bash_completion/exercism_completion.bash ]; then
    source $HOME/.zsh/bash_completion/exercism_completion.bash
fi

if [ -f $HOME/.zsh/private.zsh ]; then
    source $HOME/.zsh/private.zsh
fi

# if [ -f $HOME/.zsh/git/git.plugin.zsh ]; then
#     source $HOME/.zsh/git/git.plugin.zsh
# fi

if [ -f "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh" # This loads nvm
fi

if [ -f /etc/zsh_command_not_found ]; then
    source /etc/zsh_command_not_found
fi

# GVM
if [ -f "$HOME/.gvm/scripts/gvm" ]; then
    source "$HOME/.gvm/scripts/gvm"
fi

# if [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
#     source $HOME/.nix-profile/etc/profile.d/nix.sh
# fi

if command -v npm > /dev/null 2>&1; then
    . <(npm completion)
fi

source $HOME/.zsh/functions.zsh

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
