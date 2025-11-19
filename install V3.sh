#!/bin/bash


##############################################################
#            ==== BRUTAL COMBO SEQUENCE ====
##############################################################

matrix_rain
glitch "SYSTEM OVERRRIDE"
pulse
hellfire
rgb_wall
turbulence
fire
wave
nuke_flash
rotate_logo
lightning
alarm
shake

##############################################################
#        (Lanjutin script install normal lo setelah ini)
##############################################################
set -e
################## [ ZALEETHEME BRUTAL MODE v4 ] ##################

# Warna
CYAN="\033[1;36m"
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
NC="\033[0m"

printf "${MAGENTA}"
printf "\n==============================================================\n"
printf "🔥  Z A L E E T H E M E   B R U T A L   M O D E   L O A D E D  🔥\n"
printf "==============================================================\n\n"
printf "${NC}"
################## PACK 4 — INSANE BRUTAL MODE ##################

# 💥 Full Screen Pulse (detak brutal)
pulse() {
    for i in {1..8}; do
        printf "\033[48;2;255;0;0m%$(tput cols)s\033[0m\r"
        sleep 0.06
        printf "\033[48;2;0;0;0m%$(tput cols)s\033[0m\r"
        sleep 0.06
    done
    printf "\n"
}

# 🌪 Random Terminal Turbulence (layar keputar acak)
turbulence() {
    for i in {1..20}; do
        printf "\033[%d;%dH⚡" $((RANDOM%20+1)) $((RANDOM%50+1))
        sleep 0.03
    done
    printf "\033[0m\n"
}

# 📡 Distortion Wave (gelombang glitch brutal)
wave() {
    for i in {1..25}; do
        line=$(printf "%*s" $((RANDOM%$(tput cols))) | tr ' ' '~')
        echo -e "\033[35m$line\033[0m"
        sleep 0.02
    done
}

# 💣 Nuclear Blink (kedip super pedih)
nuke_flash() {
    for i in {1..4}; do
        printf "\033[?5h"; sleep 0.04
        printf "\033[?5l"; sleep 0.04
    done
}

# 🧨 Screen Crack (efek layar pecah ASCII)
screen_crack() {
cat << "EOF"
   \  |  /       *CRACK*
 --  ███  --   
   /  |  \  
EOF
}

# 🌈 RGB Slide (warna berjalan seluruh layar)
rgb_slide() {
    width=$(tput cols)
    for i in {1..width}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m "
        sleep 0.005
    done
    printf "\033[0m\n"
}

# 💀 Hellfire ASCII (banner panas)
hellfire() {
cat << "EOF"
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
🔥 H E L L F I R E   M O D E   O N 🔥
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
EOF
}

# 🚨 Terminal Warning Alarm (sirine brutal)
alarm() {
    for i in {1..8}; do
        echo -ne "\007"  
        printf "\033[41m!!! ALERT !!!\033[0m\r"
        sleep 0.1
        printf "\033[43m!!! ALERT !!!\033[0m\r"
        sleep 0.1
    done
    printf "\n"
}

##############################################################
# ==== END PACK 4 — INSANE BRUTAL MODE LOADED 🔥💀 ===========
##############################################################
# === BRUTAL COMBO SEQUENCE ===
matrix_rain
pulse
hellfire
rgb_slide
glitch "SYSTEM OVERRRIDE"
turbulence
fire
wave
nuke_flash
rotate_logo
lightning
alarm
shake
################## PACK 1 BASE FUNCTION ##################

