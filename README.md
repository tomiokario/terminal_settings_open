# terminal_settings_open

macOS / Windows / WSL で使う terminal settings の共有用セットです。

Starship、WezTerm、tmux、Neovim の設定を、必要なファイルだけコピーして使える形で置いています。clone してそのまま試すことも、自分の環境に合わせて一部だけ取り込むこともできます。

## Contents

```text
config/
  nvim/
    init.vim
  starship.toml
  starship-wsl.toml
  tmux/
    tmux.conf
  wezterm/
    wezterm.lua
    common.lua
    macos.lua
    windows.lua
docs/
  customization.md
  design.md
  usage.md
```

## Quick Start

Clone the repository:

```sh
git clone git@github.com:tomiokario/terminal_settings_open.git
cd terminal_settings_open
```

Copy only the files you want to use. For example, on macOS:

```sh
mkdir -p ~/.config/wezterm ~/.config/nvim
cp config/starship.toml ~/.config/starship.toml
cp config/wezterm/*.lua ~/.config/wezterm/
cp config/nvim/init.vim ~/.config/nvim/init.vim
cp config/tmux/tmux.conf ~/.tmux.conf
```

For Windows and WSL paths, see [docs/usage.md](docs/usage.md).

## Design Notes

The settings are split by tool and by OS-specific behavior:

- shared terminal appearance and behavior live in common files
- macOS and Windows WezTerm differences live in separate Lua modules
- WSL uses a dedicated Starship config
- tmux is intended for macOS and WSL

See [docs/design.md](docs/design.md) and the GitHub Wiki for the human-readable design overview.

## Customize

These files are intended to be edited after cloning. Start with [docs/customization.md](docs/customization.md), then adjust colors, shell paths, prompt modules, key bindings, and editor settings for your own workflow.
