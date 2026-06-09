# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository managed with [rcm](https://github.com/thoughtbot/rcm) (dotfile management). Uses Zsh with Prezto framework as the primary shell configuration. Secrets and machine/work-specific config live in the sibling `~/private-dotfiles` repo, which rcm also links (see `DOTFILES_DIRS` in `tag-osx/rcrc`).

## Setup

New machine: run `./setup.sh` (installs Homebrew + Brewfile packages, inits submodules, runs `rcup`). `Brewfile` is the package manifest; regenerate with `brew bundle dump --file=Brewfile --force`.

## Dotfile Management

This repo uses `rcm` for symlink management:
- `rcup` - Install/update dotfile symlinks
- `rcdn` - Remove dotfile symlinks
- `lsrc` - List managed dotfiles

Platform-specific configs live in `tag-osx/` and `tag-linux/` directories. The `rcrc` file defines which tags to use and what to exclude. Note: `EXCLUDES` filters `*.md` globally, so markdown files that must be linked (e.g. `private-dotfiles/claude/CLAUDE.md`) are handled by `private-dotfiles/hooks/post-up`.

`config/` maps to `~/.config/` (zed, btop, gh).

## Shell Architecture

**Load order** (zshrc):
1. `zsh/environment.zsh` - Sources `zsh/environment/*.zsh` (path, history, tools, misc) and core env vars
2. `zsh/osx.zsh` - macOS-specific config (Darwin only)
3. `zsh/functions.zsh` - Autoloaded functions from `zsh/functions/`
4. Lazy-loaded rbenv (wrapper functions defer init until first use)
5. Prezto init (`zprezto/init.zsh`) - owns compinit; do NOT call compinit elsewhere
6. `zsh/overrides.zsh` - Post-Prezto overrides
7. `zsh/load_scripts.zsh` - private.zsh, git.zsh, direnv/fzf hooks
8. `zsh/aliases.zsh` - Shell aliases
9. fnm, bun completions, docker, iterm2 integrations

`zshenv` is intentionally minimal: PATH + core env for non-interactive shells only. Don't force `TERM` anywhere (terminal sets it). Keep interactive startup fast (~0.6s); check with `time zsh -i -c exit`.

**Prezto modules** (zpreztorc): environment, helper, ssh, spectrum, utility, editor, history, history-substring-search, completion, ruby, node, syntax-highlighting, prompt, git-fixes, zsh-z

## Key Configurations

**Git** (gitconfig):
- Editor: `emacsclient -t`
- Aliases: `co`, `ci`, `st`, `br`, `lg`, `cleanup`, `cleanup-all`
- Default branch: `main`
- Identity is split: email comes from `~/.gitconfig-local` (private-dotfiles); repos under `~/zingage/` and `~/work/` get the work email via includeIf → `~/.gitconfig-work`

**Tmux** (tmux.conf):
- Prefix: `C-a` (not `C-b`)
- Base index: 1
- Mouse: on (toggle with `m`/`M`)
- Uses TPM plugin manager

**Editors**:
- Primary: Emacs (via emacsclient, Prelude-based config in `emacs.d/`)
- Secondary: Vim (spf13-based config, Vundle for plugins)

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
