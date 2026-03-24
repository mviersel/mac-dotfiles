#!/usr/bin/env bash
set -euo pipefail

echo "Configuring input..."

defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true

echo "Input configured ✅"
