# Makefile — maintenance tasks for this dotfiles repo.
# Run `make` (or `make help`) for the list.
# Not symlinked into $HOME — see EXCLUDES in tag-osx/rcrc.

DOTFILES_DIR := $(HOME)/dotfiles

# Scripts to lint. zsh files are excluded: shellcheck targets POSIX sh/bash
# and chokes on zsh-only syntax.
SHELL_SCRIPTS := setup.sh macos.sh hooks/post-up

.DEFAULT_GOAL := help
.PHONY: help check lint brew-check link install

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

check: lint brew-check ## Run all checks (lint + Brewfile)

lint: ## Lint bash/sh scripts with shellcheck
	shellcheck -x $(SHELL_SCRIPTS)

brew-check: ## Verify every Brewfile entry is installed
	brew bundle check --file=Brewfile --verbose

link: ## Symlink dotfiles via rcm (osx tag)
	RCRC="$(DOTFILES_DIR)/tag-osx/rcrc" rcup -v

install: ## Install Brewfile packages, then relink
	brew bundle install --file=Brewfile
	$(MAKE) link
