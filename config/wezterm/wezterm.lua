local wezterm = require 'wezterm'

local config_dir = wezterm.config_dir or (os.getenv('HOME') .. '/.config/wezterm')
local common = dofile(config_dir .. '/common.lua')

local config = common.apply(wezterm)

if wezterm.target_triple:find('windows') then
  dofile(config_dir .. '/windows.lua').apply(config)
elseif wezterm.target_triple:find('darwin') then
  dofile(config_dir .. '/macos.lua').apply(config)
end

return config
