#!/bin/bash

# Función recursiva para buscar archivos con una extensión específica
search_files() {
    local folder="$1"
    local extension="$2"
    local count=$(find "$folder" -type f -name "*$extension" | wc -l)
    echo "$extension: $count"
}

# Carpeta base
base_folder="data/singlecell"

# Tipos de extensiones de archivos a buscar
extensions=("csv" "txt" "tsv" "gz" "png")

# Archivo de salida
output_file="extensiones.txt"

# Bucle para buscar y contar las extensiones de archivos en las subcarpetas
for extension in "${extensions[@]}"; do
    count=$(search_files "$base_folder" ".$extension")
    echo "$count" >> "$output_file"
done

echo "Búsqueda completada. El conteo se ha guardado en $output_file."
