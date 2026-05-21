local M = {}

function M.apply(config)
  config.default_prog = { '/bin/zsh', '-l' }
  config.macos_window_background_blur = 24
end

return M
