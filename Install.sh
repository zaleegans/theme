#!/usr/bin/env bash
# ZALEE THEME INSTALLER – FINAL POLISHED VERSION

set -euo pipefail
IFS=$'\n\t'

# ------------------------------
# KONFIGURASI
# ------------------------------
PANEL_PATH_DEFAULT="/var/www/pterodactyl"
TMPDIR="/tmp/theme_installer_$$"
BACKUPDIR="/root/theme_backups"

# ZIP URL (SEMUA ZIP SUDAH SESUAI)
ZALEE_URL="https://github.com/user-attachments/files/23604719/ZaleeTheme.zip"
NEBULA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Nebula-main.zip"
ARIX_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/ArixTheme.zip"
REGGED_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Regged.Theme.Pterodactyl.FREE.-.v1.0.zip"
ENIGMA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Enigma_Premium.zip"

# ------------------------------
# UTILITAS (WARNA & HELPERS)
# ------------------------------
BBLUE="\033[1;34m"
BYELLOW="\033[1;33m"
BRED="\033[1;31m"
RESET="\033[0m"

info(){ echo -e "${BBLUE}[INFO]${RESET} $*"; }
warn(){ echo -e "${BYELLOW}[WARN]${RESET} $*"; }
err(){ echo -e "${BRED}[ERR]${RESET} $*"; }
confirm(){ read -r -p "$* (y/N): " yn; [[ "$yn" =~ ^[Yy] ]]; }

trap 'rm -rf "$TMPDIR"' EXIT
mkdir -p "$TMPDIR" "$BACKUPDIR"

download(){
    local url="$1"
    local out="$2"

    if command -v curl >/dev/null; then
        curl -L --fail -o "$out" "$url"
    else
        wget -O "$out" "$url"
    fi
}

backup_dir(){
    local target="$1"
    local ts=$(date +%Y%m%d-%H%M%S)
    local out="$BACKUPDIR/backup_${ts}.zip"

    info "Membuat backup: $out"
    (cd "$(dirname "$target")" && zip -r -q "$out" "$(basename "$target")")
}

# ------------------------------
# INSTALL ZALEE THEME (ASSETS ONLY)
# ------------------------------
install_zalee(){
    local panel="$1"
    local zip="$TMPDIR/ZaleeTheme.zip"

    info "Download ZaleeTheme..."
    download "$ZALEE_URL" "$zip"

    mkdir -p "$TMPDIR/zalee"
    unzip -q "$zip" -d "$TMPDIR/zalee"

    if [[ ! -d "$TMPDIR/zalee/public/assets" ]]; then
        err "ZaleeTheme.zip tidak berisi public/assets!"
        exit 1
    fi

    backup_dir "$panel/public/assets"

    info "Menghapus assets lama..."
    rm -rf "$panel/public/assets"

    info "Memindahkan assets baru..."
    cp -a "$TMPDIR/zalee/public/assets" "$panel/public/assets"

    chown -R www-data:www-data "$panel/public/assets" 2>/dev/null || true

    info "ZaleeTheme berhasil dipasang!"
}

# ------------------------------
# INSTALL FULL THEME
# ------------------------------
install_full(){
    local panel="$1"
    local url="$2"
    local name="$3"

    local zip="$TMPDIR/${name}.zip"
    download "$url" "$zip"

    mkdir -p "$TMPDIR/$name"
    unzip -q "$zip" -d "$TMPDIR/$name"

    backup_dir "$panel"

    info "Menyalin file ke panel..."
    rsync -a "$TMPDIR/$name/" "$panel/"

    chown -R www-data:www-data "$panel" 2>/dev/null || true
    info "$name berhasil dipasang!"
}

# ------------------------------
# UNINSTALL
# ------------------------------
uninstall_theme(){
    echo
    ls -1t "$BACKUPDIR"
    echo

    if ! confirm "Restore backup terbaru?"; then
        warn "Uninstall dibatalkan."
        return
    fi

    local latest=$(ls -1t "$BACKUPDIR"/*.zip | head -n1)
    [[ -z "$latest" ]] && err "Tidak ada backup!" && exit 1

    info "Merestore backup: $latest"
    unzip -q "$latest" -d "$TMPDIR/restore"
    rsync -a "$TMPDIR/restore/" "$panel"
    info "Restore selesai!"
}

# ------------------------------
# MENU
# ------------------------------
menu(){
echo -e "
===========================================
      ${BBLUE}ZALEE THEME INSTALLER v2${RESET}
===========================================

[1] ZaleeTheme (ASSETS ONLY)
[2] Nebula Theme (Full)
[3] ArixTheme (Full)
[4] ReggedTheme (Full)
[5] Enigma Premium (Full)
[6] Uninstall / Restore
[0] Exit
"
}

# ------------------------------
# MAIN
# ------------------------------
main(){
    read -r -p "Masukkan lokasi panel [/var/www/pterodactyl]: " panel
    panel="${panel:-$PANEL_PATH_DEFAULT}"

    if [[ ! -d "$panel" ]]; then
        err "Folder panel tidak ditemukan!"
        exit 1
    fi

    menu
    read -r -p "Pilihan: " ch

    case $ch in
        1) install_zalee "$panel" ;;
        2) install_full "$panel" "$NEBULA_URL" "Nebula" ;;
        3) install_full "$panel" "$ARIX_URL" "ArixTheme" ;;
        4) install_full "$panel" "$REGGED_URL" "ReggedTheme" ;;
        5) install_full "$panel" "$ENIGMA_URL" "EnigmaPremium" ;;
        6) uninstall_theme "$panel" ;;
        0) exit ;;
        *) err "Pilihan tidak valid!" ; exit 1 ;;
    esac
}

main
