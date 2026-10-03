check_color_match() {
    if [ "$1" -eq "$2" ]; then
        echo "Ошибка: цвета шрифта и фона совпадают. Выберите другие варианты"
        exit 1
    fi
}

print_colored() {
    printf "\e[%s;%sm%s =\e[0m\e[%s;%sm %s\e[0m\n" \
        "$column1_bg_code" "$column1_font_code" "$1" \
        "$column2_bg_code" "$column2_font_code" "$2"
}

check_args() {
    for param in "$@"; do
        if ! [[ "$param" =~ ^[1-6]$ ]]; then
            echo "Ошибка: аргументы должны быть числами от 1 до 6"
            exit 1
        fi
    done
}