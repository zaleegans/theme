#!/bin/bash set -e ################## [ ZALEETHEME BRUTAL MODE v4 ] ##################

Warna

CYAN="\033[1;36m" GREEN="\033[1;32m" RED="\033[1;31m" YELLOW="\033[1;33m" MAGENTA="\033[1;35m" NC="\033[0m"

printf "${MAGENTA}" printf "\n==============================================================\n" printf "🔥  Z A L E E T H E M E   B R U T A L   M O D E   L O A D E D  🔥\n" printf "==============================================================\n\n" printf "${NC}"

################## PACK 4 — INSANE BRUTAL MODE ##################

pulse() { for i in {1..8}; do printf "\033[48;2;255;0;0m%$(tput cols)s\033[0m\r" sleep 0.06 printf "\033[48;2;0;0;0m%$(tput cols)s\033[0m\r" sleep 0.06 done printf "\n" }

turbulence() { for i in {1..20}; do printf "\033[%d;%dH⚡" $((RANDOM%20+1)) $((RANDOM%50+1)) sleep 0.03 done printf "\033[0m\n" }

wave() { for i in {1..25}; do line=$(printf "%*s" $((RANDOM%$(tput cols))) | tr ' ' '~') echo -e "\033[35m$line\033[0m" sleep 0.02 done }

nuke_flash() { for i in {1..4}; do printf "\033[?5h"; sleep 0.04 printf "\033[?5l"; sleep 0.04 done }

screen_crack() { cat << "EOF" \  |  /       CRACK --  ███  --
/  |  \
EOF }

rgb_slide() { width=$(tput cols) for i in {1..width}; do printf "\033[48;2;$((RANDOM%255));$((RANDOM%255));$((RANDOM%255))m " sleep 0.005 done printf "\033[0m\n" }

hellfire() { cat << "EOF" 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥 🔥 H E L L F I R E   M O D E   O N 🔥 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥 EOF }

alarm() { for i in {1..8}; do echo -ne "\007"
printf "\033[41m!!! ALERT !!!\033[0m\r" sleep 0.1 printf "\033[43m!!! ALERT !!!\033[0m\r" sleep 0.1 done printf "\n" }
#!/bin/bash

===============[ ZALEETHEME BRUTAL MODE — PART 2 ]====================

Fitur tambahan lanjutan — AMAN, TANPA ERROR, SIAP TEMPEL

Langsung lanjutkan setelah PART 1

=====================================================================

Warna

CYAN="\033[1;36m" GREEN="\033[1;32m" RED="\033[1;31m" YELLOW="\033[1;33m" MAGENTA="\033[1;35m" NC="\033[0m"

printf "${CYAN}▶ BRUTAL MODE PART 2 LOADED${NC}\n"

==========================

Fitur 1: Anti Freeze Terminal

==========================

trap '' SIGTSTP SIGINT SIGQUIT printf "${GREEN}[✔] Terminal Anti-Freeze aktif${NC}\n"

==========================

Fitur 2: Auto Force Clear Cache Sistem

==========================

printf "${YELLOW}[~] Membersihkan cache memori...${NC}\n" sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null printf "${GREEN}[✔] Cache dibersihkan${NC}\n"

==========================

Fitur 3: Log Brutal Mode

==========================

LOGFILE="/root/zaleetheme_brutal.log" echo "$(date) : Brutal mode part 2 executed" >> $LOGFILE printf "${GREEN}[✔] Log tercatat di $LOGFILE${NC}\n"

==========================

Fitur 4: Auto Fix Permission Pterodactyl

==========================

printf "${YELLOW}[~] Memperbaiki permission panel...${NC}\n" chown -R www-data:www-data /var/www/pterodactyl 2>/dev/null chmod -R 755 /var/www/pterodactyl 2>/dev/null printf "${GREEN}[✔] Permission OK${NC}\n"

==========================

Fitur 5: Anti Error Jalur Folder

==========================

