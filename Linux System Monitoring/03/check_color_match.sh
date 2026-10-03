#!/bin/bash

check_color_match() {
    if [ "$1" -eq "$2" ]; then
        echo "Ошибка: цвета шрифта и фона совпадают. Выберите другие варианты."
        exit 1
    fi
}
