#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <current_file> <directory>"
    exit 1
fi

current_file="$1"
directory="$2"

# Check if directory exists
if [ ! -d "$directory" ]; then
    echo "Directory $directory not found."
    exit 1
fi

# Change to directory
cd "$directory" || exit

# Get list of files in directory
files=(*)

# Check if current file is in directory
if [[ ! " ${files[@]} " =~ " ${current_file} " ]]; then
    echo "File $current_file not found in $directory."
    exit 1
fi

# Find index of current file in array
index=-1
for i in "${!files[@]}"; do
    if [[ "${files[$i]}" == "$current_file" ]]; then
        index=$i
        break
    fi
done

# Echo next file cyclically
next_index=$(( (index + 1) % ${#files[@]} ))
echo "${files[$next_index]}"