mkdir -p /var/www/pterodactyl/public/assets >/dev/null 2>&1 printf "${GREEN}[✔] Folder assets aman${NC}\n"

printf "${MAGENTA}▶ PART 2 SELESAI — SIAP LANJUT PART 3${NC}\n"
########################## [ PART 3 — TOTAL BRUTAL DESTRUCTION PACK ] ##########################

# 💢 Earthquake Ultra (guncangan brutal level 10)
mega_quake() {
    for i in {1..40}; do
        printf "\033[2J\033[1;1H"
        printf "\033[3%dm" $((RANDOM % 7))
        offset=$((RANDOM % 20))
        printf "%${offset}s🔥 ZALEE SHAKE 🔥\n"
        sleep 0.03
    done
    printf "\033[0m"
}

# 🩸 Bloody Text Rain (hujan darah ASCII)
blood_rain() {
    cols=$(tput cols)
    for i in {1..25}; do
        col=$((RANDOM % cols))
        printf "\033[1;31m%${col}s▌\033[0m\n"
        sleep 0.02
    done
}

# 🚀 Hyper Launch Blast (roket launching brutal)
hyper_launch() {
    for i in {1..15}; do
        printf "\033[2J\033[1;1H"
cat << "EOF"
        ▲
       ▲ ▲
      ▲   ▲
     ▲     ▲    ROCKET LIFT-OFF
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
EOF
        sleep 0.05
    done
}

# ⚡ CHAOS SPARKS (kilatan random brutal)
chaos_sparks() {
    for i in {1..50}; do
        printf "\033[%d;%dH\033[1;33m⚡\033[0m" $((RANDOM%20+1)) $((RANDOM%60+1))
        sleep 0.01
    done
    printf "\033[0m\n"
}

# 🕳️ Terminal Collapse (terminal runtuh brutal)
collapse() {
    height=$(tput lines)
    for ((i=height; i>0; i--)); do
        printf "\033[2J\033[${i};1H\033[1;31m██████████████████████████████\033[0m"
        sleep 0.03
    done
}

# 🔥 Inferno Wall (tembok api brutal)
inferno() {
    for i in {1..10}; do
cat << "EOF"
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
EOF
        sleep 0.07
    done
}

# 🧨 Detonation Shockwave (gelombang ledakan)
shockwave() {
    for r in {1..20}; do
        printf "\033[2J"
        for ((i=0; i<r; i++)); do
            printf "%${r}s\033[35m*\033[0m\n"
        done
        sleep 0.02
    done
}

# 💀 DEMONIC BANNER (banner iblis brutal)
demonic_banner() {
cat << "EOF"
██████╗ ███████╗███╗   ███╗ ██████╗ ███╗   ██╗██╗ ██████╗
██╔══██╗██╔════╝████╗ ████║██╔═══██╗████╗  ██║██║██╔════╝
██████╔╝█████╗  ██╔████╔██║██║   ██║██╔██╗ ██║██║██║  ███╗
██╔══██╗██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║██║██║   ██║
██║  ██║███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║╚██████╔╝
╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝
EOF
}

###################################################################################
# === END OF PART 3 BRUTAL PACK — SIAP DI COMBINE DENGAN SEKUENS LAIN 🔥💀 ========
###################################################################################
########################## [ PART 4 — GODMODE BRUTAL PACK ] ##########################

# 💠 Quantum Shift (layar geser secara acak)
quantum_shift() {
    for i in {1..30}; do
        off=$((RANDOM % 20))
        printf "\033[2J\033[${off}C\033[${off}B"
        printf "\033[3%dm  Q U A N T U M  S H I F T  \033[0m\n" $((RANDOM % 7))
        sleep 0.03
    done
}

# 🔱 Divine Lightning (petir dewa turun ke terminal)
divine_lightning() {
    for i in {1..20}; do
        col=$((RANDOM % $(tput cols)))
        printf "\033[1;37m%${col}s⚡⚡⚡\033[0m\n"
        sleep 0.03
    done
}

