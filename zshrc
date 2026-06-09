# Environment variables and PATH (sources zsh/environment/*.zsh)
source $HOME/.zsh/environment.zsh

if [[ `uname` == 'Darwin' ]]; then
    source $HOME/.zsh/osx.zsh
fi

source $HOME/.zsh/functions.zsh

# Lazy-load rbenv - only initializes when ruby/rbenv/gem/bundle is first used
if command -v rbenv >/dev/null 2>&1; then
  _rbenv_init() {
    unfunction ruby gem bundle rbenv 2>/dev/null
    eval "$(command rbenv init -)"
  }
  ruby()   { _rbenv_init; command ruby "$@" }
  gem()    { _rbenv_init; command gem "$@" }
  bundle() { _rbenv_init; command bundle "$@" }
  rbenv()  { _rbenv_init; command rbenv "$@" }
fi

# gitignore!
function gi() { curl -s https://www.toptal.com/developers/gitignore/api/$@ ;}

if [[ -f "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.zsh/overrides.zsh

# all of these insist on being last, so they are.
source $HOME/.zsh/load_scripts.zsh

source $HOME/.zsh/aliases.zsh

# fnm (node version manager)
[[ -s "/opt/homebrew/bin/fnm" ]] && eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines --shell zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

[ -f $HOME/.docker/init-zsh.sh ] && source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
