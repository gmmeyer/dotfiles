#
# Scripts
#

# All of these scripts insist on being last
# So, here they are.

# tmuxinator
# source ~/.zsh/tmuxinator.zsh

# tmux
source ~/.zsh/tmux.zsh

if [ -f ~/.opam/opam-init/init.zsh ]; then
    source /home/greg/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
fi

if [ -f ~/.zsh/bash_completion/exercism_completion.bash ]; then
    source ~/.zsh/bash_completion/exercism_completion.bash
fi

if [ -f ~/.zsh/private.zsh ]; then
    source ~/.zsh/private.zsh
fi

# if [ -f ~/.zsh/git/git.plugin.zsh ]; then
#     source ~/.zsh/git/git.plugin.zsh
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

if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
    source ~/.nix-profile/etc/profile.d/nix.sh
fi

if command -v npm > /dev/null 2>&1; then
    . <(npm completion)
fi
