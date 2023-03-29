#!/bin/bash

echo "Para leer archivo escribimos ./read-line.sh yeaaa.txt"
input_name=$1
echo "-------Lectura de archivos------------"
cat "$input_name"
echo "-------Lectura de archiovos Linea por Linea------------"
echo "IFS Internal field separator, para leer linea por linea"
while read -r line; do
    echo "== $line =="
done < "$input_name"
