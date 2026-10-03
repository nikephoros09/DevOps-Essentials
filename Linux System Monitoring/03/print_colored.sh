#!/bin/bash

print_colored() {
    printf "\e[%s;%sm%s =\e[0m\e[%s;%sm %s\e[0m\n" \
        "$name_bg_code" "$name_font_code" "$1" \
        "$val_bg_code" "$val_font_code" "$2"
}
