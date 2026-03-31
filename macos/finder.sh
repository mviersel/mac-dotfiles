#!/usr/bin/env bash
set -euo pipefail

echo "Configuring Finder..."

# New Finder windows open in Documents
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Documents/"

# Default view: Columns
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Always show folder on top when solted by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Useful extras
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
# defaults write com.apple.finder _FXSortFoldersFirst -bool true
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Optional but usually nice for dotfiles/dev work
# defaults write com.apple.finder AppleShowAllFiles -bool true

# Restart Finder to apply changes
killall Finder || true

echo "Finder configured."
