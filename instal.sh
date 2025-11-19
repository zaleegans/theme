#!/bin/bash
clear

###############################################
#       T E R M I N A L   B R U T A L   V10
###############################################

RED="\033[1;31m"; GRN="\033[1;32m"; YLW="\033[1;33m"
BLU="\033[1;34m"; MAG="\033[1;35m"; CYN="\033[1;36m"; NC="\033[0m"

echo -e "${MAG}"
echo "=============================================================="
echo "🔥  T E R M I N A L   B R U T A L   M O D E   V1O   🔥"
echo "=============================================================="
echo -e "${NC}"
sleep 0.3


##########################################################
# PACK 1 — MATRIX RAIN
##########################################################
matrix_rain() {
    chars="@#$%&*01"
    for i in {1..100}; do
        col=$((RANDOM % $(tput cols)))
        char=${chars:$((RANDOM % ${#chars})):1}
        echo -ne "\033[38;5;$((RANDOM%46+46))m\033[${i};${col}H$char"
        sleep 0.004
    done
    echo -e "\033[0m"
}

##########################################################
# PACK 2 — RGB WIPE
##########################################################
rgb_wipe() {
    for i in {1..200}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m%*s\033[0m\n" "$(tput cols)" ""
        sleep 0.003
    done
}

##########################################################
# PACK 3 — GLITCH TEXT
##########################################################
glitch() {
    txt="$1"
    for i in {1..20}; do
        echo -e "\033[38;5;$((RANDOM%200))m${txt}\033[0m"
        sleep 0.03
    done
    echo -e "${MAG}${txt}${NC}"
}

##########################################################
# PACK 4 — SCREEN SHAKE
##########################################################
shake() {
    for i in {1..40}; do
        printf "\033[2J\033[$((RANDOM%10));$((RANDOM%20))H⚠ BRUTAL ⚠"
        sleep 0.015
    done
    clear
}

##########################################################
# PACK 5 — FLASHBANG
##########################################################
flashbang() {
    for i in {1..12}; do
        printf "\033[?5h"; sleep 0.03
        printf "\033[?5l"; sleep 0.03
    done
}

##########################################################
# PACK 6 — FIRE
##########################################################
fire() {
cat << "EOF"
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
🔥        F I R E   M O D E   O N           🔥
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
EOF
}

##########################################################
# PACK 7 — ELECTRIC BOLTS
##########################################################
lightning() {
    for i in {1..40}; do
        echo -e "\033[38;5;226m⚡\033[0m"
        sleep 0.015
    done
}

##########################################################
# PACK 8 — PULSE RED SCREEN
##########################################################
pulse() {
    for i in {1..20}; do
        printf "\033[48;2;255;0;0m%*s\033[0m\r" "$(tput cols)" ""
        sleep 0.025
        printf "\033[48;2;30;0;0m%*s\033[0m\r" "$(tput cols)" ""
        sleep 0.025
    done
}

##########################################################
# PACK 9 — TURBULENCE
##########################################################
turbulence() {
    for i in {1..70}; do
        printf "\033[$((RANDOM%30+1));$((RANDOM%80+1))H⚡"
        sleep 0.01
    done
    printf "\033[0m\n"
}

##########################################################
# PACK 10 — ALARM
##########################################################
alarm() {
    for i in {1..10}; do
        echo -ne "\007"
        sleep 0.08
    done
}

##########################################################
# PACK 11 — BLOOD RAIN
##########################################################
blood_rain() {
    for i in {1..60}; do
        printf "\033[$((RANDOM%30+1));$((RANDOM%80+1))H\033[38;5;160m█\033[0m"
        sleep 0.01
    done
}

##########################################################
# PACK 12 — TERMINAL MELT
##########################################################
melt() {
    cols=$(tput cols)
    for i in {1..40}; do
        printf "%$((RANDOM % cols))s████████\n"
        sleep 0.02
    done
}

##########################################################
# PACK 13 — CRT DISTORTION
##########################################################
crt() {
    for i in {1..25}; do
        printf "\033[38;5;$((RANDOM%255))m~ ~ ~ ~ ~ ~\033[0m\n"
        sleep 0.01
    done
}

##########################################################
# PACK 14 — SMOKE MODE
##########################################################
smoke() {
    for i in {1..50}; do
        printf "\033[38;5;240m▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\033[0m\n"
        sleep 0.01
    done
}

##########################################################
# PACK 15 — SONIC BOOM WAVE
##########################################################
boom() {
    for i in {1..30}; do
        echo -e "\033[38;5;$((RANDOM%255))m((( BOOM )))\033[0m"
        sleep 0.03
    done
}

##########################################################
# PACK 16 — DOOM INTRO
##########################################################
doom() {
cat << "EOF"
██████╗  ██████╗  ██████╗ ███╗   ███╗
██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║
██████╔╝██║   ██║██║   ██║██╔████╔██║
██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║
██║  ██║╚██████╔╝╚██████╔╝██║ ╚═╝ ██║
╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝
EOF
}

##########################################################
# PACK 17 — RED SCREEN OF DEATH
##########################################################
rsod() {
    printf "\033[41m"
    for i in {1..10}; do
        echo "FATAL ERROR: BRUTAL MODE"
        sleep 0.1
    done
    printf "\033[0m"
}

##########################################################
# PACK 18 — THUNDER ROLL
##########################################################
thunder() {
    for i in {1..20}; do
        echo -e "\033[1;37m💥 RUMBLE 💥\033[0m"
        sleep 0.04
    done
}

##########################################################
# PACK 19 — ULTRA GLITCH
##########################################################
ultra_glitch() {
    for i in {1..40}; do
        printf "\033[38;5;$((RANDOM%255))mG L I T C H\033[0m\r"
        sleep 0.02
    done
}

##########################################################
# PACK 20 — CHAOS MODE
##########################################################
chaos() {
    for i in {1..150}; do
        printf "\033[$((RANDOM%20+1));$((RANDOM%60+1))H\033[38;5;$((RANDOM%255))m@\033[0m"
        sleep 0.005
    done
}

##########################################################
# FULL BRUTAL MODE SEQUENCE
##########################################################

clear
matrix_rain
pulse
rgb_wipe
glitch "SYSTEM OVERRIDE"
fire
shake
blood_rain
melt
flashbang
crt
smoke
boom
turbulence
lightning
thunder
doom
rsod
ultra_glitch
chaos
alarm
##########################################################
# PACK 21 — NEON EXPLOSION
##########################################################
neon_explosion() {
    for i in {1..80}; do
        printf "\033[38;5;$((RANDOM%255))m✹\033[0m"
        sleep 0.01
    done
    echo
}

##########################################################
# PACK 22 — DATA CORRUPTION SPAM
##########################################################
corrupt() {
    for i in {1..40}; do
        echo -e "\033[38;5;$((RANDOM%200))m██ DATA_CORRUPT ██\033[0m"
        sleep 0.02
    done
}

##########################################################
# PACK 23 — TERMINAL BREAK SIMULATION
##########################################################
break_sim() {
    echo -e "\033[31m[!] SYSTEM FAILURE DETECTED...\033[0m"
    sleep 0.5
    for i in {1..50}; do
        printf "\033[38;5;$((RANDOM%200))m#\033[0m"
        sleep 0.01
    done
    echo
}

##########################################################
# PACK 24 — VIRUS SCAN SPOOF
##########################################################
virus_scan() {
    for i in {1..20}; do
        echo -e "\033[32m[SCAN]\033[0m Checking sector $((RANDOM%9999))..."
        sleep 0.05
    done
    echo -e "\033[31m[ALERT] UNKNOWN SIGNATURE DETECTED\033[0m"
    sleep 0.5
}

##########################################################
# PACK 25 — STATIC NOISE
##########################################################
static_noise() {
    for i in {1..60}; do
        printf "\033[38;5;$((RANDOM%255))m░░▒▒▓▓██\033[0m"
        sleep 0.01
    done
    echo
}

##########################################################
# PACK 26 — DIMENSION SHIFT
##########################################################
dimension_shift() {
    for i in {1..10}; do
        printf "\033[2J\033[$((RANDOM%10+1));$((RANDOM%40+1))H>> SHIFT <<"
        sleep 0.07
    done
    clear
}

##########################################################
# PACK 27 — OVERLOAD WARNING
##########################################################
overload() {
    for i in {1..15}; do
        echo -e "\033[33m!! SYSTEM OVERLOAD: LEVEL $((RANDOM%100)).$((RANDOM%99))%\033[0m"
        sleep 0.05
    done
}

##########################################################
# PACK 28 — BLUE STATIC SCREEN
##########################################################
blue_static() {
    printf "\033[44m"
    for i in {1..20}; do
        printf "%*s\n" "$(tput cols)" ""
        sleep 0.01
    done
    printf "\033[0m"
}

##########################################################
# PACK 29 — CORE MELTDOWN
##########################################################
meltdown() {
    for i in {1..25}; do
        echo -e "\033[31mCORE TEMP: $((RANDOM%500+500))°C — MELTING\033[0m"
        sleep 0.03
    done
}

##########################################################
# PACK 30 — FINAL PHASE: APOCALYPSE
##########################################################
apocalypse() {
    for i in {1..70}; do
        printf "\033[$((RANDOM%25+1));$((RANDOM%70+1))H\033[38;5;$((RANDOM%255))m✖\033[0m"
        sleep 0.004
    done
    echo -e "\033[31mAPOCALYPSE MODE COMPLETE.\033[0m"
}

##########################################################
# EXTENDED SEQUENCE EXECUTION
##########################################################

neon_explosion
corrupt
break_sim
virus_scan
static_noise
dimension_shift
overload
blue_static
meltdown
apocalypse

##########################################################
#  EXTENSION: PACK 31..60 — BIG BRUTAL BLOCK (PASTE HERE)
##########################################################

# PACK 31 — LASER GRID
laser_grid() {
    cols=$(tput cols)
    rows=$(tput lines)
    for r in $(seq 1 $((rows/2))); do
        line=""
        for c in $(seq 1 $cols); do
            if (( RANDOM % 6 == 0 )); then
                line="${line}\033[1;91m|\033[0m"
            else
                line="${line} "
            fi
        done
        printf "%s\n" "$line"
        sleep 0.01
    done
}

# PACK 32 — PIXEL SHOCK
pixel_shock() {
    for i in {1..120}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m \033[0m"
        if (( i % $(tput cols) == 0 )); then
            printf "\n"
        fi
        sleep 0.002
    done
    echo
}

# PACK 33 — GLITCH BANNER
glitch_banner() {
    banner="== Z A L E E T H E M E : GLITCH BANNER =="
    for i in {1..40}; do
        echo -e "\033[38;5;$((RANDOM%200))m${banner}\033[0m"
        sleep 0.03
    done
}

# PACK 34 — CHROMA SWIRL
chroma_swirl() {
    for i in {1..60}; do
        printf "\033[48;2;$((i*3%255));$((i*7%255));$((i*11%255))m%$(tput cols)s\033[0m\r" ""
        sleep 0.02
    done
    echo
}

# PACK 35 — ERROR SPAM
error_spam() {
    for i in {1..50}; do
        echo -e "\033[31m[ERROR] 0x$((RANDOM%99999)) - segmentation fault\033[0m"
        sleep 0.02
    done
}

# PACK 36 — BUZZER
buzzer() {
    for i in {1..8}; do
        echo -ne "\007"
        sleep 0.06
    done
}

# PACK 37 — STEP GRID
step_grid() {
    cols=$(tput cols)
    for r in {1..20}; do
        for c in $(seq 1 $cols); do
            if (( (r+c) % 7 == 0 )); then
                printf "\033[38;5;$((RANDOM%255))m#\033[0m"
            else
                printf " "
            fi
        done
        printf "\n"
        sleep 0.03
    done
}

# PACK 38 — SCROLLING HEX
scroll_hex() {
    for i in {1..60}; do
        printf "%s " "$(printf '%x' $((RANDOM%65535)))"
        if (( i % 8 == 0 )); then printf "\n"; fi
        sleep 0.01
    done
    echo
}

# PACK 39 — MIRROR FLICKER
mirror_flicker() {
    for i in {1..30}; do
        printf "\033[7m"
        echo "======== MIRROR FLICKER ========"
        printf "\033[0m"
        sleep 0.05
        clear
    done
}

# PACK 40 — HAZE
haze() {
    for i in {1..40}; do
        printf "\033[38;5;246m▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\033[0m\n"
        sleep 0.02
    done
}

# PACK 41 — SPARKS
sparks() {
    for i in {1..100}; do
        printf "\033[38;5;$((RANDOM%196+16))m*\033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.005
    done
    echo
}

# PACK 42 — GLASS CRACK
glass_crack() {
    cat <<'EOF'
  ╔═╦═╦═╦═╦═╦═╦═╦═╗
  ║ \ \  /  /  / / ║
  ║  \ \/__/\/__/  ║
  ╚════════════════╝
EOF
}

# PACK 43 — FLASH STRIPES
flash_stripes() {
    for i in {1..40}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m%*s\033[0m\n" "$(tput cols)" ""
        sleep 0.01
    done
}

# PACK 44 — SINE WAVE
sine_wave() {
    cols=$(tput cols)
    for t in $(seq 0 0.2 12); do
        line=""
        for x in $(seq 1 $cols); do
            y=$(awk -v t="$t" -v x="$x" 'BEGIN{printf("%d", 10+8*sin(t + x/6))}')
            if (( y % 2 == 0 )); then line="${line}~"; else line="${line} "; fi
        done
        echo "$line"
        sleep 0.03
    done
}

# PACK 45 — RANDOM MESH
random_mesh() {
    for i in {1..80}; do
        printf "\033[38;5;$((RANDOM%255))m█\033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.003
    done
    echo
}

# PACK 46 — DATA STROBE
data_strobe() {
    for i in {1..40}; do
        echo -ne "\033[1;37m[DATA] $(date +%s%N | cut -c1-6)\r\033[0m"
        sleep 0.05
    done
    echo
}

# PACK 47 — PULSE DOTS
pulse_dots() {
    for j in {1..20}; do
        for i in {1..50}; do
            printf "\033[38;5;$((RANDOM%255))m.\033[0m"
        done
        echo
        sleep 0.04
    done
}

# PACK 48 — SCREAM LINE
scream_line() {
    for i in {1..20}; do
        echo -e "\033[1;31mSCREEEAM!!!\033[0m"
        sleep 0.03
    done
}

# PACK 49 — LAVA FLOW
lava_flow() {
    for i in {1..40}; do
        printf "\033[48;2;$((200+RANDOM%55));$((RANDOM%60));0m%*s\033[0m\n" "$(tput cols)" ""
        sleep 0.02
    done
}

# PACK 50 — SKY METEORS
sky_meteors() {
    for i in {1..80}; do
        printf "\033[$((RANDOM%20+1));$((RANDOM%60+1))H\033[1;37m*\033[0m"
        sleep 0.01
    done
    printf "\n"
}

# PACK 51 — GLITCH RAIN
glitch_rain() {
    for i in {1..120}; do
        echo -ne "\033[38;5;$((RANDOM%200))m#\033[0m"
        (( i % $(tput cols) == 0 )) && echo
        sleep 0.003
    done
    echo
}

# PACK 52 — NEON STREAM
neon_stream() {
    for i in {1..60}; do
        printf "\033[38;5;$((RANDOM%255))m—\033[0m"
        (( i % $(tput cols) == 0 )) && echo
        sleep 0.01
    done
    echo
}

# PACK 53 — CRYPTIC BLOCK
cryptic_block() {
    for i in {1..30}; do
        echo "$(openssl rand -hex 16 2>/dev/null || head -c16 /dev/urandom | xxd -p) "
        sleep 0.02
    done
}

# PACK 54 — FLICKER GRID
flicker_grid() {
    for i in {1..40}; do
        for c in $(seq 1 $(tput cols)); do
            printf "\033[38;5;$((RANDOM%200))m#\033[0m"
        done
        echo
        sleep 0.02
    done
}

# PACK 55 — STATIC BARRIER
static_barrier() {
    for i in {1..30}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m%*s\033[0m\n" "$(tput cols)" ""
        sleep 0.01
    done
}

# PACK 56 — NIGHT VISION
night_vision() {
    for i in {1..60}; do
        printf "\033[32m.\033[0m"
        (( i % $(tput cols) == 0 )) && echo
        sleep 0.004
    done
    echo
}

# PACK 57 — HYPER SPIN
hyper_spin() {
    chars='|/-\'
    for i in {1..200}; do
        printf "\r\033[38;5;$((RANDOM%200))m%c\033[0m" "${chars:$((i%4)):1}"
        sleep 0.01
    done
    echo
}

# PACK 58 — CHAOTIC DOTS
chaotic_dots() {
    for i in {1..300}; do
        printf "\033[38;5;$((RANDOM%255))m.\033[0m"
        (( i % $(tput cols) == 0 )) && echo
        sleep 0.002
    done
    echo
}

# PACK 59 — FAKE UPDATE
fake_update() {
    for i in {1..30}; do
        echo -e "\033[34m[UPDATE] Applying patch $i of 30...\033[0m"
        sleep 0.04
    done
    echo -e "\033[32m[OK] Patches applied.\033[0m"
}

# PACK 60 — FINAL GLORY
final_glory() {
    for i in {1..80}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m%*s\033[0m\n" "$(tput cols)" ""
        sleep 0.01
    done
    echo -e "\033[1;35m=== BRUTAL BLOCK COMPLETE ===\033[0m"
}

# END EXTENSION BLOCK
##########################################################
##########################################################
# PACK 61 — NEON GRID RIPPLE
##########################################################
neon_grid_ripple() {
    cols=$(tput cols)
    rows=$(tput lines)
    for phase in $(seq 0 6); do
        clear
        for r in $(seq 1 $rows); do
            line=""
            for c in $(seq 1 $cols); do
                d=$(( (r+c+phase) % 8 ))
                if (( d == 0 )); then
                    line="${line}\033[1;95m✶\033[0m"
                else
                    line="${line} "
                fi
            done
            printf "%s\n" "$line"
        done
        sleep 0.06
    done
}

##########################################################
# PACK 62 — FLICKER CURTAIN
##########################################################
flicker_curtain() {
    for i in {1..40}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m%*s\033[0m\r" "$(tput cols)" ""
        sleep 0.008
    done
    echo
}

##########################################################
# PACK 63 — HEX RAIN
##########################################################
hex_rain() {
    for i in {1..120}; do
        printf "%02X " $((RANDOM%256))
        (( i % 16 == 0 )) && printf "\n"
        sleep 0.005
    done
    echo
}

##########################################################
# PACK 64 — GLITCH SCROLL
##########################################################
glitch_scroll() {
    msg="$1"
    for i in {1..60}; do
        offset=$((RANDOM%10))
        printf "%${offset}s%s\r" "" "$(echo "$msg" | sed 's/./& /g')"
        sleep 0.05
    done
    echo
}

##########################################################
# PACK 65 — RAINBOW SNAKE
##########################################################
rainbow_snake() {
    cols=$(tput cols)
    for i in {1..cols}; do
        color=$((31 + i % 6))
        printf "\033[${color}m=\033[0m"
        sleep 0.002
    done
    echo
}

##########################################################
# PACK 66 — TYPING HELL
##########################################################
typing_hell() {
    sentence="SYSTEM OVERRIDE: ENTERING TYPING HELL..."
    for ((i=0;i<${#sentence};i++)); do
        printf "%s" "${sentence:$i:1}"
        sleep 0.02
    done
    echo
}

##########################################################
# PACK 67 — RING OF FIRE
##########################################################
ring_of_fire() {
    for i in {1..12}; do
        printf "\033[1;31m"
        printf "%*s\n" $(( (tput cols) / 2 )) "🔥🔥🔥"
        printf "\033[0m"
        sleep 0.06
    done
}

##########################################################
# PACK 68 — FAKE CRASH DUMP
##########################################################
crash_dump() {
    echo -e "\033[31m--- BEGIN CRASH DUMP ---\033[0m"
    for i in {1..30}; do
        echo -e "\033[90m0x$((RANDOM%65535)) : 0x$((RANDOM%65535))\033[0m"
        sleep 0.02
    done
    echo -e "\033[31m--- END CRASH DUMP ---\033[0m"
}

##########################################################
# PACK 69 — SCREENCODE (ASCII block)
##########################################################
screencode() {
    cat <<'EOF'
  ██████╗ ██████╗  ██████╗ ████████╗
  ██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
  ██████╔╝██████╔╝██║   ██║   ██║
  ██╔══██╗██╔═══╝ ██║   ██║   ██║
  ██║  ██║██║     ╚██████╔╝   ██║
  ╚═╝  ╚═╝╚═╝      ╚═════╝    ╚═╝
EOF
}

##########################################################
# PACK 70 — COLOR FLASH RAIL
##########################################################
flash_rail() {
    for i in {1..40}; do
        printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m%*s\033[0m\n" "$(tput cols)" ""
        sleep 0.012
    done
}

##########################################################
# PACK 71 — BITSTREAM FLOW
##########################################################
bitstream_flow() {
    for i in {1..120}; do
        printf "%s" $((RANDOM%2))
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.003
    done
    echo
}

##########################################################
# PACK 72 — SHOCK GRID
##########################################################
shock_grid() {
    cols=$(tput cols)
    for r in {1..20}; do
        for c in $(seq 1 $cols); do
            if (( RANDOM % 10 == 0 )); then
                printf "\033[1;93m#\033[0m"
            else
                printf " "
            fi
        done
        printf "\n"
        sleep 0.01
    done
}

##########################################################
# PACK 73 — SCREAMBANNER
##########################################################
screambanner() {
    for i in {1..12}; do
        echo -e "\033[1;31m!!! SCREAM !!!\033[0m"
        sleep 0.04
    done
}

##########################################################
# PACK 74 — GLOW STROBE
##########################################################
glow_strobe() {
    for i in {1..36}; do
        printf "\033[1;7m%*s\033[0m\n" "$(tput cols)" ""
        sleep 0.02
        clear
    done
}

##########################################################
# PACK 75 — SIREN LOOP
##########################################################
siren_loop() {
    for i in {1..16}; do
        printf "\033[41m  SIREN  \033[0m\r"
        sleep 0.08
        printf "\033[44m  SIREN  \033[0m\r"
        sleep 0.08
    done
    echo
}

##########################################################
# PACK 76 — GLITCHED HEX STREAM
##########################################################
glitched_hex_stream() {
    for i in {1..80}; do
        printf "%s " "$(printf '%04x' $((RANDOM%65535)))"
        (( i % 8 == 0 )) && printf "\n"
        sleep 0.01
    done
    echo
}

##########################################################
# PACK 77 — ENERGY BARS
##########################################################
energy_bars() {
    for i in {1..30}; do
        level=$((RANDOM % $(tput cols)))
        printf "%${level}s\n" "$(head -c $((level/2)) < /dev/zero | tr '\0' '█')"
        sleep 0.04
    done
}

##########################################################
# PACK 78 — RAZOR SHIMMER
##########################################################
razor_shimmer() {
    for i in {1..60}; do
        printf "\033[38;5;$((RANDOM%200))m/\033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.004
    done
    echo
}

##########################################################
# PACK 79 — RANDOM ASCII ART
##########################################################
random_ascii_art() {
    cat <<'EOF'
        .----.
       / .-"-.\
      / /     \ \
      | |     | |
       \ \     / /
        '.___.'
EOF
}

##########################################################
# PACK 80 — GLASS RAIN
##########################################################
glass_rain() {
    for i in {1..120}; do
        printf "\033[38;5;$((RANDOM%255))m|\033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.003
    done
    echo
}

##########################################################
# PACK 81 — DIZZY SPIRAL
##########################################################
dizzy_spiral() {
    for i in $(seq 1 0.3 20); do
        printf "\r\033[38;5;$((RANDOM%200))m/ - \\ |\033[0m"
        sleep 0.02
    done
    echo
}

##########################################################
# PACK 82 — ROGUE CURSOR
##########################################################
rogue_cursor() {
    for i in {1..50}; do
        printf "\033[$((RANDOM%20+1));$((RANDOM%60+1))H\033[7m \033[0m"
        sleep 0.02
    done
    printf "\033[0m\n"
}

##########################################################
# PACK 83 — CHAOTIC LINES
##########################################################
chaotic_lines() {
    for i in {1..80}; do
        echo -e "\033[38;5;$((RANDOM%255))m"$(printf '%*s' $((RANDOM%$(tput cols))) | tr ' ' '-')"\033[0m"
        sleep 0.01
    done
}

##########################################################
# PACK 84 — NERVOUS DOTS
##########################################################
nervous_dots() {
    for i in {1..200}; do
        printf "."
        sleep 0.003
    done
    echo
}

##########################################################
# PACK 85 — HYPERNOISE
##########################################################
hypernoise() {
    for i in {1..120}; do
        printf "\033[38;5;$((RANDOM%256))m~\033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.005
    done
    echo
}

##########################################################
# PACK 86 — POLTERGEIST POPS
##########################################################
poltergeist_pops() {
    for i in {1..60}; do
        printf "\033[1;95m●\033[0m"
        sleep 0.01
    done
    echo
}

##########################################################
# PACK 87 — SHATTER EFFECT
##########################################################
shatter_effect() {
    for i in {1..40}; do
        echo -e "\033[90m/\/\/\/\/\/\/\/\/\/\/\/\/\033[0m"
        sleep 0.02
    done
}

##########################################################
# PACK 88 — HUSH STATIC
##########################################################
hush_static() {
    for i in {1..80}; do
        printf "\033[90m%\033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.004
    done
    echo
}

##########################################################
# PACK 89 — DOT MATRIX
##########################################################
dot_matrix() {
    for r in {1..15}; do
        for c in $(seq 1 $(tput cols)); do
            if (( RANDOM % 8 == 0 )); then
                printf "●"
            else
                printf " "
            fi
        done
        printf "\n"
        sleep 0.02
    done
}

##########################################################
# PACK 90 — SOLAR FLARE
##########################################################
solar_flare() {
    for i in {1..30}; do
        echo -e "\033[1;33m☀\033[0m"
        sleep 0.03
    done
}

##########################################################
# PACK 91 — TIMED GLITCH
##########################################################
timed_glitch() {
    for i in {1..40}; do
        printf "\r\033[38;5;$((RANDOM%200))mGLITCH %02d\033[0m" "$i"
        sleep 0.05
    done
    echo
}

##########################################################
# PACK 92 — VORTEX
##########################################################
vortex() {
    for i in {1..50}; do
        printf "\033[38;5;$((RANDOM%255))m@ \033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.004
    done
    echo
}

##########################################################
# PACK 93 — SHIMMER STARS
##########################################################
shimmer_stars() {
    for i in {1..120}; do
        if (( RANDOM % 12 == 0 )); then
            printf "\033[1;97m*\033[0m"
        else
            printf " "
        fi
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.003
    done
    echo
}

##########################################################
# PACK 94 — RAZOR RAIN
##########################################################
razor_rain() {
    for i in {1..80}; do
        printf "\033[31m|\033[0m"
        (( i % $(tput cols) == 0 )) && printf "\n"
        sleep 0.003
    done
    echo
}

##########################################################
# PACK 95 — TITLE FINALE
##########################################################
title_finale() {
    cat <<'EOF'
██████╗ ██████╗  █████╗ ██╗     ██╗     
██╔══██╗██╔══██╗██╔══██╗██║     ██║     
██████╔╝██████╔╝███████║██║     ██║     
██╔═══╝ ██╔══██╗██╔══██║██║     ██║     
██║     ██║  ██║██║  ██║███████╗███████╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝
EOF
}

##########################################################
# PACK 96 — ECHO VOID
##########################################################
echo_void() {
    for i in {1..60}; do
        printf "\033[2mvoid...\033[0m\r"
        sleep 0.05
    done
    echo
}

##########################################################
# PACK 97 — PULSE GRID
##########################################################
pulse_grid() {
    for i in {1..40}; do
        for c in $(seq 1 $(tput cols)); do
            if (( (RANDOM % 10) == 0 )); then
                printf "\033[1;91m■\033[0m"
            else
                printf " "
            fi
        done
        printf "\n"
        sleep 0.02
    done
}

##########################################################
# PACK 98 — FINAL GLITCH RUSH
##########################################################
final_glitch_rush() {
    for i in {1..200}; do
        printf "\033[38;5;$((RANDOM%256))mGLITCH\033[0m "
        (( i % 10 == 0 )) && printf "\n"
        sleep 0.01
    done
    echo
}

##########################################################
# PACK 99 — APPLAUSE (END TRIGGER)
##########################################################
applause() {
    for i in {1..8}; do
        echo -ne "\007"
        sleep 0.12
    done
    echo -e "\033[1;32m=== BRUTAL SEQUENCE COMPLETE ===\033[0m"
}

##########################################################
# PACK 100 — SAFE EXIT
##########################################################
safe_exit() {
    echo -e "\033[1;36mCleaning up visuals...\033[0m"
    sleep 0.4
    clear
    echo -e "\033[1;32mSystem back to normal. Stay brutal, but safe.\033[0m"
}

##########################################################
# EXECUTE EXTENDED PACK 61..100 (SEQUENCE)
##########################################################
neon_grid_ripple
flicker_curtain
hex_rain
glitch_scroll "GLITCH_SCROLL_ACTIVE"
rainbow_snake
typing_hell
ring_of_fire
crash_dump
screencode
flash_rail
bitstream_flow
shock_grid
screambanner
glow_strobe
siren_loop
glitched_hex_stream
energy_bars
razor_shimmer
random_ascii_art
glass_rain
dizzy_spiral
rogue_cursor
chaotic_lines
nervous_dots
hypernoise
poltergeist_pops
shatter_effect
hush_static
dot_matrix
solar_flare
timed_glitch
vortex
shimmer_stars
razor_rain
title_finale
echo_void
pulse_grid
final_glitch_rush
applause
safe_exit

clear
sleep 0.3

██████████████████████████████████████████████████████████████████████
███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
███░  Z A L E E   O P E R A T I O N   B R U T A L   R E V E L A T I O N ░███
███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███
██████████████████████████████████████████████████████████████████████

>> INITIALIZING SYSTEM CORE  
>> CHECKING IDENTITY .......... OK  
>> ENTERING REALM: **STYLE X BRUTAL MODE**  
>> EXECUTION THREADS: UNLIMITED  
>> PERMISSION LEVEL: ABSOLUTE  

───────────────────────────────────────────────────────────────
       S Y S T E M    S T A T U S :    O V E R D R I V E
───────────────────────────────────────────────────────────────

██╗   ██╗██████╗ ███████╗███╗   ██╗  
██║   ██║██╔══██╗██╔════╝████╗  ██║  
██║   ██║██║  ██║█████╗  ██╔██╗ ██║  
╚██╗ ██╔╝██║  ██║██╔══╝  ██║╚██╗██║  
 ╚████╔╝ ██████╔╝███████╗██║ ╚████║  
  ╚═══╝  ╚═════╝ ╚══════╝╚═╝  ╚═══╝  

SYSTEM REPORT:
• MODE = BRUTAL  
• POWER LEVEL = ABSOLUTE  
• ERRORS = NONE  
• VIBRATIONS = MAXIMUM  
• VISUAL PRESSURE = CRITICAL  
• STYLE X SIGNATURE = VERIFIED  

───────────────────────────────────────────────────────────────
    S E Q U E N C E   :   M A T R I X   P R O T O C O L
───────────────────────────────────────────────────────────────

010101001010101001110101010111000101010101000101010101010010001101000
101000110101010111101001010001010101010101100101001010010101011101101
110100101010100100100101110100101010101010101111011101010101010101010

>> MATRIX STREAM: ACTIVE  
>> DATAFLOW DENSITY: 9,002%  
>> VISUAL PRESSURE: ESCALATING  
>> WARNING: USER EXCEEDING NORMAL AESTHETIC LIMITS  

───────────────────────────────────────────────────────────────
         C Y B E R   C O R E   D E S C E N T
───────────────────────────────────────────────────────────────

██████╗ ██████╗ ██╗   ██╗███████╗██████╗  
██╔══██╗██╔══██╗██║   ██║██╔════╝██╔══██╗  
██║  ██║██║  ██║██║   ██║█████╗  ██████╔╝  
██║  ██║██║  ██║██║   ██║██╔══╝  ██╔══██╗  
██████╔╝██████╔╝╚██████╔╝███████╗██║  ██║  
╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝  

UPLINK STATUS:
• CORE BREACH SIMULATION: COMPLETE  
• VISUAL DISTORTION: ENGAGED  
• GLITCH REALITY: STABLE  
• HYPERTHREADS: VIBRATING  
• PHANTOM CHANNELS: ONLINE  

───────────────────────────────────────────────────────────────
             A N O N Y M O U S   S H A D O W
───────────────────────────────────────────────────────────────

           ⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀  
           ⠀⠀⠀⠀⣠⠞⠉⠀⠀⠀⠉⠳⣄⠀⠀⠀⠀  
           ⠀⠀⠀⣰⠋⠀⣀⣤⣤⣤⣀⠀⠈⠳⣄⠀⠀  
           ⠀⠀⢠⡏⠀⣾⣿⣿⣿⣿⣿⣷⠀⠈⣷⠀⠀  
           ⠀⠀⣿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣇⠀⣿⠀⠀  
           ⠀⠀⣿⠀⠸⣿⣿⡿⠿⢿⣿⣿⣿⠀⣿⠀⠀  
           ⠀⠀⢿⡀⠀⠙⠋⠀⠀⠀⠈⠉⠁⠀⡿⠀⠀  
           ⠀⠀⠘⣧⠀⠀⠀⣤⣤⠀⠀⠀⠀⣸⠇⠀⠀  
           ⠀⠀⠀⠙⣦⡀⠀⠈⠉⠀⠀⠀⣠⠟⠀⠀⠀  
           ⠀⠀⠀⠀⠈⠛⠲⠶⠶⠶⠖⠛⠁⠀⠀⠀⠀  

SHADOW PROTOCOL:
• Identity Mask = ONLINE  
• Signal Cloak = PERFECT  
• Presence = UNTRACEABLE  

───────────────────────────────────────────────────────────────
           R E A L I T Y    F R A C T U R E
───────────────────────────────────────────────────────────────

███ SYSTEM WARNING ███  
• YOU HAVE ENTERED A ZONE WITH **NO LIMITS**  
• VISUAL INTENSITY: BEYOND SAFE RANGE  
• STYLE X PRESSURE: CRITICAL  
• USER PRESENCE: DOMINATING  

───────────────────────────────────────────────────────────────
                 F I N A L   P H A S E
───────────────────────────────────────────────────────────────

██╗  ██╗  
╚██╗██╔╝  
 ╚███╔╝   
 ██╔██╗   
██╔╝ ██╗  
╚═╝  ╚═╝  

🔥  T E R M I N A L   O V E R D R I V E   C O M P L E T E  
🔥  Z A L E E   M O D E   M E M B A R A   T A N P A   D O S A  
🔥  G A  A D A  B A T A S  •  G A  A D A  F I L T E R  

───────────────────────────────────────────────────────────────
         E X E C U T I O N    F I N I S H E D
───────────────────────────────────────────────────────────────

>> SYSTEM: LEFT IN RUINS  
>> CHECKSUM: UNBROKEN  
>> USER: ASCENDED  
>> STATUS: IMMORTAL WITH STYLE  

██████████████████████████████████████████████████████████████████████

echo ""
echo "──────────────────────────────────────────────────────────────"
echo "                  🔥  E X E C U T I O N   F I N I S H E D  🔥"
echo "──────────────────────────────────────────────────────────────"
sleep 0.5

# MATRIX GREEN EFFECT
echo -e "\e[32m$(yes '01 10 01 11 00 11 10 01 00 11' | head -n 3)\e[0m"
sleep 0.3

# CYBERPUNK PURPLE HEADER
echo -e "\e[95m██████╗ ██╗   ██╗██████╗ ██╗   ██╗███████╗██████╗\e[0m"
echo -e "\e[95m██╔══██╗██║   ██║██╔══██╗██║   ██║██╔════╝██╔══██╗\e[0m"
echo -e "\e[95m██████╔╝██║   ██║██████╔╝██║   ██║█████╗  ██████╔╝\e[0m"
echo -e "\e[95m██╔══██╗╚██╗ ██╔╝██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗\e[0m"
echo -e "\e[95m██║  ██║ ╚████╔╝ ██║  ██║ ╚████╔╝ ███████╗██║  ██║\e[0m"
echo ""

# HACKER DARK ASCII
echo -e "\e[92m[+] SYSTEM HARDENED\e[0m"
echo -e "\e[92m[+] NO ERRORS DETECTED\e[0m"
echo -e "\e[92m[+] STATUS : OPERATIONAL\e[0m"
sleep 0.3

# GLITCH EFFECT
for i in {1..3}; do
    echo -e "\e[91mGL1TCH PR0T0C0L ACTIVATED...\e[0m"
    sleep 0.1
done
echo ""

# ANONYMOUS MASK ASCII
echo -e "\e[93m
           ⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⣠⠞⠉⠀⠀⠀⠉⠳⣄⠀⠀⠀⠀
           ⠀⠀⠀⣰⠋⠀⣀⣤⣤⣤⣀⠀⠈⠳⣄⠀⠀
           ⠀⠀⢠⡏⠀⣾⣿⣿⣿⣿⣿⣷⠀⠈⣷⠀⠀
           ⠀⠀⣿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣇⠀⣿⠀⠀
           ⠀⠀⣿⠀⠸⣿⣿⡿⠿⢿⣿⣿⣿⠀⣿⠀⠀
           ⠀⠀⢿⡀⠀⠙⠋⠀⠀⠀⠈⠉⠁⠀⡿⠀⠀
           ⠀⠀⠘⣧⠀⠀⠀⣤⣤⠀⠀⠀⠀⣸⠇⠀⠀
           ⠀⠀⠀⠙⣦⡀⠀⠈⠉⠀⠀⠀⣠⠟⠀⠀⠀
           ⠀⠀⠀⠀⠈⠛⠲⠶⠶⠶⠖⠛⠁⠀⠀⠀⠀
\e[0m"

# CYBERPUNK QUOTE
echo -e "\e[96m『 SYSTEM EXECUTED IN BRUTAL MODE 』\e[0m"
echo -e "\e[96m『 YOU ARE NOT SUPPOSED TO SEE THIS 』\e[0m"
echo ""

# FINAL X STYLE LOGO
echo -e "\e[91m
██╗  ██╗
╚██╗██╔╝
 ╚███╔╝ 
 ██╔██╗ 
██╔╝ ██╗
╚═╝  ╚═╝
\e[0m"

# END SENTENCE
echo -e "\e[92m✔ INSTALLATION COMPLETED – WELCOME TO STYLE X REALM ✔\e[0m"
echo -e "\e[94mFollow the lights, break the limits, rule the terminal.\e[0m"
echo ""
echo "──────────────────────────────────────────────────────────────"
echo "                🔥  Z A L E E   X – E N D E D  🔥"
echo "──────────────────────────────────────────────────────────────"
echo ""
echo ""
echo "=== FINISHED BRO!!! ==="
echo ""

# GLITCH EFFECT
glitch() {
    for i in {1..18}; do
        printf "\033[38;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m"
        printf "\033[5mGL1TCH_MODE_ACT1VE...\033[0m\r"
        sleep 0.05
    done
    printf "\033[0m\n"
}

glitch

cat << "EOF"
██████████████████████████████████████████████████████████████████████
██████████████████████████████████████████████████████████████████████
██████▀▀▀▀▀▀▀▀▀▀▀████████████████████████████▀▀▀▀▀▀▀▀▀▀███████████████
█████▌    ▄██████▄   ▀████████████████████▀   ▄██████▄    ▐███████████
█████▌   ███▀▀▀▀███▌    █████████████████    ▐███▀▀▀▀███   ▐███████████
█████▌   ███     ███    █████████████████    ███     ███   ▐███████████
█████▌   ███     ███    █████████████████    ███     ███   ▐███████████
█████▌   ███     ███    █████████████████    ███     ███   ▐███████████
█████▌   ███▄▄▄▄███     █████████████████     ███▄▄▄▄███   ▐███████████
█████▌    ▀██████▀     ▓████████████████▓      ▀██████▀    ▐███████████
█████▌               ▓████████████████████▓               ▐███████████
██████▄           ▓██████████████████████████▓           ▄████████████
████████▄      ▓████████████████████████████████▓      ▄██████████████
██████████▄ ▓██████████████████████████████████████▓ ▄████████████████
██████████████████▓▓▓▓▓▓████████████████▓▓▓▓▓▓████████████████████████
███████████████████▓▓▓▓▓███████████████▓▓▓▓▓██████████████████████████
███████████████▓▓▓▓▓████████████████████▓▓▓▓▓█████████████████████████
██████████████▓▓▓██████████████████████████▓▓▓████████████████████████
████████████▓▓███████████████████████████████▓▓███████████████████████
██████████▓▓███████████████████████████████████▓▓█████████████████████
████████▓▓███████████████████████████████████████▓▓███████████████████
██████▓▓███████████████████████████████████████████▓▓█████████████████
█████▓███████████████████████████████████████████████▓████████████████
█████████████████████████ H A C K   M O D E █████████████████████
██████████████████████████████████████████████████████████████████████

            🔥 INSTALLATION COMPLETE — SYSTEM IN GL1TCH X-MODE 🔥
                 Made by ZALEE — Script Brutality Enabled
EOF

# GLITCH EXIT PULSE
for i in {1..12}; do
    printf "\033[38;2;$((RANDOM%255));0;0m"
    echo -ne "EXITING MATRIX....\r"
    sleep 0.07
done
printf "\033[0m\n"

###############################
# 🔥 GLITCH TIER 2 — RGB SHIFT
###############################
rgb_shift() {
    for i in {1..20}; do
        col=$((RANDOM%$(tput cols)))
        printf "\033[38;2;255;0;0m"; printf "%${col}s█\033[0m\r"
        sleep 0.015
        printf "\033[38;2;0;255;255m"; printf "%${col}s█\033[0m\r"
        sleep 0.015
    done
}

###############################
# 🔥 STATIC NOISE GLITCH
###############################
static_noise() {
    for i in {1..40}; do
        noise=""
        for x in {1..40}; do
            case $((RANDOM%4)) in
                0) char="▓" ;;
                1) char="▒" ;;
                2) char="░" ;;
                3) char="█" ;;
            esac
            noise="${noise}${char}"
        done
        printf "\033[38;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m$noise\033[0m\r"
        sleep 0.01
    done
}

###############################
# 🔥 SCANLINE — CRT EFFECT
###############################
scanline() {
    for i in {1..12}; do
        printf "\033[48;2;10;10;10m%$(tput cols)s\033[0m\r"
        sleep 0.02
        printf "\033[48;2;0;0;0m%$(tput cols)s\033[0m\r"
        sleep 0.02
    done
}

###############################
# 🔥 DOUBLE GL1TCH PULSE
###############################
glitch_pulse() {
    for i in {1..8}; do
        printf "\033[5;38;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))mGL1TCH PULSE...\033[0m\r"
        sleep 0.05
    done
    echo ""
}

###############################
# 🔥 RUN ALL TIER 2 EFFECTS
###############################
echo ""
echo -e "\033[1;35m>>> INITIATING GLITCH TIER 2 <<<\033[0m"
sleep 0.2

glitch_pulse
scanline
rgb_shift
static_noise

echo -e "\033[1;32m>>> EXIT SUCCESSFUL — MATRIX BREACHED <<<\033[0m"
echo ""
# FINAL SHAKE + NUKE
for i in {1..8}; do
    printf "\033[?5h"; sleep 0.03
    printf "\033[?5l"; sleep 0.03
done

# BLOOD TEXT FINISHER
echo -e "\033[31mF I N A L I Z I N G . . .\033[0m"
sleep 0.4

# ULTRA GLITCH
for i in {1..10}; do
    printf "\r\033[35m███ SYSTEM BREACHED ███\033[0m"
    sleep 0.05
    printf "\r\033[31m### %%$!@_CRITICAL_ERROR ###\033[0m"
    sleep 0.05
done
printf "\n"

###########################################
# 🔥 GLITCH TIER 3 — TERMINAL DOMINATION
###########################################

# MATRIX RAIN ULTRA
matrix_rain() {
    cols=$(tput cols)
    for _ in {1..40}; do
        line=""
        for ((i=0; i<cols; i++)); do
            rand=$((RANDOM%15))
            case $rand in
                0) char="1" ;;
                1) char="0" ;;
                2) char="▓" ;;
                3) char="░" ;;
                4) char="▄" ;;
                5) char="█" ;;
                *) char=" " ;;
            esac
            line="${line}${char}"
        done
        printf "\033[38;2;0;$((100+RANDOM%155));0m%s\033[0m\n" "$line"
        sleep 0.03
    done
}

# TERMINAL SHAKE ULTRA
shake_screen() {
    for _ in {1..18}; do
        printf "\033[?5h"; sleep 0.04    # invert
        printf "\033[?5l"; sleep 0.04    # normal
    done
}

# RGB RAINFALL
rgb_rain() {
    for _ in {1..50}; do
        printf "\033[38;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m█\033[0m"
        sleep 0.005
    done
    echo ""
}

# TERMINAL FLICKER
flicker() {
    for _ in {1..10}; do
        printf "\033[30m"; sleep 0.05
        printf "\033[97m"; sleep 0.05
    done
}

# GLITCH STUTTER
stutter() {
    text="S Y S T E M  B R E A C H E D . . ."
    for ((i=0; i<${#text}; i++)); do
        printf "\033[38;2;$((RANDOM%255));0;0m%s\033[0m" "${text:$i:1}"
        sleep 0.02
    done
    echo ""
}

##########################
# 🔥 RUN TIER 3 PACKAGE
##########################
echo -e "\033[1;31m>>> GLITCH TIER 3 INITIALIZED <<<\033[0m"
sleep 0.2

shake_screen
flicker
rgb_rain
stutter
matrix_rain

echo -e "\033[1;32m>>> TIER 3 COMPLETE — REALITY BENT <<<\033[0m"
echo ""

sleep 0.3
clear

cat << "EOF"

███████╗███╗   ██╗██████╗ 
██╔════╝████╗  ██║██╔══██╗
█████╗  ██╔██╗ ██║██║  ██║
██╔══╝  ██║╚██╗██║██║  ██║
███████╗██║ ╚████║██████╔╝
╚══════╝╚═╝  ╚═══╝╚═════╝ 

    ███████╗███████╗███╗   ██╗██████╗ 
    ██╔════╝██╔════╝████╗  ██║██╔══██╗
    ███████╗█████╗  ██╔██╗ ██║██║  ██║
    ╚════██║██╔══╝  ██║╚██╗██║██║  ██║
    ███████║███████╗██║ ╚████║██████╔╝
    ╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝ 

🔥  T E R M I N A L   O V E R D R I V E   C O M P L E T E  🔥
🔥  Z A L E E   M O D E   M E M B A R A   T A N P A   D O S A 🔥
🔥  G A   A D A   R U L E S • G A   A D A   B A T A S A N 🔥

EOF

# FINAL IDLE EFFECT
for i in {1..25}; do
    printf "\033[%d;%dH\033[36m▣\033[0m" $((RANDOM%20+1)) $((RANDOM%60+1))
    sleep 0.03
done

printf "\n\033[32m>> EXECUTION COMPLETE. SYSTEM LEFT IN RUINS.\033[0m\n\n"
