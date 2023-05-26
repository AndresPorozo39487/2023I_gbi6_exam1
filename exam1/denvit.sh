#!/bin/bash

# Carpeta base
base_folder="data/denvint"

# Archivo de salida
output_file="denint.csv"

# Array con los nombres de los archivos .csv
csv_files=("archivo1.csv" "archivo2.csv" "archivo3.csv" "archivo4.csv")

# Crear el archivo de salida y escribir el encabezado
echo "Archivo,Filas,Columnas" > "$output_file"

# Bucle para contar filas y columnas de los archivos .csv
for file in "${csv_files[@]}"; do
    # Contar filas
    rows=$(wc -l < "$base_folder/$file")
    # Contar columnas
    columns=$(awk -F, '{print NF; exit}' "$base_folder/$file")
    # Escribir el resultado en el archivo de salida
    echo "$file,$rows,$columns" >> "$output_file"
done

echo "Conteo completado. Los resultados se han guardado en $output_file."