# 🌀 Black Hole Warp (layar tersedot ke dalam lubang hitam)
blackhole() {
    cols=$(tput cols)
    for i in $(seq $cols -1 1); do
        printf "\033[2J"
        printf "%${i}s●\n"
        sleep 0.01
    done
}

# 🔥 Phoenix Rebirth (terminal terbakar lalu hidup kembali)
phoenix() {
    for i in {1..10}; do
cat << "EOF"
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
      P H O E N I X   R E B I R T H
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
EOF
        sleep 0.07
    done
}

# ⚔️ God Slash (tebasan energi memotong layar)
god_slash() {
    for i in {1..15}; do
        printf "\033[2J"
cat << "EOF"
               ⚔️
                \\
                 \\
                  \\\\    *SLASH*
                   \\\\
                    \\\\
EOF
        sleep 0.03
    done
}

# 🎭 Mirage Echo (bayangan terminal menari)
mirage() {
    for i in {1..10}; do
        printf "\033[2J"
        printf "\033[3%dm=== MIRAGE ECHO ===\033[0m\n" $((RANDOM % 7))
        sleep 0.05
    done
}

# 🌌 Cosmic Starfall (jatuhan bintang acak di layar)
starfall() {
    for i in {1..40}; do
        printf "\033[%d;%dH\033[1;36m*\033[0m" $((RANDOM%20+1)) $((RANDOM%60+1))
        sleep 0.01
    done
    printf "\033[0m\n"
}

# 🧿 God Eye Activation (mata dewa muncul)
god_eye() {
cat << "EOF"
           ███████████████████
           █   👁   G O D   👁   █
           ███████████████████
EOF
}

# 🔥 Ultimate Hellstorm (badai api terminal)
hellstorm() {
    for i in {1..12}; do
        printf "\033[2J"
cat << "EOF"
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
            H E L L S T O R M
🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
EOF
        sleep 0.06
    done
}

###################################################################################
# === END OF GODMODE PACK — SEMUA EFEK SIAP KAMU COMBINE 💀🔥⚡ ===================
###################################################################################
########################## [ PART 5 — APOCALYPSE FINAL BOSS PACK ] ##########################

# 🌋 VOLCANIC ERUPTION — layar meledak warna magma
volcano() {
    for i in {1..25}; do
        printf "\033[48;2;255;$((RANDOM%100));0m%$(tput cols)s\033[0m\n"
        sleep 0.02
    done
}

# 🌪 APOCALYPSE STORM — badai ASCII ngacak terminal
apocalypse_storm() {
    for i in {1..40}; do
        printf "\033[%d;%dH\033[1;31m#\033[0m" $((RANDOM%25+1)) $((RANDOM%70+1))
        printf "\033[%d;%dH\033[1;33m@\033[0m" $((RANDOM%25+1)) $((RANDOM%70+1))
        printf "\033[%d;%dH\033[1;37m*\033[0m" $((RANDOM%25+1)) $((RANDOM%70+1))
        sleep 0.02
    done
}

# 💀 DOOM TEXT — tulisan getar + glitch + gila
doom_text() {
    text=" A P O C A L Y P S E   I N I T I A T E D "
    for i in {1..12}; do
        offset=$((RANDOM%4))
        printf "\033[%dC\033[31m%s\033[0m\r" "$offset" "$text"
        sleep 0.05
    done
    printf "\n"
}

# 🌘 DARK VOID — layar hitam total dengan titik misterius
dark_void() {
    printf "\033[40m"
    printf "\033[2J"
    for i in {1..8}; do
        printf "\033[%d;%dH\033[1;35m●\033[0m" $((RANDOM%25+1)) $((RANDOM%70+1))
        sleep 0.08
    done
}

# ⚡ RAGNAROK — flash putih brutal
ragnarok_flash() {
    for i in {1..6}; do
        printf "\033[47m\033[2J"
        sleep 0.03
        printf "\033[40m\033[2J"
        sleep 0.03
    done
}

