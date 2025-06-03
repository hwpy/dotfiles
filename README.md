# 💻 Configuration files for Arch Linux and software

<details open>
<summary>EN</summary>

## Key features

- 🧩 Minimalist, lightweight software following the Unix philosophy — doing one thing well.
- 📦 Only official Arch packages for stability and security.
- ⚙️ Simple, transparent config, no unnecessary automation or GUIs, follows KISS.
- 🔧 Full user control — manual selection and setup.
- 🖥️ Focus on terminal/text tools (bspwm, nvim, tmux, zsh) for efficiency.
- 🌐 Supports Xorg and Wayland (Hyprland) for a flexible GUI.
- 🎨 Customizable appearance (polybar, rofi, picom, themes, icons).
- ⚡ Prioritizes lightness, resource efficiency, and performance.

_At the moment, the system is set up to use the Dracula color scheme._


## 🐧 Arch Linux

<div style="text-align: center;">

  <figure style="display: inline-block; text-align: center; margin: 1em;">
    <img src="screenshots/arch_bspwm.png" alt="arch bspwm" style="max-width: 300px;">
  </figure>
  <p align="center"><strong>Desktop</strong></p>

  <figure style="display: inline-block; text-align: center; margin: 1em;">
    <img src="screenshots/rofi_drun.gif" alt="Rofi" style="max-width: 300px;">
  </figure>
  <p align="center"><strong>Rofi</strong></p>

  <figure style="display: inline-block; text-align: center; margin: 1em;">
    <img src="screenshots/rofi_powermenu.gif" alt="Custom powermenu" style="max-width: 300px;">
  </figure>
  <p align="center"><strong>Custom powermenu</strong></p>

</div>

### Display servers:

_Supports Xorg or Wayland, by choice_

#### Xorg components:
- [bspwm](https://github.com/baskerville/bspwm) - tiling
- [sxhkd](https://github.com/baskerville/sxhkd) - hotkey daemon
- [picom](https://github.com/yshui/picom) - compositor
- [polybar](https://github.com/polybar/polybar) - status bar
- [rofi](https://github.com/davatorium/rofi) - menu

#### Wayland components:
- [hyprland](https://github.com/hyprwm/Hyprland) - tiling / compositor
- [waybar](https://github.com/Alexays/Waybar) - status bar
- [wofi](https://man.archlinux.org/man/wofi.1.en) - menu

#### Appearance:
- [breeze](https://archlinux.org/packages/extra/x86_64/breeze/) - cursor theme
- [materia-gtk-theme](https://archlinux.org/packages/extra/any/materia-gtk-theme/) - theme
- [papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) - icons
- [ttf-jetbrains-mono-nerd](https://archlinux.org/packages/extra/any/ttf-jetbrains-mono-nerd/) - font

### Software
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
- [calcurse](https://github.com/lfos/calcurse) - text-based calendar
- [blueman-manager](https://github.com/blueman-project/blueman) - bluetooth manager GUI
- [NetworkManager](https://networkmanager.dev/) - network manager

## 📝 Neovim

_Based on NvChad_

```Shell
:MasonInstallAll
:Lazy sync
```

<p align="center">
    <img src="screenshots/nvim.png">
</p>

### Files:
- alacritty/alacritty.toml: config for Alacritty terminal emulator
- nvim: lua config files for neovim
- ruff/pyproject.toml: ruff config
- user: config files for user dir (tmux, zsh, .X*, drivers configuration)

### Requirements:
- npm / fnm pyright
    * npm install -g pyright
- lua
- unzip

## 💡 Inspired by:
- [1](https://github.com/gh0stzk/dotfiles)
- [2](https://github.com/Zproger/bspwm-dotfiles)
- [3](https://github.com/raexera/tokyo)

## 🖼 Wallpapers by:
- [1](https://github.com/gh0stzk/dotfiles)
- [2](https://github.com/connorslade/ArchPapers)
- [3](https://github.com/LagrangianLad/arch-minimal-wallpapers)
- [4](https://github.com/archcraft-os/archcraft-wallpapers)
- [5](https://github.com/raexera/tokyo)

</details>
---
