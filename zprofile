# /etc/zprofile runs path_helper before this file, which shoves the system
# dirs ahead of everything zshenv set up. Re-apply our ordering so
# non-interactive login shells (`zsh -lc`, GUI apps, agents) resolve Homebrew
# and ~/.local/bin tools the same way interactive shells do.
source $HOME/.zsh/environment/path.zsh

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
