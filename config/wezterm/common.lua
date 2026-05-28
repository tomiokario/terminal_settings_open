local M = {}

function M.apply(wezterm)
  local config = wezterm.config_builder()

  config.automatically_reload_config = true
  config.font_size = 13.0
  config.use_ime = true
  config.color_scheme = 'iceberg-dark'
  config.window_background_opacity = 0.84
  config.text_background_opacity = 1.0
  config.window_decorations = 'RESIZE'

  config.window_frame = {
    inactive_titlebar_bg = 'none',
    active_titlebar_bg = 'none',
  }

  config.window_background_gradient = {
    colors = { '#161821' },
  }

  config.colors = {
    tab_bar = {
      inactive_tab_edge = 'none',
    },
  }

  local function tab_title(tab)
    if tab.tab_title and #tab.tab_title > 0 then
      return tab.tab_title
    end

    return tab.active_pane.title
  end

  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local background = '#5c6d74'
    local foreground = '#FFFFFF'

    if tab.is_active then
      background = '#1995ad'
      foreground = '#FFFFFF'
    end

    local title = '   ' .. wezterm.truncate_right(tab_title(tab), max_width - 1) .. '   '

    return {
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
    }
  end)

  return config
end

return M
