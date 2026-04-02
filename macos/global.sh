defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

WALLPAPER="$HOME/.config/backgrounds/greenComputer.jpeg"

osascript -e "tell application \"System Events\" to set picture of every desktop to \"$WALLPAPER\""
