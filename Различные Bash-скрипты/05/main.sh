#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Ошибка: неправильное количество аргументов"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Ошибка: данная папка не существует"
    exit 1
fi

abs_path=$(realpath "$1")

start_time=$(date +%s)

./count_dirs.sh "$abs_path"
./top_5_folders.sh "$abs_path"
./count_files.sh "$abs_path"
./count_types.sh "$abs_path"
./top_10_files.sh "$abs_path"
./top_10_execs.sh "$abs_path"

end_time=$(date +%s)
execution_time=$((end_time-start_time))
echo "Script execution time (in seconds) = $execution_time"
