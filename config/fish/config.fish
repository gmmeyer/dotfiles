# Fish Shell Configuration
# Migrated from ZSH dotfiles

# =============================================================================
# Environment Variables
# =============================================================================

set -gx EDITOR 'emacsclient -t'
set -gx ALTERNATE_EDITOR ''
set -gx VISUAL 'emacsclient -t'
set -gx PAGER 'less'
set -gx LANG 'en_US.UTF-8'
set -gx TERM 'xterm-256color'

# Less options (migrated from ZSH)
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'

# Homebrew
set -gx HOMEBREW_NO_ANALYTICS 1

# =============================================================================
# Development Paths
# =============================================================================

set -gx GOPATH $HOME/go
set -gx VAPI_INSTALL $HOME/.vapi
set -gx BUN_INSTALL $HOME/.bun

# =============================================================================
# AWS Configuration
# =============================================================================

set -gx AWS_VAULT_KEYCHAIN_NAME 'login'
set -gx AWS_SESSION_TTL '24h'
set -gx AWS_ASSUME_ROLE_TTL '1h'

# =============================================================================
# GPG
# =============================================================================

set -gx GPG_TTY (tty)

# =============================================================================
# PATH Configuration
# =============================================================================

# User paths
fish_add_path $HOME/bin
fish_add_path $HOME/.bin
fish_add_path $HOME/.local/bin

# Version managers
fish_add_path $HOME/.rbenv/bin
fish_add_path $HOME/.rbenv/shims
fish_add_path $HOME/.pyenv/bin
fish_add_path $HOME/.pyenv/shims
fish_add_path $HOME/.nodenv/bin

# Language-specific
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.opam/system/bin
fish_add_path $GOPATH/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path $VAPI_INSTALL/bin

# Homebrew and system
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin
fish_add_path /usr/local/opt/coreutils/libexec/gnubin
fish_add_path /usr/local/opt/rbenv/bin
fish_add_path /usr/local/opt/rbenv/shims
fish_add_path /usr/local/opt/pyenv/bin
fish_add_path /usr/local/opt/pyenv/shims
fish_add_path /usr/local/heroku/bin
fish_add_path /usr/local/m-cli

# Linux-specific (if applicable)
fish_add_path $HOME/.linuxbrew/bin
fish_add_path $HOME/.linuxbrew/sbin

# =============================================================================
# Abbreviations (expand as you type - better than aliases)
# =============================================================================

# Editor
abbr -a e 'emacsclient -t'
abbr -a emacs 'emacsclient -t'

# Vim/Neovim
abbr -a vi nvim
abbr -a vim nvim

# Sublime Text
abbr -a st subl
abbr -a stt 'subl .'

# Tmux
abbr -a mux tmuxinator

# Package managers
abbr -a pnt 'pnpm turbo run --no-daemon'

# Node
abbr -a js node

# Rails/Ruby
abbr -a be 'bundle exec'

# Kubernetes
abbr -a k kubectl

# Git abbreviations
abbr -a gl 'git pull'
abbr -a gst 'git status'
abbr -a gco 'git checkout'
abbr -a gci 'git commit'
abbr -a gbr 'git branch'
abbr -a gd 'git diff'
abbr -a ga 'git add'
abbr -a gp 'git push'

# =============================================================================
# Version Managers
# =============================================================================

# rbenv
if test -d $HOME/.rbenv
    status --is-interactive; and rbenv init - fish | source
end

# pyenv
if test -d $HOME/.pyenv
    set -gx PYENV_ROOT $HOME/.pyenv
    set -gx PYENV_VIRTUALENVWRAPPER_PREFER_PYENV true
    status --is-interactive; and pyenv init - fish | source
end

# fnm (Node version manager)
if type -q fnm
    fnm env --shell fish | source
end

# =============================================================================
# Custom Functions
# =============================================================================

# Quick directory creation and cd
function mkcd --description 'Create directory and cd into it'
    mkdir -p $argv[1]
    and cd $argv[1]
end

# History statistics (migrated from ZSH)
function history-stat --description 'Show most used commands'
    set -l count 10
    if test (count $argv) -gt 0
        set count $argv[1]
    end
    history | awk '{print $1}' | sort | uniq -c | sort -rn | head -n $count
end

# Clear with full buffer clear
function clear-all --description 'Clear screen and scrollback'
    clear
    printf '\e[3J'
end

# =============================================================================
# Starship Prompt
# =============================================================================

if type -q starship
    starship init fish | source
end

# =============================================================================
# Zoxide (directory jumping - replacement for zsh-z)
# =============================================================================

if type -q zoxide
    zoxide init fish | source
end
