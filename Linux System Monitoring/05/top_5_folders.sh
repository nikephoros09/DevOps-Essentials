#!/bin/bash

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
find "$1" -mindepth 1 -maxdepth 1 -type d -exec du -sh {} \; 2>/dev/null | sort -hr | head -n 5 | awk '{printf "%d - %s, %s\n", NR, $2, $1}'

