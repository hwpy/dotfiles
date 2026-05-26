#!/bin/bash
set -e

yesno() {
    local answer
    read -p "$1 [Y/n] " answer
    [ "$answer" != "n" ] && [ "$answer" != "N" ]
}

cat <<'BANNER'
  █████╗ ██████╗  ██████╗██╗  ██╗    ██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗
 ██╔══██╗██╔══██╗██╔════╝██║  ██║    ██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║
 ███████║██████╔╝██║     ███████║    ██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║
 ██╔══██║██╔══██╗██║     ██╔══██║    ██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║
 ██║  ██║██║  ██║╚██████╗██║  ██║    ██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║
 ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝

               bspwm · polybar · rofi · picom · dunst
BANNER

# Проверка Arch Linux
if [ ! -f /etc/arch-release ]; then
    echo "Только Arch Linux."
    exit 1
fi

# SUDO
if ! sudo -v; then
    echo "Нужен sudo."
    exit 1
fi

cd ~/dotfiles 2>/dev/null || { echo "Клонируй репозиторий в ~/dotfiles: git clone https://github.com/hwpy/dotfiles.git ~/dotfiles"; exit 1; }

echo

# Пакеты
read -p "Установить пакеты (48)? [Y/n] " pkg_answer
if [ "$pkg_answer" != "n" ] && [ "$pkg_answer" != "N" ]; then
    sudo pacman -S --needed \
        xorg-server xorg-xinit xorg-xrandr xorg-xinput xorg-xrdb xorg-xsetroot \
        bspwm sxhkd picom polybar rofi dunst \
        alacritty zsh \
        ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols noto-fonts \
        papirus-icon-theme breeze breeze-gtk breeze-cursors \
        feh flameshot brightnessctl xclip udiskie \
        slock xss-lock \
        touchegg tlp \
        pipewire pipewire-pulse pipewire-alsa wireplumber \
        networkmanager \
        libcanberra playerctl pavucontrol jq fd \
        stow git \
        neovim tmux fastfetch btop yazi fzf eza
    echo
fi

# Env (только если нет)
if [ ! -f ~/.config/env/env ]; then
    read -p "Настроить env (мониторы, масштаб, тема)? [Y/n] " env_answer
    if [ "$env_answer" != "n" ] && [ "$env_answer" != "N" ]; then
        stow env
        cp -n ~/.config/env/env.template ~/.config/env/env

        echo
        echo "Мониторы:"
        xrandr --listmonitors 2>/dev/null | awk 'NR>1{print $4}' || echo "xrandr не доступен — укажи позже в ~/.config/env/env"
        echo

        read -p "Внутренний монитор (например eDP-1): " monitor
        [ -n "$monitor" ] && sed -i "s/export INTERNAL_MONITOR=.*/export INTERNAL_MONITOR=\"$monitor\"/" ~/.config/env/env

        read -p "Внешний монитор (например DP-1): " ext_monitor
        [ -n "$ext_monitor" ] && sed -i "s/export EXTERNAL_MONITOR=.*/export EXTERNAL_MONITOR=\"$ext_monitor\"/" ~/.config/env/env

        echo
        echo "DPI: 100 (FullHD) | 150 (Retina 13-15\") | 200 (4K)"
        read -p "HIDPI_FACTOR [100]: " hidpi
        [ -n "$hidpi" ] && sed -i "s/export HIDPI_FACTOR=.*/export HIDPI_FACTOR=$hidpi/" ~/.config/env/env

        read -p "Тема dark/light [dark]: " theme
        [ -n "$theme" ] && sed -i "s/export THEME_MODE=.*/export THEME_MODE=$theme/" ~/.config/env/env

        echo
        echo "env сохранён. Потом можно поправить: nvim ~/.config/env/env"
    fi
    echo
fi

# Конфиги
if yesno "x11 (сессия, Xft.dpi, курсор)?"; then stow x11; fi
if yesno "GTK (тема приложений)?"; then stow gtk-2.0 gtk-3.0 gtk-4.0; fi
if yesno "colors (цветовые схемы)?"; then stow colors; fi
if yesno "bspwm + sxhkd?"; then stow bspwm sxhkd; fi
if yesno "polybar, picom, rofi, dunst?"; then stow polybar picom rofi dunst; fi
if yesno "zsh, tmux, neovim, chromium wrapper?"; then stow zsh_linux tmux nvim bin; fi
if yesno "touchegg (жесты тачпада)?"; then stow touchegg; fi
if yesno "fastfetch, btop, yazi, mpv?"; then stow fastfetch btop yazi mpv; fi
echo

# Сервисы
echo "Сервисы..."
systemctl --user enable --now pipewire-pulse wireplumber 2>/dev/null || true
sudo systemctl enable --now NetworkManager 2>/dev/null || true
sudo systemctl enable --now touchegg 2>/dev/null || true
if [ -d /sys/class/power_supply ]; then
    sudo systemctl enable --now tlp 2>/dev/null || true
fi
echo

# Опционально
if yesno "oh-my-zsh?"; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
fi

if yesno "chsh -s /usr/bin/zsh?"; then
    chsh -s /usr/bin/zsh
fi

echo
echo "Готово."
echo "  Выйди из сессии, в GDM выбери bspwm."
echo "  После входа: super+alt+T (цветовая схема)."
