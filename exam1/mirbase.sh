#!/bin/bash

# Archivo miRNA.dat
mirna_file="data/miRNA.dat"

# Contar el número de artículos en el archivo miRNA.dat
article_count=$(grep -c "PUBMED" "$mirna_file")

# Contar el número de estudios de micro RNA en la revista Nature
nature_count=$(grep -c "Nature" "$mirna_file")

# Contar el número de estudios de micro RNA en la revista Nature sobre C. elegans
elegans_count=$(grep -c "elegans" "$mirna_file" | grep -c "Nature")

echo "Número de artículos en miRNA.dat: $article_count"
echo "Número de estudios de micro RNA en la revista Nature: $nature_count"
echo "Número de estudios de micro RNA en la revista Nature sobre C. elegans: $elegans_count"
