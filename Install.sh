#!/usr/bin/env bash
# ZALEE THEME INSTALLER – FINAL POLISHED VERSION

set -euo pipefail
IFS=$'\n\t'

# -------------------------------------
#  EFFECTS (BANNER + MATRIX + TYPEWRITER)
# -------------------------------------

typewriter() {
    text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.01
    done
    echo
}

opening_effect() {
    clear
    echo -e "\e[32m"
    for i in {1..40}; do
        printf "%$((RANDOM % 60))s\n" | tr ' ' "$(printf '\\%o' $((RANDOM%93+33)))"
        sleep 0.015
    done
    echo -e "\e[0m"
    sleep 0.4
    clear

    echo -e "\e[36m"
    echo "███████╗ █████╗ ██╗     ███████╗███████╗████████╗██╗  ██╗███████╗███╗   ███╗"
    echo "██╔════╝██╔══██╗██║     ██╔════╝██╔════╝╚══██╔══╝██║  ██║██╔════╝████╗ ████║"
    echo "███████╗███████║██║     █████╗  ███████╗   ██║   ███████║█████╗  ██╔████╔██║"
    echo "╚════██║██╔══██║██║     ██╔══╝  ╚════██║   ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║"
    echo "███████║██║  ██║███████╗███████╗███████║   ██║   ██║  ██║███████╗██║ ╚═╝ ██║"
    echo "╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝"
    echo -e "\e[0m"
    echo
    sleep 0.5

    typewriter "Initializing installer..."
    typewriter "Preparing modules..."
    typewriter "Loading theme engine..."
    sleep 0.4

    echo -ne "\n\e[33mLoading:\e[0m "
    for i in {1..30}; do
        echo -ne "\e[32m▉\e[0m"
        sleep 0.03
    done
    echo -e "\n"
    sleep 0.4
    clear
}

opening_effect

##############################################
# ZALEE FULL EFFECT PACK — PUT AT VERY TOP
##############################################

# Terminal width helper
cols=$(tput cols)

##############################################
# 1. MATRIX RAIN — WIDE
##############################################
matrix_rain() {
    for ((i=0; i<2000; i++)); do
        printf "\033[38;5;$((RANDOM%82+34))m%s\033[0m" "$(printf '\\\\')"
        (( i % cols == 0 )) && printf "\n"
        sleep 0.0005
    done
}

##############################################
# 2. GLITCH SCREEN
##############################################
glitch() {
    for i in {1..40}; do
        printf "\r\033[38;5;$((RANDOM%255))mGL1TCH-$RANDOM\033[0m"
        sleep 0.04
    done
    echo
}

##############################################
# 3. PULSE WAVE (Rainbow pulse)
##############################################
pulse() {
    for i in {1..50}; do
        printf "\033[38;5;$((16 + RANDOM % 200))m████████████████\033[0m\r"
        sleep 0.03
    done
    echo
}

##############################################
# 4. HELLFIRE (Api naik dari bawah)
##############################################
hellfire() {
    for i in {1..25}; do
        printf "\033[1;31m🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\033[0m\n"
        sleep 0.03
    done
}

##############################################
# 5. RGB WALL
##############################################
rgb_wall() {
    for r in {1..25}; do
        for ((i=0; i<cols; i++)); do
            printf "\033[38;5;$((RANDOM%255))m█\033[0m"
        done
        printf "\n"
        sleep 0.01
    done
}

##############################################
# 6. TURBULENCE (Kekacauan layar)
##############################################
turbulence() {
    for i in {1..150}; do
        printf "\033[$((RANDOM%20));$((RANDOM%cols))H\033[38;5;$((RANDOM%255))m#\033[0m"
        sleep 0.002
    done
    printf "\033[0m\n"
}

##############################################
# 7. FIRE WAVE
##############################################
fire() {
    for i in {1..40}; do
        printf "\033[38;5;$((196 + RANDOM%8))m🔥\033[0m"
        (( i % cols == 0 )) && printf "\n"
        sleep 0.003
    done
    echo
}

##############################################
# 8. SCREEN SHAKE
##############################################
shake() {
    for i in {1..15}; do
        printf "\033[2C"; sleep 0.02
        printf "\033[2D"; sleep 0.02
    done
}

##############################################
# 9. LIGHTNING FLASH
##############################################
lightning() {
    for i in {1..4}; do
        printf "\033[1;97m"; printf "%${cols}s" " "; printf "\033[0m\r"
        sleep 0.06
    done
}

##############################################
# 10. NUKE FLASH (WHITE + SHAKE)
##############################################
nuke_flash() {
    printf "\033[1;97m"; printf "%${cols}s" " "; printf "\033[0m\r"
    sleep 0.08
    shake
}

##############################################
# 11. HACKER BOOT SCREEN
##############################################
hacker_boot() {
    msgs=(
        "[BOOT] Initializing ZALEE System..."
        "[OK] CPU Microcode Loaded"
        "[OK] Memory Check Passed"
        "[OK] Loading Kernel Modules"
        "[OK] Mounting File System"
        "[OK] Starting Services"
        "[OK] Ready."
    )
    for m in "${msgs[@]}"; do
        echo -e "\033[38;5;$((RANDOM%50+50))m$m\033[0m"
        sleep 0.15
    done
    echo
}

##############################################
# 12. ZALEE LOGO ROTATE
##############################################
rotate_logo() {
    frames=(
"Z"
"/"
"-"
"\\"
    )
    for i in {1..12}; do
        printf "\r\033[1;36m%s\033[0m" "${frames[$((i % 4))]}"
        sleep 0.1
    done
    echo
}

##############################################
# DONE – ALL EFFECTS LOADED
##############################################

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

    # === FIX: cek folder 'assets' langsung ===
    if [[ ! -d "$TMPDIR/zalee/assets" ]]; then
        err "ZaleeTheme.zip tidak berisi folder 'assets'!"
        exit 1
    fi

    # Backup panel/assets lama
    backup_dir "$panel/public/assets"

    info "Menghapus assets lama..."
    rm -rf "$panel/public/assets"

    info "Memindahkan assets baru..."
    cp -a "$TMPDIR/zalee/assets" "$panel/public/assets"

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
