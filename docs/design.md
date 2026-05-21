# Design

This repository keeps terminal settings organized by tool and by operating-system boundary.

## Goals

- Share a consistent terminal look across macOS, Windows, and WSL.
- Keep OS-specific shell behavior out of shared config files.
- Make each setting file easy to copy, inspect, and customize.
- Prefer explicit files over hidden setup behavior.

## Starship

`config/starship.toml` is the main prompt configuration for macOS and Windows. It uses custom directory modules so the current directory is visually stronger than ancestor directories.

`config/starship-wsl.toml` keeps the same prompt idea but is separated for WSL-specific use.

## WezTerm

WezTerm is split into small Lua modules:

- `wezterm.lua` loads the config and chooses the OS-specific module.
- `common.lua` contains shared appearance and tab title behavior.
- `macos.lua` sets the macOS shell and blur behavior.
- `windows.lua` sets PowerShell and Windows-specific background behavior.

## tmux

`config/tmux/tmux.conf` is intended for macOS and WSL. It uses `C-a` as the prefix, vi-style copy mode, pane navigation bindings, and status styling that matches the terminal theme.

## Neovim

`config/nvim/init.vim` is a single-file Neovim configuration. It is intended to be easy to copy first and refactor later if your setup grows.
