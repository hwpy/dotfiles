# Initial Setup

Arch Linux packages required before deploying dotfiles.

## Core

```bash
# display server + window manager
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xrdb xorg-xsetroot
sudo pacman -S bspwm sxhkd

# compositor + bar + launcher + notifications
sudo pacman -S picom polybar rofi dunst

# terminal + shell
sudo pacman -S alacritty zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions

# fonts + icons + cursor
sudo pacman -S ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols noto-fonts
sudo pacman -S papirus-icon-theme breeze breeze-gtk

# utilities
sudo pacman -S feh flameshot brightnessctl xclip udiskie
```

## Audio

```bash
sudo pacman -S pipewire pipewire-pulse pipewire-alsa wireplumber
systemctl --user enable --now pipewire-pulse wireplumber
```

## Session

```bash
# lock screen
sudo pacman -S slock xss-lock

# GDM session entry
sudo tee /usr/share/xsessions/bspwm.desktop <<'EOF'
[Desktop Entry]
Name=bspwm
Exec=bspwm
Type=Application
EOF
```

## Laptop (optional)

```bash
# touchpad gestures
sudo pacman -S touchegg
sudo systemctl enable --now touchegg

# power management
sudo pacman -S tlp
sudo systemctl enable --now tlp

# MacBook keyboard fn-mode
echo 'options hid_apple fnmode=2' | sudo tee /etc/modprobe.d/hid_apple.conf
sudo mkinitcpio -P
```

## Network

```bash
sudo pacman -S networkmanager
sudo systemctl enable --now NetworkManager
```

## Extras

```bash
sudo pacman -S firefox chromium thunderbird
sudo pacman -S neovim tmux fastfetch btop yazi fzf eza
sudo pacman -S mpv yt-dlp
sudo pacman -S gnu-stow git
```
