#!/usr/bin/env bash
# ZaleeTheme — ULTRA PREMIUM Installer
# Features: ASCII logo, arrow-menu, spinner, progress bar, auto-detect panel,
# backup, integrity check, rollback, stealth/gold mode, beep, logging.
set -euo pipefail
IFS=$'\n\t'

### ---------- CONFIG ----------
THEME_URL="https://github.com/zaleegans/theme/releases/download/theme/ZaleeTheme.zip"
TMPDIR="/tmp/zalee_install_$$"
ZIPNAME="ZaleeTheme.zip"
ZIPPATH="$TMPDIR/$ZIPNAME"
EXTRACTDIR="$TMPDIR/extract"
BACKUPDIR="/root/zalee_backups"
LOGFILE="/root/zalee_installer.log"
SOUND=1   # 1 = beep on success, 0 = silent
STEALTH=0 # 0 = normal, 1 = stealth (dark/gold)
# candidate panel paths for autodetect
CANDIDATES=("/var/www/pterodactyl" "/var/www/panel" "/srv/pterodactyl" "/usr/share/nginx/html/pterodactyl")

mkdir -p "$TMPDIR" "$BACKUPDIR"
: >"$LOGFILE"

log(){ echo "[$(date '+%F %T')] $*" | tee -a "$LOGFILE"; }

### ---------- COLORS ----------
C_RESET="\033[0m"
C_B="\033[1;34m"
C_C="\033[1;36m"
C_G="\033[1;32m"
C_Y="\033[1;33m"
C_R="\033[1;31m"
C_MAG="\033[1;35m"
C_GOLD="\033[38;5;220m"

if [[ $STEALTH -eq 1 ]]; then
  HDR_COLOR="$C_GOLD"
  ACCENT="$C_GOLD"
else
  HDR_COLOR="$C_C"
  ACCENT="$C_MAG"
fi

### ---------- ASCII LOGO ----------
logo(){
cat <<'EOF'
 ███████╗ █████╗ ██╗     ███╗   ███╗███████╗
 ██╔════╝██╔══██╗██║     ████╗ ████║██╔════╝
 █████╗  ███████║██║     ██╔████╔██║█████╗
 ██╔══╝  ██╔══██║██║     ██║╚██╔╝██║██╔══╝
 ██║     ██║  ██║███████╗██║ ╚═╝ ██║███████╗
 ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
EOF
}

### ---------- UI helpers ----------
clear_line(){ printf "\r\033[K"; }
spinner(){
  local pid=$1 msg="${2:-Processing...}" delay="${3:-0.07}"
  local frames=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )
  while kill -0 "$pid" 2>/dev/null; do
    for f in "${frames[@]}"; do
      printf "\r${ACCENT}%s${C_RESET} %s" "$f" "$msg"
      sleep "$delay"
    done
  done
  clear_line
  printf "\r${C_G}✓${C_RESET} %s\n" "$msg"
}
progress_bar(){
  # usage: progress_bar CURRENT TOTAL
  local cur=$1 total=$2 width=36 filled=$(( cur*width/total )) perc=$(( cur*100/total ))
  printf "\r${ACCENT}["
  for ((i=0;i<filled;i++)); do printf '█'; done
  for ((i=filled;i<width;i++)); do printf '░'; done
  printf "] %3d%% ${C_RESET}" "$perc"
  if (( cur>=total )); then printf "\n"; fi
}

### ---------- dependencies ----------
_require(){ command -v "$1" >/dev/null 2>&1; }
for cmd in curl unzip zip rsync php; do
  if ! _require "$cmd"; then
    echo -e "${C_R}[ERR]${C_RESET} Dependency '$cmd' belum terinstall. Jalankan: apt update && apt install -y curl unzip zip rsync php-cli" >&2
    exit 1
  fi
done

