#!/usr/bin/env bash
set -euo pipefail

echo "Configuring input..."

defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults write com.apple.BezelServices kDimTime -int 1

defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

echo "Input configured ✅"
