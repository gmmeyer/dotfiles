# Makefile — maintenance tasks for this dotfiles repo.
# Run `make` (or `make help`) for the list.
# Not symlinked into $HOME — see EXCLUDES in tag-osx/rcrc.

DOTFILES_DIR := $(HOME)/dotfiles

# Scripts for shellcheck (POSIX sh/bash only; it chokes on zsh syntax).
SHELL_SCRIPTS := setup.sh macos.sh hooks/post-up
# zsh files get a `zsh -n` parse check instead.
ZSH_FILES := zshrc zshenv zprofile zlogin zpreztorc \
             $(wildcard zsh/*.zsh zsh/environment/*.zsh zsh/functions/* tag-linux/zsh/functions/*)

.DEFAULT_GOAL := help
.PHONY: help check lint shellcheck zsh-check brew-check link install

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

check: lint brew-check ## Run all checks (lint + Brewfile)

lint: shellcheck zsh-check ## Lint shell scripts (shellcheck + zsh -n)

shellcheck: ## Lint bash/sh scripts with shellcheck
	shellcheck -x $(SHELL_SCRIPTS)

zsh-check: ## Parse-check every zsh file with `zsh -n`
	@for f in $(ZSH_FILES); do zsh -n "$$f" || exit 1; done
	@echo "zsh -n: $(words $(ZSH_FILES)) files OK"

brew-check: ## Verify every Brewfile entry is installed
	brew bundle check --file=Brewfile --verbose

link: ## Symlink dotfiles via rcm (osx tag)
	RCRC="$(DOTFILES_DIR)/tag-osx/rcrc" rcup -v

install: ## Install Brewfile packages, then relink
	brew bundle install --file=Brewfile
	$(MAKE) link
