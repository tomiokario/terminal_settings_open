# Usage

Clone this repository and copy the settings you want to use.

```sh
git clone git@github.com:tomiokario/terminal_settings_open.git
cd terminal_settings_open
```

## macOS

Typical locations:

```sh
mkdir -p ~/.config/wezterm ~/.config/nvim
cp config/starship.toml ~/.config/starship.toml
cp config/wezterm/*.lua ~/.config/wezterm/
cp config/nvim/init.vim ~/.config/nvim/init.vim
cp config/tmux/tmux.conf ~/.tmux.conf
```

Expected tools:

- Starship
- WezTerm
- Neovim
- tmux
- zsh

## Windows

Typical PowerShell locations:

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\.config\wezterm" | Out-Null
New-Item -ItemType Directory -Force "$env:LOCALAPPDATA\nvim" | Out-Null

Copy-Item .\config\starship.toml "$env:USERPROFILE\.config\starship.toml"
Copy-Item .\config\wezterm\*.lua "$env:USERPROFILE\.config\wezterm\"
Copy-Item .\config\nvim\init.vim "$env:LOCALAPPDATA\nvim\init.vim"
```

Expected tools:

- Starship
- WezTerm
- Neovim
- PowerShell

## WSL

Use the WSL-specific Starship config inside the Linux environment:

```sh
mkdir -p ~/.config
cp config/starship-wsl.toml ~/.config/starship.toml
cp config/tmux/tmux.conf ~/.tmux.conf
```

Expected tools:

- Starship
- tmux
- bash or zsh

## Updating

Pull the latest changes and review diffs before copying files into your home directory.

```sh
git pull
git diff HEAD@{1} -- config docs
```
