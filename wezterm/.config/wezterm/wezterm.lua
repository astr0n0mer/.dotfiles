-- https://wezfurlong.org/wezterm/config/lua/config/index.html

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.disable_default_key_bindings = true
config.enable_tab_bar = false

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.5
-- config.line_height = 0.9

config.window_background_opacity = 0.75
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
}

return config
