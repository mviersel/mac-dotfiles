defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

WALLPAPER="$HOME/.config/backgrounds/greenComputer.jpeg"

osascript -e "tell application \"System Events\" to set picture of every desktop to \"$WALLPAPER\""

# auto hide menubar so the sketchybar has space
defaults write .GlobalPreferences AppleMenuBarVisibleInFullscreen -bool false
defaults write .GlobalPreferences _HIHideMenuBar -bool true
# turn off mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1
# Turn keyboard backlight off after 30 seconds of inactivity
defaults write com.apple.BezelServices kDimTime -int 30

defaults write com.apple.Accessibility EnhancedBackgroundContrastEnabled -bool true
