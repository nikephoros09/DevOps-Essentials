#!/bin/bash
source ./functions.sh
config_file="./config.conf"

if [[ -f "$config_file" ]]; then
    source "$config_file" 
fi

column1_background="${column1_background:-6}"
column1_font_color="${column1_font_color:-1}"
column2_background="${column2_background:-1}"
column2_font_color="${column2_font_color:-6}"

check_args "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"
check_color_match "$column1_background" "$column1_font_color"
check_color_match "$column2_background" "$column2_font_color"

bg_colors=(0 47 41 42 44 45 40) 
font_colors=(0 37 31 32 34 35 30) 

color_names=("filler" "white" "red" "green" "blue" "purple" "black")






