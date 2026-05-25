# Dotfiles Deployment

## Install GNU Stow

```Shell
sudo pacman -S stow
```

## Clone the Repository

```Shell
git clone https://github.com/hwpy/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## Structure

Each top-level directory is a **Stow package** that mirrors `$HOME`:

| Package | Deploys to |
|---|---|
| `bspwm` | `~/.config/bspwm/` |
| `polybar` | `~/.config/polybar/` |
| `sxhkd` | `~/.config/sxhkd/` |
| `nvim` | `~/.config/nvim/` |
| `zsh_linux` | `~/.zshrc` |
| `tmux` | `~/.tmux.conf`, `~/.tmux/themes/` |
| `kitty` | `~/.config/kitty/` |
| `env` | `~/.config/env/` |
| ... | |

## Machine-Specific Configuration (`env`)

**This step must be done before deploying packages that use environment variables** (bspwm, polybar, x11).

```Shell
stow env
cp ~/.config/env/env.template ~/.config/env/env
nvim ~/.config/env/env
```

The template contains comments explaining where to get the values:

- **Monitors:** `xrandr --listmonitors | awk '{print $4}'`
- **Lock screen wallpaper:** path to image in `~/.config/wlppr/`
- **Battery/Power supply:** `ls /sys/class/power_supply/`
- **CPU temperature sensor:** `ls /sys/class/hwmon/*/temp*_input`
- **SSH keys** are defined in `~/.ssh/config` (see `ssh/` package)

The `env` file is gitignored — each machine has its own.

## Deploy

```Shell
stow bspwm polybar sxhkd picom dunst rofi
stow nvim zsh_linux tmux kitty
stow ssh x11 colors gtk-3.0 gtk-4.0
stow touchegg fastfetch mpv yazi
# ... add any package you need
```

Stow creates symlinks from `~/dotfiles/` to `~/`. To remove a package: `stow -D <name>`.
