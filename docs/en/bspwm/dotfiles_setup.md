# Dotfiles Deployment

## Install GNU Stow

```bash
sudo pacman -S stow
```

## Clone

```bash
git clone https://github.com/hwpy/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## Structure

Each top-level directory is a **Stow package** that mirrors `$HOME`:

| Package | Deploys to |
|---|---|
| `bspwm` | `~/.config/bspwm/` |
| `sxhkd` | `~/.config/sxhkd/` |
| `polybar` | `~/.config/polybar/` |
| `picom` | `~/.config/picom/` |
| `rofi` | `~/.config/rofi/` |
| `dunst` | `~/.config/dunst/` |
| `x11` | `~/.xprofile`, `~/.xinitrc`, `~/.Xresources` |
| `colors` | `~/.config/colors/` |
| `gtk-*` | `~/.config/gtk-*/settings.ini` |
| `env` | `~/.config/env/env.template` |
| `bin` | `~/.local/bin/chromium` |
| `nvim` | `~/.config/nvim/` |
| `zsh_linux` | `~/.zshrc` |
| `tmux` | `~/.tmux.conf` |

## Machine-Specific Config (`env`)

**Do this first** — bspwm, polybar, and x11 depend on it.

```bash
stow env
cp ~/.config/env/env.template ~/.config/env/env
nvim ~/.config/env/env
```

Required variables:

```bash
export HIDPI_FACTOR=100      # 100 = 1080p, 175 = Retina 13"
export THEME_MODE=dark       # dark | light
export GTK_THEME="Breeze-Dark"
export ICON_THEME="Papirus-Dark"
export CURSOR_THEME="breeze_cursors"
export INTERNAL_MONITOR="eDP-1"
export EXTERNAL_MONITOR="DP-1"
export LOCKSCREEN_IMAGE="$HOME/.config/wlppr/skull.png"
export POLYBAR_BATTERY="BAT0"
export POLYBAR_ADAPTER="ADP1"
export POLYBAR_HWMON_PATH="/sys/class/hwmon/hwmon1/temp1_input"
```

`env` is **gitignored** — each machine has its own.

## Deploy

```bash
stow bspwm polybar sxhkd picom dunst rofi
stow x11 colors gtk-3.0 gtk-4.0
stow nvim zsh_linux tmux bin
stow touchegg fastfetch mpv yazi
# ... add any package you need
```

Removing: `stow -D <package>`.

## GDM Session

```bash
sudo tee /usr/share/xsessions/bspwm.desktop <<'EOF'
[Desktop Entry]
Name=bspwm
Exec=bspwm
Type=Application
EOF
```
