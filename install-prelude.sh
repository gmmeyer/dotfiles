#!/usr/bin/env bash
#
# Install Prelude (bbatsov/prelude) into ~/.emacs.d without clobbering the
# personal overlay that rcm links in from ~/dotfiles/emacs.d.
#
# rcup usually runs first and creates ~/.emacs.d holding only the overlay
# (personal/, themes/, prelude-modules.el, ...), which makes a plain
# `git clone` impossible. So we clone elsewhere, move the .git dir in, and
# check out only the tracked files that don't already exist. Files the
# overlay already provides are marked skip-worktree so the checkout stays
# clean and later `git pull`s leave them alone.
#
# Idempotent: does nothing if ~/.emacs.d is already a git checkout.
# Called by setup.sh and the `updatemisc prelude` zsh function.

set -euo pipefail

PRELUDE_URL="${PRELUDE_URL:-https://github.com/bbatsov/prelude.git}"
TARGET="${PRELUDE_DIR:-$HOME/.emacs.d}"

if [ -e "$TARGET/.git" ]; then
  echo "prelude: $TARGET is already a git checkout"
  exit 0
fi

if [ ! -e "$TARGET" ]; then
  echo "prelude: cloning into $TARGET"
  git clone -q "$PRELUDE_URL" "$TARGET"
  exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "prelude: installing into existing $TARGET (keeping overlay files)"
git clone -q --no-checkout "$PRELUDE_URL" "$tmp/prelude"
mv "$tmp/prelude/.git" "$TARGET/.git"

cd "$TARGET"
git reset -q   # populate the index from HEAD without touching the worktree

missing=()
while IFS= read -r -d '' f; do
  if [ -e "$f" ] || [ -L "$f" ]; then
    git update-index --skip-worktree -- "$f"
    echo "  keep (overlay): $f"
  else
    missing+=("$f")
  fi
done < <(git ls-files -z)

if [ "${#missing[@]}" -gt 0 ]; then
  git checkout -- "${missing[@]}"
fi

echo "prelude: installed $(git rev-parse --short HEAD) into $TARGET"
