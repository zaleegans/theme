#!/bin/bash
set -e

echo -e "\n\033[1;91m==========================\033[0m"
echo -e "\033[1;91m   BRUTAL INSTALL MODE     \033[0m"
echo -e "\033[1;91m==========================\033[0m\n"

echo "[ BRUTAL ] Memulai mode brutal... SEMUA HAMBATAN AKAN DIHANCURKAN 🔥"

echo "[ BRUTAL ] Membersihkan kunci APT..."
rm -f /var/lib/apt/lists/lock || true
rm -f /var/lib/dpkg/lock || true
rm -f /var/lib/dpkg/lock-frontend || true
rm -f /var/cache/apt/archives/lock || true
dpkg --configure -a || true

echo "[ BRUTAL ] Update & upgrade sistem..."
apt update -y --fix-missing
apt upgrade -y || true

echo "[ BRUTAL ] Install semua fitur terminal (TANPA fastfetch)..."
apt install -y \
    git curl wget nano zip unzip jq htop tmux screen neofetch ncdu \
    zsh fonts-powerline

# ======================================
#      FIX: TIDAK ADA FASTFETCH SAMA SEKALI
# ======================================

echo "[ BRUTAL ] Set warna dan locale..."
export TERM=xterm-256color
echo "export TERM=xterm-256color" >> ~/.bashrc

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
echo "export LANG=en_US.UTF-8" >> ~/.bashrc
echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc

echo "[ BRUTAL ] Install Oh-My-Zsh..."
if [ ! -d "/root/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh
fi

sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~/.zshrc || true

echo -e "\n\033[1;92m[ BRUTAL ] SELESAI TANPA ERROR 🔥🔥🔥\033[0m"
clear

# ===================== JEDAG JEDUG MODE =====================
echo -e "\033[1;35mMengaktifkan JEDAG JEDUG MODE...\033[0m"
sleep 0.3

# Efek lampu kedip jedag-jedug
for i in {1..6}; do
    printf "\033[?5h"   # flash
    sleep 0.07
    printf "\033[?5l"   # unflash
    sleep 0.07
done

# ASCII geter brutal
clear
for i in {1..3}; do
    echo -e "\033[1;36m"
    echo "██╗███╗   ███╗███████╗██╗   ██╗"
    echo "██║████╗ ████║██╔════╝██║   ██║"
    echo "██║██╔████╔██║█████╗  ██║   ██║"
    echo "██║██║╚██╔╝██║██╔══╝  ██║   ██║"
    echo "██║██║ ╚═╝ ██║███████╗╚██████╔╝"
    echo "╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ "
    echo -e "\033[0m"
    sleep 0.12
    clear
done

# Jedag Jedug RGB Intro
for i in {1..20}; do
    COLOR=$((31 + (RANDOM % 7)))
    echo -ne "\033[1;${COLOR}mJEDAG JEDUG MODE ACTIVE!!!\033[0m\r"
    sleep 0.05
done
echo
echo -e "\033[1;32m[ READY ] Terminal siap GETER 💥⚡🔥\033[0m"
echo

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
echo "===================  J E M B U T E R S S   ====================="
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
#        TEMP ZAL INSTALLER — ULTRA PREMIUM EDITION
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
echo -e "  $C2★ JEMBUT INSTALLER — ULTRA PREMIUM ★"
echo -e "$C1───────────────────────────────────────────────$C0"
echo ""

# ---------- PANEL PATH ----------
echo -e "${C2}Lokasi panel [$PANEL_PATH]:${C0}"
read -p "> " input_panel
[ ! -z "$input_panel" ] && PANEL_PATH="$input_panel"

echo ""
echo -e "$C1Pilih Theme:$C0"
echo " [1] Install JEMBUT (ULTRA PREMIUM)"
echo " [2] Uninstall / Restore"
echo " [0] Exit"
read -p "Pilihan: " P

case $P in

# ================================
#         INSTALL THEME
# ================================
1)
    log "Menginstall JEMBUT..."

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
