#!/bin/bash

# Archivo de entrada
input_file="data/mahomes/sites.csv"

# Archivo de salida para las columnas extraídas
output_file="pdb.csv"

# Archivo de salida para el conteo de tipos únicos
count_file="pdb_count.csv"

# Extraer las columnas "resName1", "PDB Classification" y "Uniprot Acc" y guardar en pdb.csv
cut -d"," -f1,4,5 "$input_file" > "$output_file"

# Calcular el conteo de tipos únicos en cada columna y guardar en pdb_count.csv
echo "Columna,Conteo de Tipos Únicos" > "$count_file"
cut -d"," -f1 "$output_file" | sort | uniq -c | awk '{print $2","$1}' >> "$count_file"
cut -d"," -f2 "$output_file" | sort | uniq -c | awk '{print $2","$1}' >> "$count_file"
cut -d"," -f3 "$output_file" | sort | uniq -c | awk '{print $2","$1}' >> "$count_file"

echo "Proceso completado. Los resultados se han guardado en $output_file y $count_file."
