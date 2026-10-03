#!/bin/bash

check_args() {
    for param in "$@"; do
        if ! [[ "$param" =~ ^[1-6]$ ]]; then
            echo "Ошибка: аргументы должны быть числами от 1 до 6"
            exit 1
        fi
    done
}
