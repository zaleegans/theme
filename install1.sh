#!/bin/bash

# ============================================
#  ZaleeTheme Installer
#  Clean, Animated, C-Style Structure
# ============================================

# Colors
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"

# Spinner Animation
spinner() {
    local pid=$!
    local delay=0.12
    local spin='-\|/'

    while kill -0 $pid 2>/dev/null; do
        for i in {0..3}; do
            printf "\r${CYAN}[*]${RESET} ${spin:$i:1}"
            sleep $delay
        done
    done
    printf "\r${GREEN}[✓]${RESET}"
}

# Step Function (looks like C function style)
step() {
    echo -e "${YELLOW}==> $1...${RESET}"
}

# --------------------------------------------
#  Steps
# --------------------------------------------

check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}[ERROR] Jalankan sebagai ROOT!${RESET}"
        exit 1
    fi
}

download_theme() {
    step "Mengunduh theme"
    curl -sL "https://raw.githubusercontent.com/zaleegans/theme/main/ZaleeTheme.zip" -o ZaleeTheme.zip &
    spinner
    echo ""
}

extract_theme() {
    step "Mengekstrak file"
    unzip -o ZaleeTheme.zip -d /var/www/pterodactyl/public/ &
    spinner
    echo ""
}

clear_cache() {
    step "Membersihkan cache Laravel"
    cd /var/www/pterodactyl || exit
    php artisan config:clear &>/dev/null &
    spinner
    echo ""

    php artisan view:clear &>/dev/null &
    spinner
    echo ""

    php artisan cache:clear &>/dev/null &
    spinner
    echo ""
}

finish() {
    echo -e "\n${GREEN}[✓] Theme berhasil dipasang!${RESET}"
    echo -e "${CYAN}Silakan refresh panel Anda.${RESET}"
}

# --------------------------------------------
#  Main Execution Flow
# --------------------------------------------

check_root
download_theme
extract_theme
clear_cache
finish
