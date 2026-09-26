-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- changing the font size and color scheme.
config.font_size = 14
config.color_scheme = "AdventureTime"

-- Let AeroSpace manage the window without native macOS decorations.
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}
config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"

-- Finally, return the configuration to wezterm:
return config
