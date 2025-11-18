#!/usr/bin/env bash
# ZALEE THEME INSTALLER — FINAL v3 (FULL PREMIUM)
set -euo pipefail
IFS=$'\n\t'

# --------------------------------
# KONFIGURASI
# --------------------------------
PANEL_PATH_DEFAULT="/var/www/pterodactyl"
TMPDIR="/tmp/theme_installer_$$"
BACKUPDIR="/root/theme_backups"
LOGFILE="/root/zalee-installer.log"

# Jika mau auto-update installer, set URL raw yang berisi versi atau installer (opsional)
# Contoh: INSTALLER_UPDATE_URL="https://raw.githubusercontent.com/zaleegans/theme/main/install_version.txt"
INSTALLER_UPDATE_URL=""

# OPTIONAL: aktifkan bunyi beep saat proses selesai (0 = mati, 1 = aktif)
SOUND=0

ZALEE_URL="https://github.com/user-attachments/files/23604719/ZaleeTheme.zip"
NEBULA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Nebula-main.zip"
ARIX_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/ArixTheme.zip"
REGGED_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Regged.Theme.Pterodactyl.FREE.-.v1.0.zip"
ENIGMA_URL="https://github.com/zaleegans/ZaleeTheme/releases/download/jembut/Enigma_Premium.zip"

mkdir -p "$TMPDIR" "$BACKUPDIR"
touch "$LOGFILE"

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
# LOG PRINT (ke terminal + file)
# --------------------------------
log(){
    local line="[$(date '+%F %T')] $*"
    printf "%b\n" "$line" | tee -a "$LOGFILE"
}
err(){ printf "%b\n" "${R}[ERR]${RESET} $*" | tee -a "$LOGFILE" >&2; }
info(){ printf "%b\n" "${B}[INFO]${RESET} $*" | tee -a "$LOGFILE"; }
warn(){ printf "%b\n" "${Y}[WARN]${RESET} $*" | tee -a "$LOGFILE"; }

trap 'rm -rf "$TMPDIR"' EXIT

