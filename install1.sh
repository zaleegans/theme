#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

### =========[ STYLE ]========= ###
B="\033[1;34m"
C="\033[1;36m"
G="\033[1;32m"
Y="\033[1;33m"
R="\033[1;31m"
RESET="\033[0m"

### =========[ CONFIG ]========= ###
PANEL_PATH_DEFAULT="/var/www/pterodactyl"
TMPDIR="/tmp/theme_installer_$$"
BACKUPDIR="/root/theme_backups"

mkdir -p "$TMPDIR" "$BACKUPDIR"

### =========[ URL THEME ]========= ###
ZALEE_URL="https://github.com/user-attachments/files/23604719/ZaleeTheme.zip"
NEBULA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Nebula-main.zip"
ARIX_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/ArixTheme.zip"
REGGED_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Regged.Theme.Pterodactyl.FREE.-.v1.0.zip"
ENIGMA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Enigma_Premium.zip"

### =========[ FUNCTIONS ]========= ###
info(){ echo -e "${B}[INFO]${RESET} $*"; }
warn(){ echo -e "${Y}[WARN]${RESET} $*"; }
err(){ echo -e "${R}[ERROR]${RESET} $*" >&2; }

confirm(){
    read -r -p "$* [y/N]: " yn
    [[ "$yn" =~ ^[Yy] ]]
}

cleanup(){ rm -rf "$TMPDIR"; }
trap cleanup EXIT

download(){
    local url="$1" out="$2"
    curl -sSL --fail -o "$out" "$url" || {
        err "Gagal download dari $url"
        exit 1
    }
}

backup_dir(){
    local target="$1"
    [[ ! -e "$target" ]] && { warn "Tidak ada backup untuk $target"; return; }
    local ts=$(date +%Y%m%d-%H%M%S)
    local out="$BACKUPDIR/$(basename "$target")_$ts.zip"
    info "Backup → $out"
    (cd "$(dirname "$target")" && zip -qr "$out" "$(basename "$target")")
}

### =========[ INSTALL ZALEE (ASSETS ONLY) ]========= ###
install_zalee(){
    local panel="$1"
    local zip="$TMPDIR/ZaleeTheme.zip"

    info "Download ZaleeTheme..."
    download "$ZALEE_URL" "$zip"

    mkdir -p "$TMPDIR/zalee"
    unzip -q "$zip" -d "$TMPDIR/zalee"

    if [[ ! -d "$TMPDIR/zalee/assets" ]]; then
        err "Zip Zalee TIDAK berisi folder assets!"
        exit 1
    fi

    backup_dir "$panel/public/assets"

    info "Hapus assets lama..."
    rm -rf "$panel/public/assets"

    info "Pindahkan assets baru..."
    cp -a "$TMPDIR/zalee/assets" "$panel/public/assets"

    chown -R www-data:www-data "$panel/public/assets" || true
    info "${G}ZaleeTheme berhasil dipasang!${RESET}"
}

### =========[ INSTALL FULL THEME ]========= ###
install_full(){
    local panel="$1" url="$2" name="$3"
    local zip="$TMPDIR/${name}.zip"

    info "Download $name..."
    download "$url" "$zip"

    mkdir -p "$TMPDIR/$name"
    unzip -q "$zip" -d "$TMPDIR/$name"

    backup_dir "$panel"

    info "Menyalin file ke panel..."
    rsync -a --delete "$TMPDIR/$name/" "$panel/"

    chown -R www-data:www-data "$panel" || true
    info "${G}$name berhasil dipasang!${RESET}"
}

### =========[ UNINSTALL / RESTORE ]========= ###
uninstall_theme(){
    info "Daftar backup:"
    ls -1t "$BACKUPDIR" || true

    read -r -p "Masukkan file ZIP backup untuk restore: " zipfile
    [[ ! -f "$zipfile" ]] && { err "Backup tidak ditemukan!"; exit 1; }

    mkdir -p "$TMPDIR/restore"
    unzip -q "$zipfile" -d "$TMPDIR/restore"
    rsync -a --delete "$TMPDIR/restore/" "$PANEL_PATH"
    info "${G}Restore selesai!${RESET}"
}

### =========[ MENU ]========= ###
menu(){
cat <<EOF

${C}┌──────────────────────────────────────────────┐
│         ★ ZALEETHEME — AUTO INSTALLER ★         │
└──────────────────────────────────────────────┘${RESET}

 Lokasi Panel : ${G}$PANEL_PATH${RESET}

 ${C}[1]${RESET} Install ZaleeTheme (assets only)
 ${C}[2]${RESET} Install Nebula (full)
 ${C}[3]${RESET} Install ArixTheme (full)
 ${C}[4]${RESET} Install ReggedTheme (full)
 ${C}[5]${RESET} Install Enigma Premium (full)
 ${C}[6]${RESET} Uninstall Theme / Restore
 ${C}[0]${RESET} Exit

EOF
}

### =========[ MAIN ]========= ###
read -r -p "Lokasi Panel (default: $PANEL_PATH_DEFAULT): " PANEL_PATH
PANEL_PATH="${PANEL_PATH:-$PANEL_PATH_DEFAULT}"

menu
read -r -p "Pilih menu [0-6]: " choice

case $choice in
    1) install_zalee "$PANEL_PATH" ;;
    2) install_full "$PANEL_PATH" "$NEBULA_URL" "Nebula" ;;
    3) install_full "$PANEL_PATH" "$ARIX_URL" "ArixTheme" ;;
    4) install_full "$PANEL_PATH" "$REGGED_URL" "ReggedTheme" ;;
    5) install_full "$PANEL_PATH" "$ENIGMA_URL" "EnigmaPremium" ;;
    6) uninstall_theme ;;
    0) exit 0 ;;
    *) echo -e "${R}Salah pilih njing!${RESET}" ;;
esac

echo -e "${G}Selesai.${RESET}"
