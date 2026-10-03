#!/bin/bash

dirs_num=$(find "$1" -mindepth 1 -type d | wc -l)
echo "Total number of folders (including all nested ones) = $dirs_num"
