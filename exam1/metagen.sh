#!/bin/bash

# Archivo de entrada para el análisis de registros
input_file="data/metagen/infants_metagenome.txt"

# Archivo de entrada para la búsqueda de fragmentos de interés
sam_file="data/metagen/mygenomemap.sam"

# Archivo de salida para los registros hasta el nivel de especies
output_file="species_records.txt"

# Archivo de salida para los fragmentos de interés
fragment_file="gata.txt"

# Contar los registros hasta el nivel de especies en infants_metagenome.txt
species_count=$(grep -c "species" "$input_file")

# Guardar los registros hasta el nivel de especies en species_records.txt
grep "species" "$input_file" > "$output_file"

# Buscar los fragmentos de interés en mygenomemap.sam y guardarlos en gata.txt
grep -E "TATA|GAGA|GATA" "$sam_file" > "$fragment_file"

echo "Análisis completado. Se encontraron $species_count registros hasta el nivel de especies en $input_file."
echo "Los fragmentos de interés se han guardado en $fragment_file."
