#!/bin/bash

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

mapfile -t top_files < <(
find "$1" -maxdepth 1 -type f -exec du -sh {} + 2>/dev/null | 
    sort -hr | head -n 10  |
    awk '{printf "%d - %s, %s\n", NR, substr($0, index($0,$2)), $1}'
)

./array_formatting.sh "${top_files[@]}"
