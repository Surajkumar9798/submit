#!/bin/bash

clear

echo "Enter the directory:"
read -r dir

cd "$dir" || exit

mkdir -p "modified"

find "$dir" -type f -name "*.txt" | while IFS= read -r file; do
    base=$(basename "$file")
    cp "$file" "$dir/modified/${base%.*}.bak"
done
