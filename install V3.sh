#!/bin/bash

THEME_URL="https://github.com/zaleegans/theme/releases/download/theme/ZaleeTheme.zip"
PANEL_PATH="/var/www/pterodactyl"

echo "Lokasi panel [$PANEL_PATH]:"
read -p "> " input_panel
if [ ! -z "$input_panel" ]; then
    PANEL_PATH="$input_panel"
fi

echo ""
echo "Pilih Theme:"
echo " [1] Install ZaleeTheme"
echo " [2] Uninstall / Restore"
echo " [0] Exit"
read -p "Pilihan: " P

BACKUP_DIR="$PANEL_PATH/theme-backup"

case $P in

1)
    echo ">>> Menginstall ZaleeTheme..."

    cd /tmp || exit

    echo "[INFO] Downloading theme..."
    curl -L -o ZaleeTheme.zip "$THEME_URL"

    if [ ! -f ZaleeTheme.zip ]; then
        echo "[ERR] Download gagal!"
        exit 1
    fi

    unzip -o ZaleeTheme.zip

    if [ ! -d assets ]; then
        echo "[ERR] Folder 'assets/' tidak ditemukan di dalam ZIP!"
        exit 1
    fi

    echo "[INFO] Backup assets lama..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$PANEL_PATH/public/assets" "$BACKUP_DIR/assets-$(date +%s)"

    echo "[INFO] Menginstall theme..."
    rm -rf "$PANEL_PATH/public/assets"
    cp -r assets "$PANEL_PATH/public/"

    echo "[INFO] Set izin..."
    chown -R www-data:www-data "$PANEL_PATH/public/assets"

    echo "[INFO] Clear cache..."
    cd "$PANEL_PATH"
    php artisan view:clear
    php artisan cache:clear

    echo ""
    echo ">>> DONE! Theme berhasil diinstall."
;;

2)
    echo ">>> Mengembalikan theme lama..."

    if [ ! -d "$BACKUP_DIR" ]; then
        echo "[ERR] Backup tidak ditemukan!"
        exit 1
    fi

    LATEST_BACKUP=$(ls -td "$BACKUP_DIR"/* | head -1)

    echo "Restore dari: $LATEST_BACKUP"

    rm -rf "$PANEL_PATH/public/assets"
    cp -r "$LATEST_BACKUP/assets" "$PANEL_PATH/public/"

    chown -R www-data:www-data "$PANEL_PATH/public/assets"

    echo ">>> Theme berhasil dikembalikan!"
;;

0)
    exit
;;

*)
    echo "Pilihan tidak valid!"
;;

esac
