# Настройки для GNOME

## Расширения

### 1. Установка и настройка расширений
```Shell
sudo pacman -S extension-manager
```

Установить расширения из extensions-list.txt

```Shell
# выгрузить дамп настроек extensions:
dconf dump /org/gnome/shell/extensions/ > extensions-settings.dconf

# загрузить настройки из дампа:
dconf load /org/gnome/shell/extensions/ < extensions-settings.dconf

```
