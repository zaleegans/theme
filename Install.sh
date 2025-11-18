#!/bin/bash

# ==============================
#     ZaleeTheme Installer
# ==============================

# Warna
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

clear

echo -e "${CYAN}"
echo "=========================================="
echo "        ZaleeTheme - Theme Installer       "
echo "=========================================="
echo -e "${RESET}"

echo -e "${YELLOW}Pilih Theme yang ingin kamu install:${RESET}"
echo ""
echo "  1) ZaleeTheme"
echo "  2) Nebula"
echo "  3) ArixTheme"
echo "  4) ReggedTheme"
echo "  5) Enigma Premium"
echo "  6) Uninstall Theme"
echo ""

read -p "Masukkan pilihan (1-6): " pilihan

# URL FILE THEME
ZALEE="https://github.com/user-attachments/files/23604719/ZaleeTheme.zip"
NEBULA="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Nebula-main.zip"
ARIX="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/ArixTheme.zip"
REGGED="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Regged.Theme.Pterodactyl.FREE.-.v1.0.zip"
ENIGMA="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Enigma_Premium.zip"

PANEL="/var/www/pterodactyl"

install_theme() {
    THEME_URL=$1
    THEME_NAME=$2

    echo -e "${CYAN}Mengunduh $THEME_NAME ...${RESET}"
    curl -L "$THEME_URL" -o theme.zip

    echo -e "${CYAN}Mengekstrak theme...${RESET}"
    unzip -o theme.zip -d "$PANEL/public/"

    echo -e "${GREEN}Theme $THEME_NAME berhasil terpasang!${RESET}"
    rm -f theme.zip
}

uninstall_theme() {
    echo -e "${CYAN}Menghapus theme...${RESET}"
    rm -rf $PANEL/public/assets
    mkdir $PANEL/public/assets

    echo -e "${GREEN}Theme berhasil dihapus dan dikembalikan ke default.${RESET}"
}

case $pilihan in
    1)
        install_theme "$ZALEE" "ZaleeTheme"
        ;;
    2)
        install_theme "$NEBULA" "Nebula Theme"
        ;;
    3)
        install_theme "$ARIX" "ArixTheme"
        ;;
    4)
        install_theme "$REGGED" "ReggedTheme"
        ;;
    5)
        install_theme "$ENIGMA" "Enigma Premium"
        ;;
    6)
        uninstall_theme
        ;;
    *)
        echo -e "${RED}Pilihan tidak valid!${RESET}"
        ;;
esac

echo -e "${GREEN}Selesai.${RESET}"
