# Nushell configuration.
# Nushell ships sensible defaults; this only overrides what matters.
# Docs: config nu --doc | nu-highlight | less -R

$env.config.show_banner = false
$env.config.edit_mode = 'emacs'
$env.config.history.file_format = 'sqlite'
$env.config.history.max_size = 500_000
$env.config.completions.algorithm = 'fuzzy'
$env.config.completions.case_sensitive = false

$env.EDITOR = 'emacsclient -t'
$env.VISUAL = 'emacsclient -t'
$env.config.buffer_editor = 'emacsclient -t'

# PATH — mirrors zsh/environment/path.zsh. Later `path add` calls are
# prepended, so the highest-priority entries come last.
use std/util 'path add'
path add '/usr/local/bin'
path add '/opt/homebrew/opt/coreutils/libexec/gnubin'
path add '/opt/homebrew/opt/openjdk/bin'
path add '/opt/homebrew/sbin'
path add '/opt/homebrew/bin'
path add $'($env.HOME)/go/bin'
path add $'($env.HOME)/.vapi/bin'
path add $'($env.HOME)/.bun/bin'
path add $'($env.HOME)/.yarn/bin'
path add $'($env.HOME)/.claude/bin'
path add $'($env.HOME)/.rbenv/shims'
path add $'($env.HOME)/.local/bin'
path add $'($env.HOME)/.bin'
path add $'($env.HOME)/bin'

# Aliases — mirrors zsh/aliases.zsh
alias e = emacsclient -t
alias vi = vim
alias mux = tmuxinator
alias k = kubectl
alias be = bundle exec
alias gl = git pull

def pnt [...args] { pnpm turbo run --no-daemon ...$args }
