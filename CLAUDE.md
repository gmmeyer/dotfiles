# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository managed with [rcm](https://github.com/thoughtbot/rcm) (dotfile management). Uses Zsh with Prezto framework as the primary shell configuration. Secrets and machine/work-specific config live in the sibling `~/private-dotfiles` repo, which rcm also links (see `DOTFILES_DIRS` in `tag-osx/rcrc`).

## Setup

New machine: run `./setup.sh` (installs Homebrew + Brewfile packages, inits submodules, runs `rcup`). `Brewfile` is a **hand-curated** package manifest — it deliberately omits transitive dependencies, so do NOT regenerate it with `brew bundle dump --force` (that re-adds every dep and one-off). Add lines by hand; use `brew leaves --installed-on-request` to find new top-level installs. `macos.sh` applies system `defaults` (keyboard/Finder/Dock/screenshots) — run by hand, not by rcup. `setup.sh`, `macos.sh`, and `Makefile` are in `EXCLUDES` so rcm doesn't symlink them into `$HOME`.

Common tasks are in the `Makefile`: `make check` (lint + `brew bundle check`), `make lint` (shellcheck on bash/sh scripts + `zsh -n` parse check on every zsh file), `make brew-check`, `make install` (brew bundle install + relink), `make link` (rcup). `.github/workflows/lint.yml` runs `make lint` in CI.

## Dotfile Management

This repo uses `rcm` for symlink management:
- `rcup` - Install/update dotfile symlinks
- `rcdn` - Remove dotfile symlinks
- `lsrc` - List managed dotfiles

Platform-specific configs live in `tag-osx/` and `tag-linux/` directories (bash configs are Linux-only and live in `tag-linux/`; macOS is zsh-only). The `rcrc` file defines which tags to use and what to exclude. Note: `EXCLUDES` filters `*.md` globally, so markdown files that must be linked (e.g. `private-dotfiles/claude/CLAUDE.md`) are handled by `private-dotfiles/hooks/post-up`.

`config/` maps to `~/.config/` (zed, btop, gh, nvim, nushell, ghostty, Code). Apps that read config from `~/Library/Application Support` are bridged to the rcm-managed `~/.config` copies by `hooks/post-up`: nushell (whole-dir link) and VS Code (`Code/User/{settings,keybindings}.json`, per-file since that dir also holds untracked machine state). Ghostty reads `~/.config/ghostty/config` natively, no bridge needed. opencode config lives in private-dotfiles (`config/opencode/`).

## Shell Architecture

**Load order** (zshrc):
1. `zsh/environment.zsh` - Sources `zsh/environment/*.zsh` (path, history, tools, misc) and core env vars
2. `zsh/osx.zsh` - macOS-specific config (Darwin only)
3. `zsh/functions.zsh` - Autoloaded functions from `zsh/functions/`
4. Lazy-loaded rbenv (wrapper functions defer init until first use)
5. Prezto init (`zprezto/init.zsh`) - owns compinit; do NOT call compinit elsewhere
6. `zsh/overrides.zsh` - Post-Prezto overrides
7. `zsh/load_scripts.zsh` - private.zsh, fzf (`fzf --zsh`) and direnv hooks
8. `zsh/aliases.zsh` - Shell aliases
9. fnm, bun completions, docker, iterm2 integrations

`zshenv` is intentionally minimal: PATH + core env for non-interactive shells only. `path.zsh` filters its candidate list with `(N-/)`, so listing a dir that may not exist is fine. Don't force `TERM` anywhere (terminal sets it). Keep interactive startup fast (~0.5s); check with `time zsh -i -c exit`.

**Prezto modules** (zpreztorc): environment, helper, ssh, spectrum, utility, editor, history, history-substring-search, git-fixes, completion, ruby, node, syntax-highlighting, prompt, zsh-z. `git-fixes` (in `zprezto-contrib/`) is the git module and supplies all the `g*` aliases; the few personal overrides (`gl`=pull, `gll`, `glS`, `gwC`) are in `zsh/aliases.zsh`.

## Key Configurations

**Git** (gitconfig):
- Editor: `emacsclient -t`
- Aliases: `co`, `ci`, `st`, `br`, `lg`, `cleanup`, `cleanup-all`
- Default branch: `main`
- Identity is split: email comes from `~/.gitconfig-local` (private-dotfiles); repos under `~/zingage/` and `~/work/` get the work email via includeIf → `~/.gitconfig-work`. Signing keys, if any, belong in those private files too

**Tmux** (tmux.conf):
- Prefix: `C-a` (not `C-b`)
- Base index: 1
- Mouse: on (toggle with `m`/`M`)
- Uses TPM plugin manager (tmux-sensible, tmux-yank); `prefix + I` installs plugins

**Editors**:
- Primary: Emacs (via emacsclient, Prelude-based config in `emacs.d/`)
- Neovim: modern lua config in `config/nvim/` (lazy.nvim, telescope, treesitter, native LSP — servers enable only if their binary is on PATH)
- Legacy Vim: spf13-based config, Vundle for plugins (`vi` is aliased to nvim)

## Key Aliases

```
e / emacs     -> emacsclient -t
mux           -> tmuxinator
be            -> bundle exec
pnt           -> pnpm turbo run --no-daemon
k             -> kubectl
reload        -> source ~/.zshrc
```

## Git Submodules

- `zprezto` - Prezto Zsh framework
- `zprezto-contrib/zsh-z` - Directory jumping
- `tmux/plugins/tpm` - Tmux Plugin Manager
- `vim/bundle/vundle` - Vim plugin manager

After cloning, run: `git submodule update --init --recursive`
