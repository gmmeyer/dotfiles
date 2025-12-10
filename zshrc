
# export "SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh"
# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you dont have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f $HOME/.docker/init-zsh.sh ] && source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[[ -s "/Users/gregmeyer/.gvm/scripts/gvm" ]] && unalias cd && source "/Users/gregmeyer/.gvm/scripts/gvm"

[[ -s "/opt/homebrew/bin/fnm" ]] && eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines --shell zsh)"

# vapi
export MANPATH=""$HOME/.vapi"/share/man:$MANPATH"

# bun completions
[ -s "/Users/gregmeyer/.bun/_bun" ] && source "/Users/gregmeyer/.bun/_bun"


# Added by Antigravity
export PATH="/Users/gregmeyer/.antigravity/antigravity/bin:$PATH"