# --------------------------------
# DEPENDENCY CHECK
# --------------------------------
_require_cmd(){
    command -v "$1" >/dev/null 2>&1 || return 1
}
ensure_dependencies(){
    local need=(curl unzip zip rsync awk)
    local to_install=()
    for c in "${need[@]}"; do
        if ! _require_cmd "$c"; then
            to_install+=("$c")
        fi
    done

    if [[ ${#to_install[@]} -gt 0 ]]; then
        warn "Dependencies missing: ${to_install[*]}"
        if [[ $EUID -ne 0 ]]; then
            err "Butuh root untuk menginstall paket: ${to_install[*]}. Tolong jalankan `apt install -y ${to_install[*]}`"
            return 1
        fi
        info "Mencoba install: ${to_install[*]}"
        # Support apt (Debian/Ubuntu) dan yum (CentOS)
        if _require_cmd apt; then
            apt update -y >/dev/null
            apt install -y "${to_install[@]}" >/dev/null || { err "Gagal menginstall paket via apt"; return 1; }
        elif _require_cmd yum; then
            yum install -y "${to_install[@]}" >/dev/null || { err "Gagal menginstall paket via yum"; return 1; }
        else
            err "Package manager tidak ditemukan, install manual: ${to_install[*]}"
            return 1
        fi
    fi

    # pv optional (lebih baik jika ada)
    if _require_cmd pv; then
        info "pv tersedia — Mode Pro: progress lebih real"
    fi
    return 0
}

# --------------------------------
# TYPEWRITER ANIMATION
# --------------------------------
typewrite(){
    local text="$1"
    local delay="${2:-0.008}"
    for ((i=0; i<${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep "$delay"
    done
    printf "\n"
}

# --------------------------------
# SPINNER 3D (premium)
# --------------------------------
spinner(){
    # usage: some_command & spinner $! "Downloading..."
    local pid=$1
    local msg="${2:-Processing}"
    local delay="${3:-0.08}" # default delay; smaller = faster
    local frames=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )
    while kill -0 "$pid" 2>/dev/null; do
        for f in "${frames[@]}"; do
            printf "\r${C}%s${RESET} %s" "$f" "$msg"
            sleep "$delay"
        done
    done
    wait "$pid" 2>/dev/null || true
    printf "\r${G}✓${RESET} %s\n" "$msg"
}

# --------------------------------
# LOADING BAR — NO BC (tetap seperti aslinya)
# --------------------------------
loading_bar(){
    local duration=${1:-3}
    local length=32
    local sleep_time
    # use awk for float division (available)
    sleep_time=$(awk "BEGIN {print $duration / $length}")
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
# BANNER ANIMASI RGB + Splash big ASCII
# --------------------------------
splash(){
    clear
    # big ASCII logo (compact) — premium
    cat <<'EOF'
   ███████╗ █████╗ ██╗     ███╗   ███╗███████╗
   ██╔════╝██╔══██╗██║     ████╗ ████║██╔════╝
   █████╗  ███████║██║     ██╔████╔██║█████╗
   ██╔══╝  ██╔══██║██║     ██║╚██╔╝██║██╔══╝
   ██║     ██║  ██║███████╗██║ ╚═╝ ██║███████╗
   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
EOF
    echo
    typewrite "   ZALEE THEME — INSTALLER PREMIUM (v3)" 0.006
    echo
    sleep 0.6
}

banner(){
    # animated RGB frame (kept small and fast)
    local text="★ ZALEE THEME INSTALLER — v3 ANIMATED ★"
    local bar="───────────────────────────────────────────────"
    for i in {0..18}; do
        local r=$(( (i * 10 + 30) % 255 ))
        local g=$(( (60 + i * 7) % 255 ))
        local b=$(( (160 + i * 5) % 255 ))
        printf "\033[1m\033[38;2;%d;%d;%dm┌%s┐\033[0m\n" "$r" "$g" "$b" "$bar"
        printf "\033[1m\033[38;2;%d;%d;%dm│  %s  │\033[0m\n" "$r" "$g" "$b" "$text"
        printf "\033[1m\033[38;2;%d;%d;%dm└%s┘\033[0m\n" "$r" "$g" "$b" "$bar"
        sleep 0.02
        printf "\033[1A\033[1A\033[1A" # move cursor up to animate in place
    done
    # final print (stable)
    printf "\033[1m\033[38;2;80;200;220m┌%s┐\033[0m\n" "$bar"
    printf "\033[1m\033[38;2;120;200;140m│  %s  │\033[0m\n" "$text"
    printf "\033[1m\033[38;2;80;200;220m└%s┘\033[0m\n" "$bar"
    echo
}

# --------------------------------
# DOWNLOAD — FIXED, ANTI 404, with spinner
# --------------------------------
download(){
    local url="$1"
    local out="$2"

    # ensure curl exists
    if ! _require_cmd curl; then
        err "curl tidak terinstall. Install dulu (apt install -y curl) lalu jalankan ulang."
        exit 1
    fi

    info "Downloading: $url"
    # run curl in background and show spinner
    ( curl -L -H "User-Agent: Mozilla/5.0" --fail -o "$out" "$url" ) &
    local pid=$!
    spinner "$pid" "Downloading $(basename "$out")" 0.06
    # after download, check file
    if [[ ! -s "$out" ]]; then
        err "File download kosong atau gagal: $out"
        return 1
    fi
    return 0
}

# --------------------------------
# BACKUP
# --------------------------------
backup_dir(){
    local target="$1"
    if [[ ! -e "$target" ]]; then
        warn "Tidak ada target backup: $target (melewati backup)"
        return 0
    fi
    local ts
    ts=$(date +%Y%m%d-%H%M%S)
    local out="$BACKUPDIR/backup_$(basename "$target")_$ts.zip"
    info "Membuat backup: $out"
    (cd "$(dirname "$target")" && zip -rq "$out" "$(basename "$target")")
    info "Backup tersimpan: $out"
}

# --------------------------------
# INSTALL ZALEE (ASSETS ONLY)
# --------------------------------
install_zalee(){
    local panel="$1"
    if [[ ! -d "$panel" ]]; then
        err "Folder panel tidak ditemukan: $panel"
        return 1
    fi

    local zip="$TMPDIR/ZaleeTheme.zip"
    typewrite "${C}Menginstall ZaleeTheme...${RESET}"
    loading_bar 1.6

    if ! download "$ZALEE_URL" "$zip"; then
        err "Download ZaleeTheme gagal. Cek URL atau network."
        return 1
    fi

    # verify zip integrity quickly (unzip -t)
    if ! unzip -tq "$zip" >/dev/null 2>&1; then
        err "File ZIP korup atau tidak valid."
        return 1
    fi

    unzip -q "$zip" -d "$TMPDIR/zalee"

    # find assets path (support multiple zip layouts)
    local assets_path
    assets_path=$(find "$TMPDIR/zalee" -type d -iname "public" -o -iname "assets" 2>/dev/null | head -n1 || true)
    if [[ -z "$assets_path" ]]; then
        # fallback: try expected path
        assets_path="$TMPDIR/zalee/public/assets"
    fi

    if [[ ! -d "$assets_path" ]]; then
        err "Folder assets tidak ditemukan di dalam ZIP (cari: $assets_path)"
        return 1
    fi

    backup_dir "$panel/public/assets"

    # copy with pv if available to show real progress
    if _require_cmd pv && [[ -d "$assets_path" ]]; then
        info "Menyalin assets (dengan progress pv)..."
        # tar-stream copy to preserve permissions and show pv
        (cd "$assets_path" && tar -cf - .) | pv -s $(du -sb "$assets_path" | awk '{print $1}') | (cd "$panel/public" && tar -xpf -) >/dev/null 2>&1
    else
        info "Menyalin assets..."
        rm -rf "$panel/public/assets"
        cp -a "$assets_path" "$panel/public/assets"
    fi

    chown -R www-data:www-data "$panel/public/assets" || true

    echo -e "${G}✓ ZaleeTheme berhasil dipasang!${RESET}"
    [[ $SOUND -ne 0 ]] && printf '\a' || true
}

# --------------------------------
# INSTALL FULL THEME
# --------------------------------
install_full(){
    local panel="$1"
    local url="$2"
    local name="$3"

    if [[ ! -d "$panel" ]]; then
        err "Folder panel tidak ditemukan: $panel"
        return 1
    fi

    typewrite "${C}Menginstall $name...${RESET}"
    loading_bar 2.2

    local zip="$TMPDIR/$name.zip"
    if ! download "$url" "$zip"; then
        err "Download $name gagal."
        return 1
    fi

    if ! unzip -tq "$zip" >/dev/null 2>&1; then
        err "Zip $name korup atau tidak valid."
        return 1
    fi

    rm -rf "$TMPDIR/$name"
    mkdir -p "$TMPDIR/$name"
    unzip -q "$zip" -d "$TMPDIR/$name"

    backup_dir "$panel"

    # rsync with progress (use pv if available)
    if _require_cmd pv && _require_cmd rsync; then
        info "Sync files (pv + rsync)"
        # create tar and stream to rsync (approx progress)
        (cd "$TMPDIR/$name" && tar -cf - .) | pv -s $(du -sb "$TMPDIR/$name" | awk '{print $1}') | (cd "$panel" && tar -xpf -) >/dev/null 2>&1
    else
        info "Sync files (rsync)"
        rsync -a --delete "$TMPDIR/$name/" "$panel/"
    fi

    chown -R www-data:www-data "$panel" || true

    echo -e "${G}✓ $name berhasil dipasang!${RESET}"
    [[ $SOUND -ne 0 ]] && printf '\a' || true
}

# --------------------------------
# UNINSTALL / RESTORE
# --------------------------------
uninstall_theme(){
    echo
    ls -1t "$BACKUPDIR" 2>/dev/null || true

    read -r -p "Restore backup terbaru? (y/N): " yn
    [[ "$yn" =~ ^[Yy] ]] || return

    local latest
    latest=$(ls -1t "$BACKUPDIR"/*.zip 2>/dev/null | head -n1 || true)
    if [[ -z "$latest" ]]; then
        err "Tidak ada backup yang ditemukan."
        return 1
    fi

    unzip -q "$latest" -d "$TMPDIR/restore"
    typewrite "${C}Merestore backup...${RESET}"
    loading_bar 3.2

    rsync -a "$TMPDIR/restore/" "$panel"
    chown -R www-data:www-data "$panel" || true

    echo -e "${G}Restore selesai!${RESET}"
    [[ $SOUND -ne 0 ]] && printf '\a' || true
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
# AUTO-UPDATE (stub, non-intrusive)
# --------------------------------
check_update(){
    if [[ -z "$INSTALLER_UPDATE_URL" ]]; then
        return 0
    fi
    if ! _require_cmd curl; then
        return 0
    fi
    # expects remote file containing a version string or URL; non-fatal
    local remote
    remote=$(curl -fsSL "$INSTALLER_UPDATE_URL" 2>/dev/null || true)
    if [[ -n "$remote" && "$remote" != "$(cat "$LOGFILE" 2>/dev/null | tail -n1 || true)" ]]; then
        warn "Update installer ditemukan (non-auto). Remote: $remote"
        # don't auto-replace — just notify
    fi
}

# --------------------------------
# MAIN
# --------------------------------
main(){
    ensure_dependencies || { err "Dependencies tidak terpenuhi. Install manual lalu jalankan ulang."; exit 1; }

    splash
    banner
    check_update

    read -r -p "Lokasi panel [$PANEL_PATH_DEFAULT]: " panel
    panel="${panel:-$PANEL_PATH_DEFAULT}"

    # basic permission check
    if [[ ! -d "$panel" ]]; then
        warn "Folder panel tidak ditemukan: $panel"
        read -r -p "Buat folder ini sekarang? (y/N): " yn
        if [[ "$yn" =~ ^[Yy] ]]; then
            mkdir -p "$panel"
            info "Folder dibuat: $panel"
        else
            err "Tidak ada panel. Exit."
            exit 1
        fi
    fi

    menu
    read -r -p "Pilihan: " c

    case $c in
        1) install_zalee "$panel" ;;
        2) install_full "$panel" "$NEBULA_URL" "Nebula" ;;
        3) install_full "$panel" "$ARIX_URL" "ArixTheme" ;;
        4) install_full "$panel" "$REGGED_URL" "ReggedTheme" ;;
        5) install_full "$panel" "$ENIGMA_URL" "EnigmaPremium" ;;
        6) uninstall_theme "$panel" ;;
        0) exit 0 ;;
        *) err "Pilihan tidak valid!" ;;
    esac
}

main
