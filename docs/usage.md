# 使い方

このリポジトリをクローンし、使いたい設定だけコピーします。

```sh
git clone git@github.com:tomiokario/terminal_settings_open.git
cd terminal_settings_open
```

## macOS

典型的な配置先は次のとおりです。

```sh
mkdir -p ~/.config/wezterm ~/.config/nvim
cp config/starship.toml ~/.config/starship.toml
cp config/wezterm/*.lua ~/.config/wezterm/
cp config/nvim/init.vim ~/.config/nvim/init.vim
cp config/tmux/tmux.conf ~/.tmux.conf
```

前提ツール:

- Starship
- WezTerm
- Neovim
- tmux
- zsh

## Windows

PowerShell から配置する例です。

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\.config\wezterm" | Out-Null
New-Item -ItemType Directory -Force "$env:LOCALAPPDATA\nvim" | Out-Null

Copy-Item .\config\starship.toml "$env:USERPROFILE\.config\starship.toml"
Copy-Item .\config\wezterm\*.lua "$env:USERPROFILE\.config\wezterm\"
Copy-Item .\config\nvim\init.vim "$env:LOCALAPPDATA\nvim\init.vim"
```

前提ツール:

- Starship
- WezTerm
- Neovim
- PowerShell

## WSL

Linux 側の環境で、WSL 用の Starship 設定を使います。

```sh
mkdir -p ~/.config
cp config/starship-wsl.toml ~/.config/starship.toml
cp config/tmux/tmux.conf ~/.tmux.conf
```

前提ツール:

- Starship
- tmux
- bash または zsh

## 更新

最新の変更を取り込み、home directory にコピーする前に差分を確認します。

```sh
git pull
git diff HEAD@{1} -- config docs
```
