# Customization

Treat every file in this repository as a starting point.

## Starship

Edit `config/starship.toml` or `config/starship-wsl.toml`.

Common changes:

- adjust prompt colors in the custom directory modules
- enable or disable cloud provider modules
- change Git branch and Git status formatting
- tune the path truncation length

## WezTerm

Edit `config/wezterm/common.lua` for shared appearance.

Common changes:

- `font_size`
- `color_scheme`
- `window_background_opacity`
- tab title colors

Edit the OS-specific files when changing default shells:

- `config/wezterm/macos.lua`
- `config/wezterm/windows.lua`

## tmux

Edit `config/tmux/tmux.conf`.

Common changes:

- prefix key
- split bindings
- pane navigation bindings
- status bar colors
- history limit

## Neovim

Edit `config/nvim/init.vim`.

Common changes:

- color scheme
- plugin list
- indentation settings
- key mappings

Review each copied file before applying it to your home directory, especially when you already have existing terminal settings.
