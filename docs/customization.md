# カスタマイズ

このリポジトリの各ファイルは、カスタマイズの出発点として扱ってください。

## Starship

`config/starship.toml` または `config/starship-wsl.toml` を編集します。

よく変更する箇所:

- custom directory module の prompt 色
- cloud provider module の有効化 / 無効化
- Git branch と Git status の表示形式
- path の省略長

## WezTerm

共通の見た目は `config/wezterm/common.lua` で調整します。

よく変更する箇所:

- `font_size`
- `color_scheme`
- `window_background_opacity`
- tab title の色

default shell を変える場合は、OS 固有のファイルを編集します。

- `config/wezterm/macos.lua`
- `config/wezterm/windows.lua`

## tmux

`config/tmux/tmux.conf` を編集します。

よく変更する箇所:

- prefix key
- split binding
- pane 移動 binding
- status bar の色
- history limit

## Neovim

`config/nvim/init.vim` を編集します。

よく変更する箇所:

- color scheme
- plugin list
- indentation 設定
- key mapping

既存のターミナル設定がある場合は、home directory に反映する前に必ず差分を確認してください。
