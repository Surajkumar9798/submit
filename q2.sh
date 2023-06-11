#!/bin/bash

directory="Modified"  # Replace with your directory path

# Get the current date and time
current_datetime=$(date +'%Y-%m-%d_%H-%M-%S')

# Iterate over each file in the directory
for file in $directory/*; do
    if [[ -f $file ]]; then
        # Get the base file name and extension
        base_name=$(basename "$file")
        extension="${base_name##*.}"
        
        # Construct the new file name with appended date and time
        new_file_name="${base_name%.*}_${current_datetime}.${extension}"
        
        # Rename the file
        mv "$file" "$directory/$new_file_name"
    fi
done
