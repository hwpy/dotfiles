# Развёртывание dotfiles

## Установка GNU Stow

```Shell
sudo pacman -S stow
```

## Клонирование репозитория

```Shell
git clone https://github.com/hwpy/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## Структура

Каждая директория верхнего уровня — это **Stow-пакет**, повторяющий структуру `$HOME`:

| Пакет | Что разворачивает |
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

## Машино-зависимые переменные (`env`)

**Этот шаг нужно выполнить до развёртывания пакетов, использующих переменные окружения** (bspwm, polybar, x11).

```Shell
stow env
cp ~/.config/env/env.template ~/.config/env/env
nvim ~/.config/env/env
```

Шаблон содержит комментарии с подсказками, где взять значения:

- **Мониторы:** `xrandr --listmonitors | awk '{print $4}'`
- **Обои для локскрина:** путь к картинке в `~/.config/wlppr/`
- **Батарея/питание:** `ls /sys/class/power_supply/`
- **Датчик температуры CPU:** `ls /sys/class/hwmon/*/temp*_input`
- **SSH-ключи** прописываются в `~/.ssh/config` (пакет `ssh/`)

Файл `env` в `.gitignore` — у каждой машины свой.

## Развёртывание

```Shell
stow bspwm polybar sxhkd picom dunst rofi
stow nvim zsh_linux tmux kitty
stow ssh x11 colors gtk-3.0 gtk-4.0
stow touchegg fastfetch mpv yazi
# ... добавить нужные пакеты
```

Stow создаёт симлинки из `~/dotfiles/` в `~/`. Чтобы удалить пакет: `stow -D <имя>`.
