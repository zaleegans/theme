#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

PANEL_PATH_DEFAULT="/var/www/pterodactyl"
TMPDIR="/tmp/theme_installer_$$"
BACKUPDIR="/root/theme_backups"
LOGFILE="/root/zalee-installer.log"

mkdir -p "$TMPDIR" "$BACKUPDIR"
touch "$LOGFILE"

# ==== LINK DOWNLOAD THEME ====
ZALEE_URL="https://github.com/zaleegans/theme/archive/refs/tags/theme.tar.gz"
# ==============================

C="\033[1;36m"; B="\033[1;34m"; Y="\033[1;33m"; R="\033[1;31m"; G="\033[1;32m"; RESET="\033[0m"

log(){ printf "%b\n" "[$(date '+%F %T')] $*" | tee -a "$LOGFILE"; }
err(){ printf "%b\n" "${R}[ERR]${RESET} $*" | tee -a "$LOGFILE" >&2; }
info(){ printf "%b\n" "${B}[INFO]${RESET} $*" | tee -a "$LOGFILE"; }
warn(){ printf "%b\n" "${Y}[WARN]${RESET} $*" | tee -a "$LOGFILE"; }

trap 'rm -rf "$TMPDIR"' EXIT

_require_cmd(){ command -v "$1" >/dev/null 2>&1; }

ensure_dependencies(){
    local need=(curl unzip zip rsync awk tar)
    local to_install=()
    for c in "${need[@]}"; do _require_cmd "$c" || to_install+=("$c"); done
    if [[ ${#to_install[@]} -gt 0 ]]; then
        warn "Missing: ${to_install[*]}"
        apt update -y >/dev/null
        apt install -y "${to_install[@]}" >/dev/null
    fi
}

typewrite(){ local t="$1"; for ((i=0;i<${#t};i++)); do printf "%s" "${t:$i:1}"; sleep "${2:-0.008}"; done; printf "\n"; }

spinner(){
    local pid=$1 msg="$2" delay="${3:-0.08}"
    local frames=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )
    while kill -0 "$pid" 2>/dev/null; do
        for f in "${frames[@]}"; do printf "\r${C}%s${RESET} %s" "$f" "$msg"; sleep "$delay"; done
    done
    printf "\r${G}✓${RESET} %s\n" "$msg"
}

loading_bar(){
    local duration="${1:-3}" length=32
    local st
    st=$(awk "BEGIN {print $duration / $length}")
    echo
    for ((i=0;i<=length;i++)); do
        filled=$(printf "%${i}s" | tr ' ' '█')
        empty=$(printf "%$((length-i))s" | tr ' ' '░')
        printf "\r${C}[${filled}${empty}]${RESET} %3d%%" $((i*100/length))
        sleep "$st"
    done
    echo -e "\n"
}

splash(){
clear
cat <<'EOF'
   ███████╗ █████╗ ██╗     ███╗   ███╗███████╗
   ██╔════╝██╔══██╗██║     ████╗ ████║██╔════╝
   █████╗  ███████║██║     ██╔████╔██║█████╗
   ██╔══╝  ██╔══██║██║     ██║╚██╔╝██║██╔══╝
   ██║     ██║  ██║███████╗██║ ╚═╝ ██║███████╗
   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
EOF
echo
typewrite "   ZALEE THEME — INSTALLER PREMIUM (v3 FIXED)" 0.006
echo
sleep 0.4
}

banner(){
    local text="★ ZALEE THEME INSTALLER — SIMPLE EDITION ★"
    local bar="──────────────────────────────────────────────"
    printf "\033[1m\033[38;2;80;200;220m┌%s┐\033[0m\n" "$bar"
    printf "\033[1m\033[38;2;120;200;140m│  %s  │\033[0m\n" "$text"
    printf "\033[1m\033[38;2;80;200;220m└%s┘\033[0m\n" "$bar"
    echo
}

download(){
    local url="$1" out="$2"
    info "Downloading: $url"
    ( curl -L --retry 3 --retry-delay 1 --fail -o "$out" "$url" ) &
    local pid=$!
    spinner "$pid" "Downloading $(basename "$out")"
    if [[ ! -s "$out" ]]; then err "Download gagal / 404"; return 1; fi
}

backup_dir(){
    local target="$1"
    [[ -e "$target" ]] || { warn "Tidak ada target backup"; return; }
    local ts=$(date +%Y%m%d-%H%M%S)
    local out="$BACKUPDIR/backup_$(basename "$target")_$ts.zip"
    info "Backup: $out"
    (cd "$(dirname "$target")" && zip -rq "$out" "$(basename "$target")")
}

install_zalee(){
    local panel="$1"
    typewrite "${C}Menginstall ZaleeTheme...${RESET}"
    loading_bar 1.5

    local tgz="$TMPDIR/theme.tar.gz"
    download "$ZALEE_URL" "$tgz" || return 1

    tar -xzf "$tgz" -C "$TMPDIR"

    assets_path=$(find "$TMPDIR" -maxdepth 3 -type d \( -iname assets -o -iname public \) | head -n1)
    [[ -d "$assets_path" ]] || { err "Assets tidak ditemukan"; return 1; }

    backup_dir "$panel/public/assets"
    rm -rf "$panel/public/assets"
    cp -a "$assets_path" "$panel/public/assets"

    chown -R www-data:www-data "$panel/public/assets"

    echo -e "${G}✓ ZaleeTheme terpasang!${RESET}"
}

uninstall_theme(){
    local panel="$1"
    echo
    ls -1t "$BACKUPDIR" 2>/dev/null || true
    read -r -p "Restore backup terbaru? (y/N): " yn
    [[ "$yn" =~ ^[Yy] ]] || return

    local latest=$(ls -1t "$BACKUPDIR"/*.zip 2>/dev/null | head -n1)
    [[ -n "$latest" ]] || { err "Tidak ada backup"; return; }

    unzip -q "$latest" -d "$TMPDIR/restore"
    typewrite "${C}Merestore backup...${RESET}"
    loading_bar 2.5
    rsync -a "$TMPDIR/restore/" "$panel/"

    chown -R www-data:www-data "$panel"
    echo -e "${G}Restore selesai!${RESET}"
}

menu(){
    echo -e "${B}Pilih Theme:${RESET}"
    echo -e " ${C}[1]${RESET} Install ZaleeTheme"
    echo -e " ${C}[2]${RESET} Uninstall / Restore"
    echo -e " ${C}[0]${RESET} Exit"
    echo
}

main(){
    ensure_dependencies
    splash
    banner

    read -r -p "Lokasi panel [$PANEL_PATH_DEFAULT]: " panel
    panel="${panel:-$PANEL_PATH_DEFAULT}"

    menu
    read -r -p "Pilihan: " c

    case $c in
        1) install_zalee "$panel" ;;
        2) uninstall_theme "$panel" ;;
        0) exit 0 ;;
        *) err "Pilihan tidak valid" ;;
    esac
}

main
