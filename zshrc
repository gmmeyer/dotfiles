# Enable Powerlevel10k instant prompt (must be at the very top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit-based zshrc configuration

# Load zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
    print -P "%F{33}Installing zinit...%f"
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k prompt
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Load modular configs first
source $HOME/.zsh/environment.zsh

if [[ `uname` == 'Darwin' ]]; then
    source $HOME/.zsh/osx.zsh
fi

source $HOME/.zsh/functions.zsh

# Lazy-load rbenv - only initializes when ruby/rbenv/gem/bundle is first used
if command -v rbenv >/dev/null 2>&1; then
  export PATH="$HOME/.rbenv/shims:$PATH"

  _rbenv_init() {
    unfunction ruby gem bundle rbenv 2>/dev/null
    eval "$(command rbenv init -)"
  }
  ruby()   { _rbenv_init; command ruby "$@" }
  gem()    { _rbenv_init; command gem "$@" }
  bundle() { _rbenv_init; command bundle "$@" }
  rbenv()  { _rbenv_init; command rbenv "$@" }
fi

# Lazy-load pyenv - only initializes when python/pyenv/pip is first used
if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/shims:$PATH"

  _pyenv_init() {
    unfunction python python3 pip pip3 pyenv 2>/dev/null
    eval "$(command pyenv init -)"
    eval "$(command pyenv virtualenv-init -)"
  }
  python()  { _pyenv_init; command python "$@" }
  python3() { _pyenv_init; command python3 "$@" }
  pip()     { _pyenv_init; command pip "$@" }
  pip3()    { _pyenv_init; command pip3 "$@" }
  pyenv()   { _pyenv_init; command pyenv "$@" }
fi

# Lazy-load fnm - only initializes when node/npm/npx/fnm is first used
if [[ -s "/opt/homebrew/bin/fnm" ]]; then
  _fnm_init() {
    unfunction node npm npx fnm 2>/dev/null
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines --shell zsh)"
  }
  node() { _fnm_init; command node "$@" }
  npm()  { _fnm_init; command npm "$@" }
  npx()  { _fnm_init; command npx "$@" }
  fnm()  { _fnm_init; command fnm "$@" }
fi

# gitignore helper
function gi() { curl -s https://www.toptal.com/developers/gitignore/api/$@ ;}

# zinit plugins (replacing Prezto modules)
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

# Lazy-load completions for speed
zinit ice wait lucid
zinit light zsh-users/zsh-completions

# zsh-z for directory jumping (replaces fasd)
zinit light agkozak/zsh-z

# Key bindings for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Load overrides and additional scripts
source $HOME/.zsh/overrides.zsh
source $HOME/.zsh/load_scripts.zsh
source $HOME/.zsh/aliases.zsh

# AWS vault settings
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f $HOME/.docker/init-zsh.sh ] && source $HOME/.docker/init-zsh.sh || true

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [[ -s "$HOME/.gvm/scripts/gvm" ]]; then
  unalias cd 2>/dev/null
  source "$HOME/.gvm/scripts/gvm"
fi

# vapi
export MANPATH="$HOME/.vapi/share/man:$MANPATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Added by Claude's Party
export PATH="$HOME/.claude/bin:$PATH"

# Load Powerlevel10k config (run `p10k configure` to customize)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Finalize Powerlevel10k instant prompt
(( ! ${+functions[p10k]} )) || p10k finalize

# To customize prompt, run `p10k configure` or edit ~/dotfiles/p10k.zsh.
[[ ! -f ~/dotfiles/p10k.zsh ]] || source ~/dotfiles/p10k.zsh