typewrite() {
    text="$1"
    speed="${2:-0.003}"
    for (( i=0; i<${#text}; i++ )); do
        printf "%s" "${text:$i:1}"
        sleep "$speed"
    done
    printf "\n"
}

blink() {
    printf "\033[5m$1\033[0m\n"
}

center() {
    termwidth=$(tput cols)
    padding=$(( (termwidth - ${#1}) / 2 ))
    printf "%${padding}s%s\n" "" "$1"
}

loading_bar() {
    bar="=================================================="
    for i in {1..50}; do
        printf "\r[%-50s] %d%%" "${bar:0:i}" $((i*2))
        sleep 0.03
    done
    printf "\n"
}

spinner() {
    local pid=$!
    local spin='-\|/'
    while kill -0 $pid 2>/dev/null; do
        for i in {0..3}; do
            printf "\r[%c] " "${spin:$i:1}"
            sleep 0.1
        done
    done
    printf "\rDone!\n"
}

################## PACK 2 UPGRADE ##################

matrix_rain() {
    clear
    echo -e "\033[32m"
    for i in {1..200}; do
        printf "%*s\n" $((RANDOM % $(tput cols))) "$(printf "%X" $((RANDOM % 16)))"
        sleep 0.01
    done
    printf "${NC}"
}

glitch() {
    text="$1"
    for i in {1..5}; do
        printf "\r\033[35m%s\033[0m" "$(echo "$text" | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
        sleep 0.05
        printf "\r\033[31m%s\033[0m" "$text"
        sleep 0.05
    done
    printf "\n"
}

rage() {
cat << "EOF"
(╯°□°）╯︵ ┻━┻
┻━┻ ︵ヽ(`Д´)ﾉ︵ ┻━┻
EOF
}

explosion() {
printf "${RED}"
cat << "EOF"
███████╗██╗  ██╗██╗███████╗██╗     ███████╗
██╔════╝██║  ██║██║██╔════╝██║     ██╔════╝
███████╗███████║██║█████╗  ██║     █████╗  
╚════██║██╔══██║██║██╔══╝  ██║     ██╔══╝  
███████║██║  ██║██║███████╗███████╗███████╗
╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚══════╝
EOF
printf "${NC}"
}

beep() {
    for i in {1..5}; do
        echo -ne "\007"
        sleep 0.1
    done
}

shake() {
    for i in {1..10}; do
        printf "\033[2J\033[1;%dH" $((RANDOM % 10))
        echo "⚡ SYSTEM SHAKING ⚡"
        sleep 0.05
    done
}

divider() {
    printf "${MAGENTA}"
    printf "\n==============================================================\n"
    printf "${NC}"
}

################## PACK 3 — ADVANCED BRUTAL EFFECT ##################

# 🔥 Terminal Fire Animation
fire() {
    clear
    for i in {1..40}; do
        echo -e "\033[31m$(tr -dc "▲△" </dev/urandom | head -c $((RANDOM % 50 + 20)))\033[0m"
        sleep 0.03
    done
}

# 🌈 RGB Flood Screen
rgb_flood() {
    for i in {1..20}; do
        printf "\033[48;2;$((RANDOM%256));$((RANDOM%256));$((RANDOM%256))m%$(tput cols)s\033[0m\n"
        sleep 0.03
    done
}

# 💡 LED Running Strip
led() {
    cols=$(tput cols)
    for ((i=1; i<=cols; i++)); do
        printf "\r"
        printf "%${i}s" "💡"
        sleep 0.02
    done
    printf "\n"
}

# 🌀 ASCII Spinning 3D
spin3d() {
    frames=(
        "|"
        "/"
        "─"
        "\\"
    )
    for i in {1..30}; do
        for f in "${frames[@]}"; do
            printf "\r\033[36m3D SPINNING: %s\033[0m" "$f"
            sleep 0.07
        done
    done
    printf "\n"
}

# 🔄 Rotating ZaleeTheme Logo
rotate_logo() {
    frames=(
"Z"
"ZA"
"ZAL"
"ZALE"
"ZALEE"
"ZALEET"
"ZALEETH"
"ZALEETHE"
"ZALEEEEEE"
"ZALEEEEEEE"
    )
    for f in "${frames[@]}"; do
        printf "\r\033[1;35m%s\033[0m" "$f"
        sleep 0.1
    done
    printf "\n"
}

# ⚡ Lightning Flash
lightning() {
    for i in {1..3}; do
        printf "\033[?5h" ; sleep 0.05
        printf "\033[?5l" ; sleep 0.05
    done
}
######################################################################
# === BRUTAL PACK v4 LOADED — INSTALL SCRIPT LANJUT DI BAWAH ===     #
######################################################################
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
echo -e "\033[1;35mMengaktifkan DUGEON MODE...\033[0m"
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
    echo -ne "\033[1;${COLOR}mMODE ACTIVE!!!\033[0m\r"
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
# === PANGGIL SEMUA BRUTAL EFFECT ===
matrix_rain
sleep 0.3
glitch "Zaleetheme Loaded"
sleep 0.3
rgb_flood
sleep 0.2
fire
sleep 0.2
rotate_logo
sleep 0.3
spin3d
sleep 0.3
lightning
sleep 0.2
shake
sleep 0.2

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
