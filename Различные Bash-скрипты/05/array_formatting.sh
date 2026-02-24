#!/bin/bash

input_array=("$@")
for str in "${input_array[@]}"; do
    local_str=($str)
    penultimate="${local_str[-2]}"
    name="${penultimate##*/}"
    pure_name="${name%.[^.]*}"
    format="${name:${#pure_name} + 1}"
    if [[ -z "$format" ]]; then
      neat_format="other"
    elif [[ "$format" =~ ^[0-9]+.$ ]]; then
      neat_format="log"
    else
      neat_format="${format:0:-1}"
    fi
    modified_str="$str, $neat_format"
    echo "$modified_str"
done
