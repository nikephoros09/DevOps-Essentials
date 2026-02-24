#!/bin/bash

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

count=1
find "$1" -maxdepth 1 -type f -executable -printf "%s %p\n" 2>/dev/null | sort -nr | head -n 10 | while read -r size path; do
    hash=$(md5sum "$path" | awk '{print $1}')
    human_size=$(numfmt --to=iec --suffix=B --format="%.1f" "$size")
    echo "$count - $path, $human_size, $hash"
    count=$((count+1))
done
