#!/bin/bash

# =====================[ ZALEETHEME BRUTAL MODE ]===================== #

# Warna
CYAN="\033[1;36m"
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
NC="\033[0m"

# Brutal Shock Intro
printf "${MAGENTA}"
echo "==============================================================="
echo "===================  Z A L E E T H E M E  ====================="
echo "==================  U L T R A  B R U T A L  ==================="
echo "==============================================================="
printf "${NC}"
sleep 0.5

# Brutal Flash
for i in {1..3}; do
    printf "\033[?5h"   # inverse screen flash
    sleep 0.1
    printf "\033[?5l"
    sleep 0.1
done

# Brutal Modern ASCII Banner
echo -e "${CYAN}"
cat << "EOF"
███████╗ █████╗ ██╗     ███╗   ███╗███████╗
██╔════╝██╔══██╗██║     ████╗ ████║██╔════╝
█████╗  ███████║██║     ██╔████╔██║█████╗
██╔══╝  ██╔══██║██║     ██║╚██╔╝██║██╔══╝
██║     ██║  ██║███████╗██║ ╚═╝ ██║███████╗
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
EOF
echo -e "${NC}"

sleep 0.4

# Brutal Teks Muncul Satu-satu
msg="Initializing ZaleeTheme Ultra Brutal Installer..."
for ((i=0; i<${#msg}; i++)); do
    printf "${YELLOW}%s${NC}" "${msg:$i:1}"
    sleep 0.02
done
echo
sleep 0.3

# Brutal Spinner Loading Sebelum Script Utama Jalan
spin='|/-\'
echo -ne "${GREEN}BRUTAL MODE ENGAGED...${NC} "
for i in {1..20}; do
    i=$(( (i+1) %4 ))
    printf "\b${spin:$i:1}"
    sleep 0.08
done
echo -e "\b ${GREEN}[READY]${NC}"

# =================== END OF BRUTAL HEADER ======================= #

# ============================================================
#        ZALEE THEME INSTALLER — ULTRA PREMIUM EDITION
# ============================================================

THEME_URL="https://github.com/zaleegans/theme/releases/download/theme/ZaleeTheme.zip"
PANEL_PATH="/var/www/pterodactyl"
BACKUP_DIR="$PANEL_PATH/theme-backup"

# ---------- COLORS ----------
C0="\033[0m"
C1="\033[1;36m"
C2="\033[1;32m"
C3="\033[1;35m"
CERR="\033[1;31m"

# ---------- TIMESTAMP LOG ----------
log() {
    echo -e "$C1[$(date '+%Y-%m-%d %H:%M:%S')]$C0 $1"
}

# ---------- SPINNER ----------
spinner() {
    local pid=$1
    local spin='|/-\'
    while kill -0 "$pid" 2>/dev/null; do
        for i in {0..3}; do
            echo -ne "   ${C3}${spin:i:1}${C0}\r"
            sleep 0.12
        done
    done
}

# ---------- HEADER ----------
clear
echo -e "$C1───────────────────────────────────────────────"
echo -e "  $C2★ ZALEE THEME INSTALLER — ULTRA PREMIUM ★"
echo -e "$C1───────────────────────────────────────────────$C0"
echo ""

# ---------- PANEL PATH ----------
echo -e "${C2}Lokasi panel [$PANEL_PATH]:${C0}"
read -p "> " input_panel
[ ! -z "$input_panel" ] && PANEL_PATH="$input_panel"

echo ""
echo -e "$C1Pilih Theme:$C0"
echo " [1] Install ZaleeTheme (ULTRA PREMIUM)"
echo " [2] Uninstall / Restore"
echo " [0] Exit"
read -p "Pilihan: " P

case $P in

# ================================
#         INSTALL THEME
# ================================
1)
    log "Menginstall ZaleeTheme..."

    cd /tmp || exit

    log "Downloading theme..."
    curl -L -o ZaleeTheme.zip "$THEME_URL" &
    spinner $!
    echo ""

    if [ ! -f ZaleeTheme.zip ]; then
        log "${CERR}[ERR] Download gagal!${C0}"
        exit 1
    fi

    log "Extracting..."
    unzip -o ZaleeTheme.zip >/dev/null 2>&1 &
    spinner $!
    echo ""

    if [ ! -d assets ]; then
        log "${CERR}[ERR] Folder 'assets/' tidak ditemukan dalam ZIP!${C0}"
        exit 1
    fi

    mkdir -p "$BACKUP_DIR"
    BACKUP_FOLDER="$BACKUP_DIR/assets-$(date +%s)"

    log "Backup assets lama → $BACKUP_FOLDER"
    cp -r "$PANEL_PATH/public/assets" "$BACKUP_FOLDER" >/dev/null 2>&1 & spinner $!
    echo ""

    log "Menginstall theme baru..."
    rm -rf "$PANEL_PATH/public/assets"
    cp -r assets "$PANEL_PATH/public/"
    echo ""

    log "Set permissions..."
    chown -R www-data:www-data "$PANEL_PATH/public/assets"

    log "Clearing cache..."
    cd "$PANEL_PATH"
    php artisan view:clear >/dev/null
    php artisan cache:clear >/dev/null

    echo ""
    log "${C2}DONE! Theme berhasil diinstall.${C0}"
    ;;

# ================================
#         UNINSTALL / RESTORE
# ================================
2)
    log "Mengembalikan theme lama..."

    if [ ! -d "$BACKUP_DIR" ]; then
        log "${CERR}[ERR] Backup tidak ditemukan!${C0}"
        exit 1
    fi

    LATEST_BACKUP=$(ls -td "$BACKUP_DIR"/* | head -1)

    log "Restore dari: $LATEST_BACKUP"
    rm -rf "$PANEL_PATH/public/assets"
    cp -r "$LATEST_BACKUP/assets" "$PANEL_PATH/public/"
    chown -R www-data:www-data "$PANEL_PATH/public/assets"

    log "${C2}Theme berhasil dikembalikan!${C0}"
    ;;

0)
    exit
    ;;

*)
    log "${CERR}Pilihan tidak valid!${C0}"
    ;;
esac
