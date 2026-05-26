# Первоначальная настройка

Пакеты Arch Linux, необходимые перед развёртыванием dotfiles.

## Ядро

```bash
# сервер отображения + оконный менеджер
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xrdb xorg-xsetroot
sudo pacman -S bspwm sxhkd

# композитор + бар + лаунчер + уведомления
sudo pacman -S picom polybar rofi dunst

# терминал + оболочка
sudo pacman -S alacritty zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions

# шрифты + иконки + курсор
sudo pacman -S ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols noto-fonts
sudo pacman -S papirus-icon-theme breeze breeze-gtk

# утилиты
sudo pacman -S feh flameshot brightnessctl xclip udiskie
```

## Звук

```bash
sudo pacman -S pipewire pipewire-pulse pipewire-alsa wireplumber
systemctl --user enable --now pipewire-pulse wireplumber
```

## Сессия

```bash
# блокировка экрана
sudo pacman -S slock xss-lock

# запись сессии для GDM
sudo tee /usr/share/xsessions/bspwm.desktop <<'EOF'
[Desktop Entry]
Name=bspwm
Exec=bspwm
Type=Application
EOF
```

## Ноутбук (опционально)

```bash
# жесты тачпада
sudo pacman -S touchegg
sudo systemctl enable --now touchegg

# энергосбережение
sudo pacman -S tlp
sudo systemctl enable --now tlp

# MacBook: fn-режим клавиатуры
echo 'options hid_apple fnmode=2' | sudo tee /etc/modprobe.d/hid_apple.conf
sudo mkinitcpio -P
```

## Сеть

```bash
sudo pacman -S networkmanager
sudo systemctl enable --now NetworkManager
```

## Дополнительно

```bash
sudo pacman -S firefox chromium thunderbird
sudo pacman -S neovim tmux fastfetch btop yazi fzf eza
sudo pacman -S mpv yt-dlp
sudo pacman -S gnu-stow git
```
