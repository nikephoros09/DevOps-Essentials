#!/bin/bash

source "$(dirname "$0")/validation.sh"

input="$1"

if [[ "$input" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
    echo "Неправильный ввод: число"
    exit 1
else
    echo "$input"
fi
