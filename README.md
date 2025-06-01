# ⚙️ Configuration files for Arch Linux and soft

Soft:
bspwm / hyprland / nvim / alacritty / tmux / user shell etc ...

## 🐧 Arch Linux

<div style="text-align: center;">

  <figure style="display: inline-block; text-align: center; margin: 1em;">
    <img src="screenshots/arch_bspwm.png" alt="arch bspwm" style="max-width: 300px;">
  </figure>
  <p align="center">**Desktop**</p>

  <figure style="display: inline-block; text-align: center; margin: 1em;">
    <img src="screenshots/rofi_drun.gif" alt="Rofi" style="max-width: 300px;">
  </figure>
  <p align="center">**Rofi**</p>

  <figure style="display: inline-block; text-align: center; margin: 1em;">
    <img src="screenshots/rofi_powermenu.gif" alt="Custom powermenu" style="max-width: 300px;">
  </figure>
  <p align="center">**Custom powermenu**</p>

</div>

### Based on:
xorg:
- [bspwm](https://github.com/baskerville/bspwm) - tiling
- [sxhkd](https://github.com/baskerville/sxhkd) - hotkey daemon
- [picom](https://github.com/yshui/picom) - compositor
- [polybar](https://github.com/polybar/polybar) - status bar
- [rofi](https://github.com/davatorium/rofi) - menu

appearance:
- [breeze](https://archlinux.org/packages/extra/x86_64/breeze/) - cursor theme
- [materia-gtk-theme](https://archlinux.org/packages/extra/any/materia-gtk-theme/) - theme
- [papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) - icons
- [ttf-jetbrains-mono-nerd](https://archlinux.org/packages/extra/any/ttf-jetbrains-mono-nerd/) - font

### Tried:
wayland:
- [hyprland](https://github.com/hyprwm/Hyprland) - tiling / compositor
- [waybar](https://github.com/Alexays/Waybar) - status bar
- [wofi](https://man.archlinux.org/man/wofi.1.en) - menu

### Soft
- [alacritty](https://github.com/alacritty/alacritty) - terminal emulator
- [tmux](https://github.com/tmux/tmux) - terminal multiplexer
- [neovim](https://github.com/neovim/neovim) - for all things
- [nvchad](https://github.com/NvChad/NvChad) - neovim framework
- [thunar](https://gitlab.xfce.org/xfce/thunar) - file manager GUI
- [ranger](https://github.com/ranger/ranger) - file manager TUI
- [firefox](https://www.mozilla.org/ru/firefox/new/) - main web browser
- [flameshot](https://github.com/flameshot-org/flameshot) - screenshot software
- [cmatrix](https://github.com/abishekvashok/cmatrix) - matrix screensaver
- [htop](https://github.com/htop-dev/htop) - process viewer
- [fastfetch](https://github.com/fastfetch-cli/fastfetch) - system information tool

## 📝 Neovim (under construction)

<p align="center">
    <img src="screenshots/nvim.png">
</p>

### Files:
- alacritty/alacritty.toml: config for Alacritty terminal emulator
- nvim: lua config files for neovim
- ruff/pyproject.toml: ruff config
- user: config files for user dir (tmux, zsh)

### Requirements:
- npm / fnm pyright
    * npm install -g pyright
- lua
- ruff (optional)

## 💡 Inspired by:
- [1](https://github.com/gh0stzk/dotfiles)
- [2](https://github.com/Zproger/bspwm-dotfiles)

## 🖼 Wallpapers by:
- [1](https://github.com/gh0stzk/dotfiles)
- [2](https://github.com/connorslade/ArchPapers)

