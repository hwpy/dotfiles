# официальные пакеты

```Shell
pacman -Qqen > pkglist-pacman.txt
``````

# пакеты AUR

```Shell
yay -Qm > pkglist-aur.txt
```

# конфиги софтов

```Shell
tar czvf home-config-backup.tar.gz ~/.config ~/.xinitrc ~/.bashrc ~/.zshrc
tar czvf home-bin-backup.tar.gz ~/.local/bin
```

# драйвера
## конфиги драйверов

```Shell
sudo tar czvf etc-backup.tar.gz /etc
```

## сами драйвера

```Shell
lsmod > lsmod-list.txt
```

# сервисы

```Shell
systemctl list-unit-files --state=enabled > enabled-services.txt &&
systemctl list-units --type=service --state=running > running-services.txt &&
awk '/\.service/ {print $1}' enabled-services.txt > enabled-list.txt &&
awk '/\.service/ {print $1}' running-services.txt > running-list.txt &&
sudo xargs -a enabled-list.txt systemctl enable &&
sudo xargs -a running-list.txt systemctl start
```
