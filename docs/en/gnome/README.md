# Settings for GNOME

## Extensions

### 1. Update installed extensions list

```Shell
gnome-extensions list > $HOME/dotfiles/gnome/extensions/extensions-list.txt

```

### 2. Installing and configuring extensions
```Shell
sudo pacman -S extension-manager
```

Install extensions from extensions-list.txt

```Shell
# dump extensions settings:
dconf dump /org/gnome/shell/extensions/ > $HOME/dotfiles/gnome/extensions/extensions-settings.dconf

# load settings from dump:
dconf load /org/gnome/shell/extensions/ < $HOME/dotfiles/gnome/extensions/extensions-settings.dconf

```
