# 設計

このリポジトリでは、ターミナル設定をツール単位と OS 境界で整理しています。

## 目的

- macOS / Windows / WSL で、近い見た目の terminal 環境を使う。
- OS 固有の shell 挙動を共通設定から分ける。
- 各設定ファイルをコピー、確認、カスタマイズしやすくする。
- 暗黙の setup より、明示的な設定ファイルを優先する。

## Starship

`config/starship.toml` は macOS / Windows 向けの主な prompt 設定です。custom directory module を使い、現在の directory が親 directory より強く見えるようにしています。

`config/starship-wsl.toml` は同じ prompt の考え方を WSL 向けに分けた設定です。

## WezTerm

WezTerm は小さな Lua module に分けています。

- `wezterm.lua`: 設定を読み込み、OS に応じた module を選ぶ
- `common.lua`: 共通の見た目と tab title の挙動
- `macos.lua`: macOS の shell と blur 設定
- `windows.lua`: PowerShell と Windows 固有の背景設定

## tmux

`config/tmux/tmux.conf` は macOS / WSL で使う前提です。prefix は `C-a`、copy mode は vi style、pane 移動 key と terminal theme に合わせた status 表示を設定しています。

## Neovim

`config/nvim/init.vim` は単一ファイルの Neovim 設定です。まずコピーして使い、設定が大きくなったら後から分割できる形にしています。
