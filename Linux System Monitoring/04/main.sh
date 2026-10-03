#!/bin/bash

source ./get_cols.sh
source ./functions.sh

column1_bg_code=${bg_colors[$column1_background]}
column1_font_code=${font_colors[$column1_font_color]}
column2_bg_code=${bg_colors[$column2_background]}
column2_font_code=${font_colors[$column2_font_color]}

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

echo ""
echo "Column 1 background = ${column1_background} (${color_names[$column1_background]})"
echo "Column 1 font color = ${column1_font_color} (${color_names[$column1_font_color]})"
echo "Column 2 background = ${column2_background} (${color_names[$column2_background]})"
echo "Column 2 font color = ${column2_font_color} (${color_names[$column2_font_color]})"
