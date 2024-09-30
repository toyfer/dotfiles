--- If you want to place this outside the current directory, changeit in .wezterm.lua
-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This will hold the configuretion.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- default shell
config.default_prog = { 'powershell.exe' }
---- view setting
-- general
config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
-- color theme
config.color_scheme = 'ayu'
-- font setting
config.font = wezterm.font 'HackGen Console NF'
--config.font_size = 10.0
--config.line_height = 0.9
-- col setting
config.initial_cols = 120
config.initial_rows = 30

-- and finally, return the configuration to wezterm
return config
