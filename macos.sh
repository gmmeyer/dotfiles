#!/usr/bin/env bash
#
# macOS system defaults. NOT run by rcup — run it by hand on a new machine
# (or after a clean install) and review before each run; tastes change.
#
#   ./macos.sh
#
# Settings are conservative and widely agreed-upon. Some require a logout
# or restart to fully apply. Affected apps are restarted at the end.

set -euo pipefail

echo "Configuring macOS defaults… (close System Settings first)"

# Ask for sudo up front and keep it alive for the run.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

############################################################
# Keyboard & input
############################################################

# Fast key repeat (lower = faster). KeyRepeat=2, InitialKeyRepeat=15 are snappy.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for accent menu, so holding a key repeats it (good for vim/emacs).
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable automatic text "corrections" that fight code and terminals.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

############################################################
# Finder
############################################################

# Show all filename extensions and hidden files.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar and status bar.
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top when sorting by name.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Search the current folder by default (not the whole Mac).
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Default to list view ("Nlsv"); others: icon "icnv", column "clmv", gallery "glyv".
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Don't write .DS_Store on network or USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# No warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

############################################################
# Screenshots
############################################################

mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

############################################################
# Dock
############################################################

# Auto-hide with no show-delay and a fast animation.
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Don't rearrange Spaces based on most recent use (keeps tmux/window muscle memory).
defaults write com.apple.dock mru-spaces -bool false

############################################################
# Misc
############################################################

# Expand save and print panels by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not iCloud) by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Trackpad: tap to click.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Restarting affected apps…"
for app in Finder Dock SystemUIServer; do
  killall "${app}" >/dev/null 2>&1 || true
done

echo "Done. Some changes require a logout/restart to take full effect."
