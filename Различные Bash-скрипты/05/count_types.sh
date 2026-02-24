#!/bin/bash

conf_files=$(find "$1" -maxdepth 1 -type f -name "*.conf" | wc -l)
txt_files=$(find "$1" -maxdepth 1 -type f -name "*.txt" | wc -l)
exec_files=$(find "$1" -maxdepth 1 -type f -executable | wc -l)
log_files=$(find "$1" -maxdepth 1 -type f -name "*.log" | wc -l)
archive_files=$(find "$1" -maxdepth 1 -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.tar.gz" -o -name "*.rar" -o -name "*.7z" \) | wc -l)
symlinks=$(find "$1" -maxdepth 1 -type l | wc -l)

echo "Number of: "
echo "Configuration files (with the .conf extension) = $conf_files"
echo "Text files = $txt_files"
echo "Executable files = $exec_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symlinks"
