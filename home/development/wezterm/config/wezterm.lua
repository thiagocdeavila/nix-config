local wezterm = require "wezterm"

local colors = require("lua/themes/kanagawa-dragon").colors

local config = {
  colors = colors
}

config.font = wezterm.font("GeistMono Nerd Font")
config.font_size = 14.0

config.hide_tab_bar_if_only_one_tab = true

return config
