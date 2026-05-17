# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository managed with [rcm](https://github.com/thoughtbot/rcm) (dotfile management). Uses Zsh with Prezto framework as the primary shell configuration.

## Dotfile Management

This repo uses `rcm` for symlink management:
- `rcup` - Install/update dotfile symlinks
- `rcdn` - Remove dotfile symlinks
- `lsrc` - List managed dotfiles

Platform-specific configs live in `tag-osx/` and `tag-linux/` directories. The `rcrc` file defines which tags to use and what to exclude.

## Shell Architecture

**Load order** (zshrc):
1. `zsh/environment.zsh` - Environment variables and PATH
2. `zsh/osx.zsh` - macOS-specific config (Darwin only)
3. `zsh/functions.zsh` - Autoloaded functions from `zsh/functions/`
4. Lazy-loaded rbenv and pyenv (wrapper functions defer init until first use)
5. Prezto init (`zprezto/init.zsh`)
6. `zsh/overrides.zsh` - Post-Prezto overrides
7. `zsh/load_scripts.zsh` - Additional script loading
8. `zsh/aliases.zsh` - Shell aliases

**Prezto modules** (zpreztorc): environment, helper, ssh, spectrum, utility, editor, history, history-substring-search, completion, ruby, node, syntax-highlighting, prompt, fasd, git-fixes, zsh-z

## Key Configurations

**Git** (gitconfig):
- Editor: `emacsclient -t`
- Aliases: `co`, `ci`, `st`, `br`, `lg`, `cleanup`, `cleanup-all`
- Default branch: `main`

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