### ---------- autodetect panel ----------
detect_panel(){
  for p in "${CANDIDATES[@]}"; do
    if [[ -d "$p" && -f "$p/artisan" ]]; then
      echo "$p" && return 0
    fi
  done
  # fallback ask user
  echo ""
  echo -n "Panel tidak terdeteksi otomatis. Masukkan lokasi panel (contoh /var/www/pterodactyl): "
  read -r manual
  if [[ -d "$manual" && -f "$manual/artisan" ]]; then
    echo "$manual"
    return 0
  fi
  echo ""
  echo "ERROR: panel path invalid." >&2
  return 1
}

### ---------- atomic install with rollback ----------
backup_current_assets(){
  local panel="$1"
  if [[ -d "$panel/public/assets" ]]; then
    local ts; ts=$(date +%Y%m%d_%H%M%S)
    local out="$BACKUPDIR/assets_backup_$ts.zip"
    (cd "$panel/public" && zip -rq "$out" assets) >/dev/null 2>&1
    echo "$out"
  else
    echo ""
  fi
}

restore_from_backup(){
  local panel="$1" backup_zip="$2"
  if [[ -z "$backup_zip" ]]; then
    log "No backup to restore."
    return 1
  fi
  log "Restoring backup $backup_zip -> $panel/public/assets"
  rm -rf "$panel/public/assets"
  mkdir -p "$panel/public"
  unzip -q "$backup_zip" -d "$TMPDIR/restore"
  # backup zip likely contains "assets" dir
  if [[ -d "$TMPDIR/restore/assets" ]]; then
    mv "$TMPDIR/restore/assets" "$panel/public/assets"
  else
    # search inside
    local found; found=$(find "$TMPDIR/restore" -type d -name assets | head -n1 || true)
    if [[ -n "$found" ]]; then
      mv "$found" "$panel/public/assets"
    else
      log "Backup doesn't contain assets/ folder"
      return 1
    fi
  fi
  chown -R www-data:www-data "$panel/public/assets" 2>/dev/null || true
  chmod -R 755 "$panel/public/assets" 2>/dev/null || true
  return 0
}

### ---------- core actions ----------
download_zip(){
  rm -f "$ZIPPATH"
  log "Downloading $THEME_URL -> $ZIPPATH"
  ( curl -L --fail --retry 3 -o "$ZIPPATH" "$THEME_URL" ) &
  spinner $! "Downloading ZaleeTheme.zip..."
  if [[ ! -s "$ZIPPATH" ]]; then
    error "Download failed or empty file."
    return 1
  fi
  return 0
}

check_zip(){
  log "Checking ZIP integrity..."
  if ! unzip -tq "$ZIPPATH" >/dev/null 2>&1; then
    log "ZIP integrity check failed."
    return 1
  fi
  log "ZIP OK."
  return 0
}

extract_zip(){
  rm -rf "$EXTRACTDIR"
  mkdir -p "$EXTRACTDIR"
  log "Extracting zip..."
  ( unzip -q "$ZIPPATH" -d "$EXTRACTDIR" ) &
  spinner $! "Extracting..."
  return 0
}

find_assets(){
  # find the first folder named "assets" (root or inside)
  local found
  found=$(find "$EXTRACTDIR" -maxdepth 4 -type d -iname "assets" | head -n1 || true)
  echo "$found"
}

install_assets(){
  local panel="$1"
  local assets_src="$2"
  log "Installing assets from $assets_src -> $panel/public/assets"

  # atomic: copy to temp dest then move
  local tmpdest="$TMPDIR/new_assets"
  rm -rf "$tmpdest"
  mkdir -p "$tmpdest"
  # copy with progress using rsync (simulate progress)
  rsync -a --delete --info=progress2 "$assets_src"/ "$tmpdest"/ >/dev/null 2>&1 &
  spinner $! "Copying files..."
  # move into place
  rm -rf "$panel/public/assets"
  mkdir -p "$panel/public"
  mv "$tmpdest" "$panel/public/assets"
  chown -R www-data:www-data "$panel/public/assets" 2>/dev/null || true
  chmod -R 755 "$panel/public/assets" 2>/dev/null || true
  return 0
}

post_install_tasks(){
  local panel="$1"
  log "Clearing Laravel caches..."
  if [[ -f "$panel/artisan" ]]; then
    ( cd "$panel" && php artisan view:clear >/dev/null 2>&1 || true )
    ( cd "$panel" && php artisan cache:clear >/dev/null 2>&1 || true )
  fi
  return 0
}

