# Initial Setup

## Wi-Fi/Bluetooth

```Shell
sudo systemctl enable --now NetworkManager

sudo pacman -Syu broadcom-wl bluez bluez-utils blueman pulseaudio-bluetooth pulseaudio-alsa
sudo systemctl enable --now bluetooth

sudo modprobe wl

```

_installation of broadcom-wl and wl configuration depends on your network hardware_

## Video Intel

```Shell
sudo pacman -S intel-gpu-tools libva libva-utils libva-intel-driver vulkan-intel

```

## Audio PipeWire

```Shell
sudo pacman -S rtkit pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber alsa-utils

sudo systemctl enable --now rtkit-daemon.service

systemctl --user enable --now pipewire-pulse.service pipewire-pulse.socket wireplumber.service

```

## Function/Media Keys Configuration

_this configuration is relevant for MacBook, can be skipped_

```Shell
sudo nano /etc/modprobe.d/hid_apple.conf
options hid_apple fnmode=2
sudo mkinitcpio -P
sudo reboot

```

## PowerKey Configuration

_to prevent accidental laptop shutdown_

```Shell
sudo nvim /etc/systemd/logind.conf
HandlePowerKey=ignore
HandlePowerKeyLongPress=poweroff

```

## Sleep Mode and Screen Lock Configuration

_other settings are included in the bspwm configuration in this repository_

```Shell
sudo pacman -S i3lock xss-lock

HandleLidSwitch=suspend
HandleLidSwitchDocked=suspend

```

## Screen Brightness

```Shell
sudo pacman -S brightnessctl

```

## Printer Setup

```Shell
sudo pacman -S cups hplip system-config-printer gutenprint splix foomatic-db foomatic-db-gutenprint-ppds
sudo systemctl enable --now cups.service

```

## Input Devices for X Server

```Shell
sudo pacman -S xorg-xinput

```

## Language Settings (Locale)

```Shell
sudo nvim /etc/locale.gen # uncomment needed locale
sudo locale-gen

```

## Touchpad Gestures

_tested on MacBook_

```Shell
sudo pacman -S touchegg
sudo systemctl enable --now touchegg.service

```

## Clipboard

```Shell
sudo pacman -S xclip

```

## TLP Power Saving (for laptops)

```Shell
sudo pacman -S tlp
sudo systemctl enable --now tlp.service

```

## VPN

```Shell
sudo pacman -S openvpn networkmanager-openvpn
sudo pacman -S openconnect networkmanager-openconnect

```

## Software

```Shell

# essential software
sudo pacman -S \
alacritty \ # terminal
cmatrix \ # matrix screensaver
dunst \ # notifications
fastfetch \ # system information in terminal
feh \ # wallpaper management
firefox \ # browser
gvfs gvfs gvfs-afc gvfs-mtp gvfs-smb \ # thunar network resources and USB
libcanberra \ # system sounds
lxappearance \ # color scheme management
nvim \ # text editor
nvm \ # nodejs version manager
pavucontrol \ # audio control
picom \ # window compositor
playerctl \ # track control
polkit \ # thunar network resources and USB
polybar \ # menu bar
postgresql-libs \ # postgresql libraries
ranger \ # tui file manager
ristretto \ # image preview for thunar
rofi \ # application launcher
sound-theme-freedesktop \ # system sounds
sxhkd \ # hotkeys
thunar \ # gui file manager
thunar-volman \ # thunar network resources and USB
tmux \ # terminal multiplexer
udisks2 \ # thunar network resources and USB
unzip \ # archive handling
xorg-xrandr \ # display scaling and resolution

# optional software
sudo pacman -S \
breeze \ # color scheme and cursors
calcurse \ # tui calendar
chromium \ # browser
dbeaver \ # database client
evolution evolution-ews \ # email client
flameshot \ # screenshot tool
gdu \ # disk usage analyzer
htop \ # resource monitor
libreoffice-still \ # office suite
mpv yt-dlp \ # media player + youtube library
obsidian \ # obsidian notes
peek \ # gif recorder
qalculate-gtk \ # calculator
remmina freerdp \ # remote desktop
telegram-desktop \ # telegram client
transmission-gtk \ # torrent client
uv \ # python version and venv management

```

## Fonts

```Shell
sudo pacman -S ttf-nerd-fonts-symbols ttf-nerd-fonts ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-font-awesome ttf-nerd-fonts-symbols papirus-icon-theme materia-gtk-theme

fc-cache -f -v

```

## Application/Cursor Color Scheme

```Shell
lxappearance

# Theme: Materia-dark
# Cursor: breeze

```
