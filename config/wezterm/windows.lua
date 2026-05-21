local M = {}

function M.apply(config)
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
  config.win32_system_backdrop = 'Acrylic'
  config.window_background_opacity = 0.78
end

return M
