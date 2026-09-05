#!/usr/bin/env bash
set -euo pipefail

add_dock_app() {
    local app_path="$1"

    defaults write com.apple.dock persistent-apps -array-add \
        "<dict>
      <key>tile-data</key>
      <dict>
        <key>file-data</key>
        <dict>
          <key>_CFURLString</key>
          <string>${app_path}</string>
          <key>_CFURLStringType</key>
          <integer>0</integer>
        </dict>
      </dict>
    </dict>"
}

echo "Configuring Dock..."

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock orientation -string right

defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

defaults write com.apple.dock workspaces-auto-swoosh -bool NO

add_dock_app "/System/Applications/Apps.app"

# Alleen toevoegen als Launchpad nog bestaat op deze macOS-versie
if [[ -d "/System/Applications/Launchpad.app" ]]; then
    add_dock_app "/System/Applications/Launchpad.app"
fi

add_dock_app "/Applications/Zen.app"
add_dock_app "/Applications/Obsidian.app"
add_dock_app "/Applications/Microsoft Teams.app"
add_dock_app "/Applications/Microsoft Outlook.app"

killall Dock || true
echo "Dock configured."
