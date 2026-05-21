# terminal_settings_open

macOS / Windows / WSL で使うターミナル設定集です。

Starship、WezTerm、tmux、Neovim の設定を、必要なファイルだけコピーして使える形で置いています。クローンしてそのまま試すことも、自分の環境に合わせて一部だけ取り込むこともできます。

**image 1: WezTerm・Starship**

<img width="590" height="450" alt="Screenshot 2026-05-21 at 15 03 00" src="https://github.com/user-attachments/assets/144e43b5-d465-4489-8680-65d4029940c1" />

**image 2: tmuxによる画面分割とNeovim**

<img alt="Screenshot 2026-05-21 at 15 07 08" src="https://github.com/user-attachments/assets/a41566fe-08e1-413c-b42c-e8ffa9909903" />


## 内容

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

## 使い始める

リポジトリをクローンします。

```sh
git clone git@github.com:tomiokario/terminal_settings_open.git
cd terminal_settings_open
```

使いたいファイルだけコピーします。macOS の例は次のとおりです。

```sh
mkdir -p ~/.config/wezterm ~/.config/nvim
cp config/starship.toml ~/.config/starship.toml
cp config/wezterm/*.lua ~/.config/wezterm/
cp config/nvim/init.vim ~/.config/nvim/init.vim
cp config/tmux/tmux.conf ~/.tmux.conf
```

Windows と WSL の配置例は [docs/usage.md](docs/usage.md) を参照してください。

## 設計メモ

設定は、ツールごと、OS 固有の挙動ごとに分けています。

- 共通の見た目や挙動は共通ファイルに置く
- macOS と Windows の WezTerm 差分は別の Lua module に分ける
- WSL は専用の Starship 設定を使う
- tmux は macOS / WSL で使う前提にする

設計の詳しい説明は [docs/design.md](docs/design.md) と GitHub Wiki を参照してください。

## カスタマイズ

このリポジトリの設定ファイルは、クローン後に編集して使う前提です。[docs/customization.md](docs/customization.md) を起点に、色、shell path、prompt module、key binding、editor 設定を自分の作業スタイルに合わせて調整してください。
