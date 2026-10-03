#!/bin/bash

total_files=$(find "$1" -maxdepth 1 -type f | wc -l)
echo "Total number of files = $total_files"
