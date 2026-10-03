#!/bin/bash
source ./output.sh
output=$(get_output)
echo "$output"
read -p "Вы бы хотели сохранить информацию в файл? (Y/N): " answer

if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    filename="$(date +"%d_%m_%y_%H_%M_%S").status"
    echo "$output" > "./$filename"
    echo "Информация сохранена в файл $filename"
else
    echo "Информация не сохранена"
fi
