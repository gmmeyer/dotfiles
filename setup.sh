#!/usr/bin/env bash
#
# Bootstrap a new machine from this dotfiles repo.
# Safe to re-run; every step is idempotent.

set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
PRIVATE_DOTFILES_DIR="$HOME/private-dotfiles"

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

# --- Homebrew -----------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

info "Installing packages from Brewfile"
# Homebrew 6 skips third-party tap formulae unless the tap is trusted.
grep -E '^tap "' "$DOTFILES_DIR/Brewfile" | sed -E 's/tap "([^"]+)".*/\1/' | while read -r tap; do
  brew trust "$tap" >/dev/null
done
brew bundle install --file="$DOTFILES_DIR/Brewfile" --no-upgrade

# --- OpenCode (standalone, not Homebrew) ---------------------------------
# Lives in ~/.opencode/bin and self-updates (`opencode upgrade`, run by
# `updatemisc ai`). --no-modify-path stops the installer appending a PATH
# line to the rcm-linked zshrc; zsh/environment/path.zsh already lists it.
if [ ! -x "$HOME/.opencode/bin/opencode" ]; then
  info "Installing OpenCode"
  curl -fsSL https://opencode.ai/v2/install | bash -s -- --no-modify-path
fi

# --- Git submodules (prezto, tpm, vundle, zsh-z) ------------------------
info "Initializing git submodules"
git -C "$DOTFILES_DIR" submodule update --init --recursive

# --- Private dotfiles ----------------------------------------------------
if [ ! -d "$PRIVATE_DOTFILES_DIR" ]; then
  info "NOTE: $PRIVATE_DOTFILES_DIR not found."
  info "Clone it before running rcup so private configs get linked too."
fi

# --- Symlinks via rcm ----------------------------------------------------
info "Linking dotfiles with rcup"
RCRC="$DOTFILES_DIR/tag-osx/rcrc" rcup -v

# --- Emacs Prelude -------------------------------------------------------
# After rcup, so the emacs.d overlay already exists and is preserved.
info "Installing Emacs Prelude"
"$DOTFILES_DIR/install-prelude.sh"

info "Done. Open a new shell or run: exec zsh"
