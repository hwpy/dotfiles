# Настройки для GNOME

## Расширения

### 1. Обновление списка установленных расширений

```Shell
gnome-extensions list > $HOME/dotfiles/gnome/extensions/extensions-list.txt

```

### 2. Установка и настройка расширений
```Shell
sudo pacman -S extension-manager
```

Установить расширения из extensions-list.txt

```Shell
# выгрузить дамп настроек extensions:
dconf dump /org/gnome/shell/extensions/ > $HOME/dotfiles/gnome/extensions/extensions-settings.dconf

# загрузить настройки из дампа:
dconf load /org/gnome/shell/extensions/ < $HOME/dotfiles/gnome/extensions/extensions-settings.dconf

```
