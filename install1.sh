#!/usr/bin/env bash
# ZALEE THEME INSTALLER — FINAL v3
set -euo pipefail
IFS=$'\n\t'

# --------------------------------
# KONFIGURASI
# --------------------------------
PANEL_PATH_DEFAULT="/var/www/pterodactyl"
TMPDIR="/tmp/theme_installer_$$"
BACKUPDIR="/root/theme_backups"

ZALEE_URL="https://github.com/user-attachments/files/23604719/ZaleeTheme.zip"
NEBULA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Nebula-main.zip"
ARIX_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/ArixTheme.zip"
REGGED_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Regged.Theme.Pterodactyl.FREE.-.v1.0.zip"
ENIGMA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Enigma_Premium.zip"

mkdir -p "$TMPDIR" "$BACKUPDIR"

# --------------------------------
# WARNA
# --------------------------------
C="\033[1;36m"
B="\033[1;34m"
Y="\033[1;33m"
R="\033[1;31m"
G="\033[1;32m"
RESET="\033[0m"

# --------------------------------
# LOG PRINT
# --------------------------------
err(){ echo -e "${R}[ERR]${RESET} $*"; }
info(){ echo -e "${B}[INFO]${RESET} $*"; }

trap 'rm -rf "$TMPDIR"' EXIT

# --------------------------------
# TYPEWRITER ANIMATION
# --------------------------------
typewrite(){
    local text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.01
    done
    echo
}

# --------------------------------
# LOADING BAR — NO BC
# --------------------------------
loading_bar(){
    local duration=${1:-3}
    local length=32
    local sleep_time=$(awk "BEGIN {print $duration / $length}")

    echo
    for ((i=0; i<=length; i++)); do
        filled=$(printf "%${i}s" | tr ' ' '█')
        empty=$(printf "%$((length-i))s" | tr ' ' '░')
        printf "\r${C}[${filled}${empty}]${RESET} %3d%%" $(( i*100/length ))
        sleep "$sleep_time"
    done
    echo -e "\n"
}

# --------------------------------
# BANNER ANIMASI RGB
# --------------------------------
banner(){
    clear
    local text="★ ZALEE THEME INSTALLER — v3 ANIMATED ★"
    local bar="───────────────────────────────────────────────"

    for i in {0..20}; do
        r=$(( (i * 12) % 255 ))
        g=$(( (80 + i * 9) % 255 ))
        b=$(( (200 + i * 7) % 255 ))

        clear
        printf "\033[1m\033[38;2;%d;%d;%dm┌%s┐\033[0m\n" "$r" "$g" "$b" "$bar"
        printf "\033[1m\033[38;2;%d;%d;%dm│  %s  │\033[0m\n" "$r" "$g" "$b" "$text"
        printf "\033[1m\033[38;2;%d;%d;%dm└%s┘\033[0m\n" "$r" "$g" "$b" "$bar"
        sleep 0.03
    done
    echo
}

# --------------------------------
# DOWNLOAD — FIXED, ANTI 404
# --------------------------------
download(){
    local url="$1"
    local out="$2"
    curl -L --fail -o "$out" "$url"
}

# --------------------------------
# BACKUP
# --------------------------------
backup_dir(){
    local target="$1"
    local ts=$(date +%Y%m%d-%H%M%S)
    local out="$BACKUPDIR/backup_$ts.zip"

    info "Membuat backup: $out"
    (cd "$(dirname "$target")" && zip -rq "$out" "$(basename "$target")")
}

# --------------------------------
# INSTALL ZALEE (ASSETS ONLY)
# --------------------------------
install_zalee(){
    local panel="$1"
    local zip="$TMPDIR/ZaleeTheme.zip"

    typewrite "${C}Menginstall ZaleeTheme...${RESET}"
    loading_bar 2

    download "$ZALEE_URL" "$zip"
    unzip -q "$zip" -d "$TMPDIR/zalee"

    if [[ ! -d "$TMPDIR/zalee/public/assets" ]]; then
        err "Zip tidak berisi folder public/assets!"
        exit 1
    fi

    backup_dir "$panel/public/assets"

    rm -rf "$panel/public/assets"
    cp -a "$TMPDIR/zalee/public/assets" "$panel/public/assets"

    chown -R www-data:www-data "$panel/public/assets" || true

    echo -e "${G}✓ ZaleeTheme berhasil dipasang!${RESET}"
}

# --------------------------------
# INSTALL FULL THEME
# --------------------------------
install_full(){
    local panel="$1"
    local url="$2"
    local name="$3"

    typewrite "${C}Menginstall $name...${RESET}"
    loading_bar 3

    local zip="$TMPDIR/$name.zip"

    download "$url" "$zip"
    unzip -q "$zip" -d "$TMPDIR/$name"

    backup_dir "$panel"

    rsync -a "$TMPDIR/$name/" "$panel/"

    chown -R www-data:www-data "$panel" || true

    echo -e "${G}✓ $name berhasil dipasang!${RESET}"
}

# --------------------------------
# UNINSTALL / RESTORE
# --------------------------------
uninstall_theme(){
    echo
    ls -1t "$BACKUPDIR"

    read -r -p "Restore backup terbaru? (y/N): " yn
    [[ "$yn" =~ ^[Yy] ]] || return

    local latest=$(ls -1t "$BACKUPDIR"/*.zip | head -n1)
    unzip -q "$latest" -d "$TMPDIR/restore"

    typewrite "${C}Merestore backup...${RESET}"
    loading_bar 4

    rsync -a "$TMPDIR/restore/" "$panel"

    echo -e "${G}Restore selesai!${RESET}"
}

# --------------------------------
# MENU
# --------------------------------
menu(){
    echo -e "${B}Pilih Theme:${RESET}"
    echo -e " ${C}[1]${RESET} ZaleeTheme (ASSETS)"
    echo -e " ${C}[2]${RESET} Nebula"
    echo -e " ${C}[3]${RESET} ArixTheme"
    echo -e " ${C}[4]${RESET} ReggedTheme"
    echo -e " ${C}[5]${RESET} Enigma Premium"
    echo -e " ${C}[6]${RESET} Uninstall / Restore"
    echo -e " ${C}[0]${RESET} Exit"
    echo
}

# --------------------------------
# MAIN
# --------------------------------
main(){
    banner

    read -r -p "Lokasi panel [$PANEL_PATH_DEFAULT]: " panel
    panel="${panel:-$PANEL_PATH_DEFAULT}"

    menu
    read -r -p "Pilihan: " c

    case $c in
        1) install_zalee "$panel" ;;
        2) install_full "$panel" "$NEBULA_URL" "Nebula" ;;
        3) install_full "$panel" "$ARIX_URL" "ArixTheme" ;;
        4) install_full "$panel" "$REGGED_URL" "ReggedTheme" ;;
        5) install_full "$panel" "$ENIGMA_URL" "EnigmaPremium" ;;
        6) uninstall_theme "$panel" ;;
        0) exit ;;
        *) err "Pilihan tidak valid!" ;;
    esac
}

main
