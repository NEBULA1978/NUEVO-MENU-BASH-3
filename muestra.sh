#!/bin/bash
# Muestra el tamaño de los directorios home
if [ $(id -u) -ne 0 ]; then
    echo "[ERROR] - El script se debe ejecutar como root"
    exit 1
fi

for dir in $(ls /home); do
    echo "Directorio: $dir"
    ls -ld /home/$dir
    du -sh /home/$dir
done