beep(){
  if [[ $SOUND -ne 0 ]]; then
    printf '\a'
  fi
}

### ---------- interactive arrow menu ----------
arrow_menu(){
  local prompt="$1"
  shift
  local options=("$@")
  local count=${#options[@]}
  local index=0
  tput civis 2>/dev/null
  while true; do
    printf "\n%s\n" "$prompt"
    for i in "${!options[@]}"; do
      if (( i == index )); then
        printf "  \033[7m  %s  \033[0m\n" "${options[i]}"
      else
        printf "     %s\n" "${options[i]}"
      fi
    done
    # read key
    IFS= read -rsn1 key 2>/dev/null
    if [[ $key == $'\x1b' ]]; then
      read -rsn2 -t 0.1 rest 2>/dev/null
      key+="$rest"
    fi
    case "$key" in
      $'\x1b[A') # up
        (( index = (index - 1 + count) % count ))
        ;;
      $'\x1b[B') # down
        (( index = (index + 1) % count ))
        ;;
      "") # enter
        tput cnorm 2>/dev/null
        echo "$index"
        return 0
        ;;
      q) tput cnorm 2>/dev/null; echo "q"; return 0 ;;
    esac
    # move cursor up to redraw
    printf "\033[%dA" $((count+1))
  done
}

### ---------- main flow ----------
main(){
  clear
  printf "%s" "$HDR_COLOR"
  logo
  printf "%s" "$C_RESET"
  echo
  # autodetect
  PANEL=$(detect_panel) || exit 1
  log "Using panel path: $PANEL"

  # interactive menu
  choice_index=$(arrow_menu "Select action (use ↑ ↓ and Enter):" "Install ZaleeTheme Premium" "Restore latest backup" "Exit")
  case "$choice_index" in
    0)
      # install flow
      set -o errexit
      log "BEGIN INSTALL"
      local backup_zip
      backup_zip=$(backup_current_assets "$PANEL")
      if download_zip; then
        if check_zip; then
          extract_zip
          assets_src=$(find_assets)
          if [[ -z "$assets_src" ]]; then
            log "ERROR: assets/ not found in ZIP"
            echo -e "${C_R}[ERR] assets/ not found in ZIP${C_RESET}"
            # rollback if we have backup
            if [[ -n "$backup_zip" ]]; then
              restore_from_backup "$PANEL" "$backup_zip"
              log "Rolled back to backup."
            fi
            exit 1
          fi
          # install
          if install_assets "$PANEL" "$assets_src"; then
            post_install_tasks "$PANEL"
            log "INSTALL SUCCESS"
            success_msg="${C_G}ZaleeTheme Premium berhasil terpasang!${C_RESET}"
            echo -e "$success_msg"
            beep
            exit 0
          else
            log "INSTALL FAILED during copy"
            echo -e "${C_R}[ERR] Install process failed during copy${C_RESET}"
            [[ -n "$backup_zip" ]] && restore_from_backup "$PANEL" "$backup_zip"
            exit 1
          fi
        else
          echo -e "${C_R}[ERR] ZIP integrity check failed${C_RESET}"
          [[ -n "$backup_zip" ]] && restore_from_backup "$PANEL" "$backup_zip"
          exit 1
        fi
      else
        echo -e "${C_R}[ERR] Download failed${C_RESET}"
        exit 1
      fi
      ;;
    1)
      # restore
      LATEST=$(ls -1t "$BACKUPDIR"/assets_backup_*.zip 2>/dev/null | head -n1 || true)
      if [[ -z "$LATEST" ]]; then
        echo -e "${C_R}[ERR] No backup found in $BACKUPDIR${C_RESET}"
        exit 1
      fi
      restore_from_backup "$PANEL" "$LATEST" && { echo -e "${C_G}Restore success${C_RESET}"; beep; exit 0; } || exit 1
      ;;
    *)
      echo "Exit."
      exit 0
      ;;
  esac
}

main