# 🔥 FINAL BOSS — ASCII Boss muncul
final_boss() {
cat << "EOF"
███████╗██╗███╗   ██╗ █████╗ ██╗     
██╔════╝██║████╗  ██║██╔══██╗██║     
█████╗  ██║██╔██╗ ██║███████║██║     
██╔══╝  ██║██║╚██╗██║██╔══██║██║     
██║     ██║██║ ╚████║██║  ██║███████╗
╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
EOF
}

# 🩸 BLOOD RAIN — hujan darah turun dari atas
blood_rain() {
    cols=$(tput cols)
    for i in {1..30}; do
        pos=$((RANDOM%cols))
        printf "\033[31m%${pos}s|\033[0m\n"
        sleep 0.01
    done
}

# 🧨 CHAOS BREAK — glitch layar ancur acak
chaos_break() {
    for i in {1..20}; do
        printf "\033[1;3%dm%$(tput cols)s\033[0m\n" $((RANDOM%8))
        sleep 0.01
    done
}

# 🌑 BLACKOUT — terminal mati 1 detik
blackout() {
    printf "\033[40m\033[2J"
    sleep 1
    printf "\033[0m"
}

# 🔥🔥 FINAL APOCALYPSE SEQUENCE 🔥🔥
apocalypse_sequence() {
    volcano
    doom_text
    blood_rain
    chaos_break
    dark_void
    ragnarok_flash
    final_boss
    apocalypse_storm
    blackout
}

####################################################################################
# === END PART 5 — APOCALYPSE FINAL BOSS PACK COMPLETE 💀🔥🌋⚡ =====================
####################################################################################
################## PACK 6 — APOCALYPSE MODE ##################

# ⚡ SCREEN MELT (layar meleleh kayak lava)
melt() {
    for i in {1..15}; do
        col=$(tput cols)
        printf "\033[38;2;$((RANDOM%255));50;50m"
        printf "%*s\n" $col | tr ' ' '#'
        sleep 0.03
    done
    printf "\033[0m"
}

# 🌪 TERMINAL SHAKE EXTREME (goyang level gempa bumi)
quake() {
    for i in {1..20}; do
        printf "\033[2J"
        printf "\033[%d;%dH💀" $((RANDOM%20+1)) $((RANDOM%50+1))
        sleep 0.02
    done
    printf "\033[0m"
}

# 🔥 ASCII FIRESTORM (badai api)
firestorm() {
    for i in {1..25}; do
        echo -e "\033[31m🔥🔥🔥   🔥🔥🔥\033[0m"
        sleep 0.03
    done
}

# ⚡ STATIC NOISE (efek TV rusak)
static_noise() {
    for i in {1..40}; do
        line=$(head -c 60 /dev/urandom | tr -dc '░▒▓█')
        echo -e "\033[37m$line\033[0m"
        sleep 0.01
    done
}

# 💥 TERMINAL DISINTEGRATE (hancur pelan-pelan)
disintegrate() {
    cols=$(tput cols)
    for i in $(seq $cols -1 1); do
        printf "\033[1;31m%*s\r" $i "■■■■■■■■■■■■■■■■"
        sleep 0.01
    done
    printf "\033[0m\n"
}

# 💀 DEMON BANNER
demon_banner() {
cat << "EOF"
███████╗██████╗ ██╗███████╗███╗   ███╗
██╔════╝██╔══██╗██║██╔════╝████╗ ████║
█████╗  ██████╔╝██║█████╗  ██╔████╔██║
██╔══╝  ██╔══██╗██║██╔══╝  ██║╚██╔╝██║
███████╗██║  ██║██║███████╗██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝     ╚═╝
EOF
}

# 🚨 APOCALYPSE WARNING BLINK
apocalypse_alert() {
    for i in {1..6}; do
        printf "\033[41m APOCALYPSE MODE ACTIVE \033[0m\r"
        sleep 0.1
        printf "\033[45m APOCALYPSE MODE ACTIVE \033[0m\r"
        sleep 0.1
    done
    printf "\n"
}

##############################################################
