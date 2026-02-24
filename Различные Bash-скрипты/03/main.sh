#!/bin/bash

source ./check_args.sh
source ./check_color_match.sh
source ./print_colored.sh

if [ $# -ne 4 ]; then
    echo "Ошибка: неправильное количество аргументов"
    exit 1
fi

check_args "$@"
check_color_match "$1" "$2"
check_color_match "$3" "$4"

font_codes=(0 37 31 32 34 35 30)       
bg_codes=(0 47 41 42 44 45 40)

name_bg_code=${bg_codes[$1]}
name_font_code=${font_codes[$2]}
val_bg_code=${bg_codes[$3]}
val_font_code=${font_codes[$4]}

print_colored "HOSTNAME" "$(hostname)"
print_colored "TIMEZONE" "$(timedatectl | awk '/Time zone/ {print $3}') UTC $(date | awk '{print $6}')"
print_colored "USER" "$(whoami)"
print_colored "OS" "$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
print_colored "DATE" "$(date +"%d %B %Y %T")"
print_colored "UPTIME" "$(uptime -p | cut -d' ' -f2-)"
print_colored "UPTIME_SEC" "$(awk '{ print $1 }' /proc/uptime)"
print_colored "IP" "$(hostname -I | awk '{ print $1 }')"
print_colored "MASK" "$(ifconfig enp0s3 | awk '/netmask/{print $4}')"
print_colored "GATEWAY" "$(ip route | awk '/default/ {print $3}')"
print_colored "RAM_TOTAL" "$(free | awk '/Mem:/ {printf "%.3f", $2/1024/1024}') GB"
print_colored "RAM_USED" "$(free | awk '/Mem:/ {printf "%.3f", $3/1024/1024}') GB"
print_colored "RAM_FREE" "$(free | awk '/Mem:/ {printf "%.3f", $4/1024/1024}') GB"
print_colored "SPACE_ROOT" "$(df / | awk 'NR==2 {printf "%.2f", $2/1024}') MB"
print_colored "SPACE_ROOT_USED" "$(df / | awk 'NR==2 {printf "%.2f", $3/1024}') MB"
print_colored "SPACE_ROOT_FREE" "$(df / | awk 'NR==2 {printf "%.2f", $4/1024}') MB"
