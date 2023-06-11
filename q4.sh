#!/bin/bash

# Read the matrix from a file
read_matrix() {
    local file="$1"
    local matrix=()

    while IFS= read -r line; do
        matrix+=("$line")
    done < "$file"

    echo "${matrix[@]}"
}

# Transpose the matrix
transpose_matrix() {
    local matrix=("$@")
    local rows="${#matrix[@]}"
    local cols="${#matrix[0]}"

    for ((j = 0; j < cols; j++)); do
        for ((i = 0; i < rows; i++)); do
            echo -n "${matrix[$i]}" | awk -v j="$j" '{print $j}'
        done
        echo
    done
}

# Usage: ./transpose_matrix.sh <filename>
filename="$1"

# Read the matrix from the file
matrix=$(read_matrix "$filename")

# Transpose the matrix and print it in standard 2D matrix format
transpose_matrix "$matrix"
