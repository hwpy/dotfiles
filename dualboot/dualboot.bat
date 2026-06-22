@echo off
if "%1"=="linux" (
    bcdedit /set "{bootmgr}" path \EFI\GRUB\GRUBX64.EFI
) else (
    bcdedit /set "{bootmgr}" path \EFI\MICROSOFT\BOOT\BOOTMGFW.EFI
)
shutdown /r /t 0
