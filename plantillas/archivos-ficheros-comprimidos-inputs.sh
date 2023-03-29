#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls"
    "Comprimir archivo gzip:|echo 'Ingrese el nombre del archivo:' && read archivo && gzip $archivo"
    "Descomprimir archivo gzip:|echo 'Ingrese el nombre del archivo:' && read archivo && gunzip $archivo.gz"
    "Comprimir archivo gzip con máxima compresión:|echo 'Ingrese el nombre del archivo:' && read archivo && gzip -9 $archivo"
    "Comprimir archivo bzip2:|echo 'Ingrese el nombre del archivo:' && read archivo && bzip2 $archivo"
    "Descomprimir archivo bzip2:|echo 'Ingrese el nombre del archivo:' && read archivo && bunzip2 $archivo.bz2"
    "Crear archivo tar descomprimido:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -cvf $archivo.tar file1"
    "Crear archivo tar con varios archivos y directorios:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -cvf $archivo.tar file1 file2 dir1"
    "Mostrar contenido de archivo tar:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -tf $archivo"
    "Extraer archivo tar:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -xvf $archivo"
    "Extraer archivo tar en directorio específico:|echo 'Ingrese el nombre del archivo:' && read archivo && echo 'Ingrese el directorio de destino:' && read directorio && tar -xvf $archivo -C $directorio"
    "Crear archivo tar comprimido en bzip2:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -cvfj $archivo.tar.bz2 dir1"
    "Descomprimir archivo tar comprimido en bzip2:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -xvfj $archivo.tar.bz2"
    "Crear archivo tar comprimido en gzip:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -cvfz $archivo.tar.gz dir1"
    "Descomprimir archivo tar comprimido en gzip:|echo 'Ingrese el nombre del archivo:' && read archivo && tar -xvfz $archivo.tar.gz"
    "Crear archivo comprimido en zip:|echo 'Ingrese el nombre del archivo:' && read archivo && zip $archivo.zip file1"
    "Crear archivo comprimido en zip con varios archivos y directorios:|echo 'Ingrese el nombre del archivo:' && read archivo && zip -r $archivo.zip file1 file2 dir1"
    "Descomprimir archivo zip:|echo 'Ingrese el nombre del archivo:' && read archivo && unzip $archivo.zip"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}" # Imprimimos el índice de la opción y su nombre (sin el comando correspondiente).
    done
    read opcion

    # Validamos que la opción ingresada sea un número válido dentro del rango de opciones.
    if [[ $opcion =~ ^[0-9]+$ ]] && [ $opcion -ge 0 ] && [ $opcion -lt ${#opciones[@]} ]; then
        clear
        comando="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$comando"                   # Ejecutamos el comando.
        echo ""
        echo "Presione Enter para continuar..."
        read
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read
    fi

done


# echo -n "Escribe un número: "
# read valor

# if [ $valor -gt 5 -o $valor -lt 10 ]; then
#     echo "Tu numero es mayor que 5 o menor que 10"
# elif [ $valor -ge 5 -a $valor -le 10 ]; then
#     echo "Tu numero está en el rango [5, 10]"
# elif [ $valor -eq 5 -o $valor -eq 10 ]; then
#     echo "Tu numero es igual a 5 o a 10"
# elif [ $valor -ne 5 -a $valor -ne 10 ]; then
#     echo "Tu numero es distinto a 5 y a 10"
# fi
#Operadores relacionales
#-eq: igual a
#-ne: no es igual a
#-gt: Mator a
#-ge: Mayor o igual igual a
#-lt: Menor a
#-le: Menor o igual a