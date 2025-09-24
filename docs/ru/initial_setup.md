# Первоначальная настройка

## Wi-Fi/Bluetooth

```Shell
sudo systemctl enable --now NetworkManager

sudo pacman -Syu broadcom-wl bluez bluez-utils blueman pulseaudio-bluetooth pulseaudio-alsa
sudo systemctl enable --now bluetooth

sudo modprobe wl

```

_установка broadcom-wl и настройка wl зависит от вашего сетевого оборудования_

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

## Настройка функциональных/медиа клавиш

_данная настройка актуальна для MacBook, можно пропустить_

```Shell
sudo nano /etc/modprobe.d/hid_apple.conf
options hid_apple fnmode=2
sudo mkinitcpio -P
sudo reboot

```

## Настройка PowerKey

_чтобы ноутбук не выключался по случайному нажатию_

```Shell
sudo nvim /etc/systemd/logind.conf
HandlePowerKey=ignore
HandlePowerKeyLongPress=poweroff

```

## Настройка режима сна и блокировки экрана

_остальные настройки включены в конфигурацию bspwm в этом репозитории_

```Shell
sudo pacman -S i3lock xss-lock

HandleLidSwitch=suspend
HandleLidSwitchDocked=suspend

```

## Яркость экрана

```Shell
sudo pacman -S brightnessctl

```

## Настройка принтеров

```Shell
sudo pacman -S cups hplip system-config-printer gutenprint splix foomatic-db foomatic-db-gutenprint-ppds
sudo systemctl enable --now cups.service

```

## Устройства ввода для X-сервера

```Shell
sudo pacman -S xorg-xinput

```

## Настройка языка (локаль)

```Shell
sudo nvim /etc/locale.gen # раскомментировать нужную локаль
sudo locale-gen

```

## Жесты touchpad

_протестировано на MacBook_

```Shell
sudo pacman -S touchegg
sudo systemctl enable --now touchegg.service

```

## Буфер обмена

```Shell
sudo pacman -S xclip

```

## TLP энергосбережение (для ноутбуков)

```Shell
sudo pacman -S tlp
sudo systemctl enable --now tlp.service

```

## VPN

```Shell
sudo pacman -S openvpn networkmanager-openvpn
sudo pacman -S openconnect networkmanager-openconnect

```

## Программное обеспечение

```Shell

# основной софт
sudo pacman -S \
alacritty \ # терминал
cmatrix \ # скринсейвер матрица
dunst \ # для уведомлений
fastfetch \ # информация о системе в терминале
feh \ # управление обоями рабочего стола
firefox \ # браузер
gvfs gvfs gvfs-afc gvfs-mtp gvfs-smb \ # надстройки thunar сетевые ресурсы и usb
libcanberra \ # звуки системы
lxappearance \ # управление цветовыми схемами
nvim \ # текстовый редактор
nvm \ # nodejs version manager
pavucontrol \ # управление звуком
picom \ # композитор окон
playerctl \ # переключение треков
polkit \ # надстройки thunar сетевые ресурсы и usb
polybar \ # меню бар
postgresql-libs \ # библиотеки postgresql
ranger \ # файловый менеджер с tui
ristretto \ # предпросмотр изображений thunar
rofi \ # меню
sound-theme-freedesktop \ # звуки системы
sxhkd \ # горячие клавиши
thunar \ # файловый менеджер с gui
thunar-volman \ # надстройки thunar сетевые ресурсы и usb
tmux \ # терминальный мультиплексор
udisks2 \ # надстройки thunar сетевые ресурсы и usb
unzip \ # для работы с архивами
xorg-xrandr \ # управление масштабированием и разрешением

# необязательный софт
sudo pacman -S \
breeze \ # цветовая схема и курсоры
calcurse \ # календарь tui
chromium \ # браузер
dbeaver \ # клиент СУБД
evolution evolution-ews \ # почтовый клиент
flameshot \ # создание скриншотов
gdu \ # утилита для контроля / очистки диска
htop \ # монитор ресурсов
libreoffice-still \ # офис
mpv yt-dlp \ # медиаплеер + библиотека для youtube
obsidian \ # заметки obsidian
peek \ # утилита для записи gif
qalculate-gtk \ # калькулятор
remmina freerdp \ # удаленный рабочий стол
telegram-desktop \ # клиент telegram
transmission-gtk \ # торрент клиент
uv \ # управление версиями python и venv

```

## Шрифты

```Shell
sudo pacman -S ttf-nerd-fonts-symbols ttf-nerd-fonts ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-font-awesome ttf-nerd-fonts-symbols papirus-icon-theme materia-gtk-theme

fc-cache -f -v

```

## Цветовая схема приложений/курсора

```Shell
lxappearance

# Theme: Materia-dark
# Cursor: breeze

```
