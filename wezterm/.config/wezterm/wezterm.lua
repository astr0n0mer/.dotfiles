-- https://wezfurlong.org/wezterm/config/lua/config/index.html

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.line_height = 0.9
-- config.window_background_opacity = 0.75
config.window_decorations = "RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- config.font_size = 12.5
if wezterm.target_triple:find("apple") then
	config.font_size = 12.5
elseif wezterm.target_triple:find("linux") then
	config.font_size = 11.5
end

-- config.keys = {
-- 	{ mods = "CTRL", key = "L", action = wezterm.action.ShowDebugOverlay },
-- 	{ mods = "SUPER", key = "v", action = wezterm.action.PasteFrom("Clipboard") },
-- }

return config
