#!/bin/bash
# dualboot.sh - быстрый переключатель ОС в EFI dualboot (Arch + Windows)
# Использование: ./dualboot.sh [win|linux]

BOOT_WIN=0001    # Windows Boot Manager (из efibootmgr)
BOOT_LINUX=0003  # GRUB (Arch Linux)

case "$1" in
    win|windows)
        echo "🔄 Перезагрузка в Windows..."
        sudo efibootmgr --bootnext "$BOOT_WIN"
        sudo reboot
        ;;
    linux|arch)
        echo "🔄 Перезагрузка в Arch Linux (GRUB)..."
        sudo efibootmgr --bootnext "$BOOT_LINUX"
        sudo reboot
        ;;
    status)
        echo "=== Текущая UEFI конфигурация ==="
        sudo efibootmgr
        ;;
    *)
        echo "Использование: $0 {win|linux|status}"
        echo "  win     - перезагрузка в Windows"
        echo "  linux   - перезагрузка в Arch Linux"
        echo "  status  - показать efibootmgr"
        exit 1
        ;;
esac
