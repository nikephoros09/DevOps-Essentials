#!/bin/bash
get_output (){
    echo "HOSTNAME = $(hostname)"    
    echo "TIMEZONE = $(timedatectl | awk '/Time zone/ {print $3}') UTC $(date | awk '{print $6}')"
    echo "USER = $(whoami)"
    echo "OS = $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2-)"
    echo "DATE = $(date +"%d %B %Y %T")"
    echo "UPTIME = $(uptime -p | cut -d' ' -f2-)"
    echo "UPTIME_SEC = $(awk '{ print $1 }' /proc/uptime)"
    echo "IP = $(hostname -I | awk '{ print $1 }')"
    echo "MASK = $(ifconfig enp0s3 | awk '/netmask/{print $4}')"
    echo "GATEWAY = $(ip route | awk '/default/ {print $3}')"
    echo "RAM_TOTAL = $(free | awk '/Mem:/ {printf("%.3f", $2/1024/1024)}') GB"
    echo "RAM_USED = $(free | awk '/Mem:/ {printf("%.3f", $3/1024/1024)}') GB"
    echo "RAM_FREE = $(free | awk '/Mem:/ {printf("%.3f", $4/1024/1024)}') GB"
    echo "SPACE_ROOT = $(df /root | awk 'NR==2 {printf("%.2f", $2/1024)}') MB"
    echo "SPACE_ROOT_USED = $(df /root | awk 'NR==2 {printf("%.2f", $3/1024)}') MB"
    echo "SPACE_ROOT_FREE = $(df /root | awk 'NR==2 {printf("%.2f", $4/1024)}') MB"
}