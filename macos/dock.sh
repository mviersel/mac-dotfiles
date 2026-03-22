#!/usr/bin/env bash
set -euo pipefail

echo "Configuring Dock..."

# Auto-hide Dock
defaults write com.apple.dock autohide -bool true

# No recent applications
defaults write com.apple.dock show-recents -bool false

# Small Dock size
defaults write com.apple.dock tilesize -int 32

# Align Dock to the right
defaults write com.apple.dock orientation -string right

# Empty the Dock
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array

# Add apps back in the order you want
defaults write com.apple.dock persistent-apps -array-add \
  '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>/System/Library/CoreServices/Finder.app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>'

defaults write com.apple.dock persistent-apps -array-add \
  '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>/System/Applications/System Settings.app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>'

defaults write com.apple.dock persistent-apps -array-add \
  '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>/System/Applications/Launchpad.app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>'

defaults write com.apple.dock persistent-apps -array-add \
  '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>/Applications/Zen.app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>'

defaults write com.apple.dock persistent-apps -array-add \
  '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>/Applications/Obsidian.app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>'

defaults write com.apple.dock persistent-apps -array-add \
  '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>/Applications/Microsoft Teams.app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>'

defaults write com.apple.dock persistent-apps -array-add \
  '<dict>
    <key>tile-data</key>
    <dict>
      <key>file-data</key>
      <dict>
        <key>_CFURLString</key>
        <string>/Applications/Microsoft Outlook.app</string>
        <key>_CFURLStringType</key>
        <integer>0</integer>
      </dict>
    </dict>
  </dict>'

# Restart Dock
killall Dock

echo "Dock configured."
