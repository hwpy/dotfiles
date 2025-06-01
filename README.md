#  Configuration files for Arch Linux and soft

Soft:
bspwm / hyprland / nvim / alacritty / tmux / user shell etc ...

## 󰣇 Arch Linux

<p align="center">
  <figure style="display: inline-block; text-align: center;">
    <img src="screenshots/arch_bspwm.png" alt="arch bspwm">
    <figcaption>Desktop</figcaption>
  </figure>
</p>

<div style="display: flex; justify-content: center; gap: 40px;">

  <figure style="text-align: center; margin: 0;">
    <img src="screenshots/rofi_drun.gif" alt="Rofi" style="max-width: 300px;">
    <figcaption>Rofi</figcaption>
  </figure>

  <figure style="text-align: center; margin: 0;">
    <img src="screenshots/rofi_powermenu.gif" alt="Custom powermenu" style="max-width: 300px;">
    <figcaption>Custom powermenu</figcaption>
  </figure>

</div>

### Based on:
xorg:
- [bspwm](https://github.com/baskerville/bspwm) - tiling
- [sxhkd](https://github.com/baskerville/sxhkd) - hotkey deamon
- [picom](https://github.com/yshui/picom) - compositor
- [polybar](https://github.com/polybar/polybar) - status bar
- [rofi](https://github.com/davatorium/rofi) - menu

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

##  Neovim (under construction)

<p align="center">
    <img src="screenshots/nvim.png">
</p>

### Files:
- alacritty/alactirry.toml: config for Alacritty terminal emulator
- nvim: lua config files for neovim
- ruff/pyproject.toml: ruff config
- user: config files for user dir (tmux, zsh)

### Requirements:
- npm / fnm pyright
    * npm install -g pyright
- lua
- ruff (optional)

##  Inspired by:
- [1](https://github.com/gh0stzk/dotfiles)
- [2](https://github.com/Zproger/bspwm-dotfiles)

## 󰸉 Wallpapers by:
- [1](https://github.com/gh0stzk/dotfiles)
- [2](https://github.com/connorslade/ArchPapers)
