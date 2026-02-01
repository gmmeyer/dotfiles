# Nushell Environment Configuration
# Migrated from ZSH dotfiles

# =============================================================================
# Core Environment Variables
# =============================================================================

$env.EDITOR = 'emacsclient -t'
$env.ALTERNATE_EDITOR = ''
$env.VISUAL = 'emacsclient -t'
$env.PAGER = 'less'
$env.LANG = 'en_US.UTF-8'
$env.TERM = 'xterm-256color'

# Less options (migrated from ZSH)
$env.LESS = '-F -g -i -M -R -S -w -X -z-4'

# Homebrew
$env.HOMEBREW_NO_ANALYTICS = '1'

# =============================================================================
# Development Paths
# =============================================================================

$env.GOPATH = $"($env.HOME)/go"
$env.VAPI_INSTALL = $"($env.HOME)/.vapi"
$env.BUN_INSTALL = $"($env.HOME)/.bun"

# =============================================================================
# AWS Configuration
# =============================================================================

$env.AWS_VAULT_KEYCHAIN_NAME = 'login'
$env.AWS_SESSION_TTL = '24h'
$env.AWS_ASSUME_ROLE_TTL = '1h'

# =============================================================================
# GPG
# =============================================================================

$env.GPG_TTY = (tty)

# =============================================================================
# PATH Configuration
# =============================================================================

# Start with system paths
$env.PATH = ($env.PATH | split row (char esep))

# Paths to add (in reverse priority order - last added = highest priority)
let paths_to_add = [
    $"($env.GOPATH)/bin"
    $"($env.BUN_INSTALL)/bin"
    $"($env.VAPI_INSTALL)/bin"
    "/opt/homebrew/opt/openjdk/bin"
    "/usr/local/opt/coreutils/libexec/gnubin"
    $"($env.HOME)/.linuxbrew/sbin"
    $"($env.HOME)/.linuxbrew/bin"
    "/usr/local/sbin"
    "/usr/local/bin"
    $"($env.HOME)/.cargo/bin"
    $"($env.HOME)/.opam/system/bin"
    $"($env.HOME)/.cabal/bin"
    "/usr/local/m-cli"
    "/usr/local/opt/pyenv/bin"
    "/usr/local/heroku/bin"
    "/usr/local/opt/rbenv/bin"
    "/usr/local/opt/rbenv/shims"
    "/usr/local/opt/pyenv/shims"
    $"($env.HOME)/.nodenv/bin"
    $"($env.HOME)/.pyenv/bin"
    $"($env.HOME)/.rbenv/bin"
    $"($env.HOME)/.rbenv/shims"
    $"($env.HOME)/.pyenv/shims"
    $"($env.HOME)/.local/bin"
    $"($env.HOME)/.bin"
    $"($env.HOME)/bin"
]

for p in $paths_to_add {
    if ($p | path exists) {
        $env.PATH = ($env.PATH | prepend $p)
    }
}

# =============================================================================
# Version Managers
# =============================================================================

# pyenv
if ($"($env.HOME)/.pyenv" | path exists) {
    $env.PYENV_ROOT = $"($env.HOME)/.pyenv"
    $env.PYENV_VIRTUALENVWRAPPER_PREFER_PYENV = 'true'
}

# fnm (Node version manager)
if ("/opt/homebrew/bin/fnm" | path exists) {
    ^fnm env --json | from json | load-env
}

# =============================================================================
# Starship Prompt
# =============================================================================

mkdir ~/.cache/starship
^starship init nu | save -f ~/.cache/starship/init.nu
