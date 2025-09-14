local wezterm = require("wezterm")
local config = {}

-- config.font = wezterm.font 'JetBrains Mono'
config.send_composed_key_when_left_alt_is_pressed = true
config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

return config
