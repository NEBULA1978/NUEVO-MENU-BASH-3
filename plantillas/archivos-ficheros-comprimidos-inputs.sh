#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls"
    "Instalar programa:|echo '¿Desea instalar el programa? [s/n]:' && read respuesta && [ \"$respuesta\" == \"s\" ] && echo 'Instalando programa...' || echo 'Programa no instalado.'"
    "Entrar en carpeta:|echo 'Ingrese el nombre de la carpeta:' && read carpeta && [ -d \"\$carpeta\" ] && cd \"\$carpeta\" && echo 'Entrando en la carpeta \$carpeta' || echo 'La carpeta \$carpeta no existe.'"
    "Mover archivo o carpeta:|echo 'Ingrese el nombre del archivo o carpeta a mover:' && read origen && [ -e \"\$origen\" ] && echo 'Ingrese el directorio de destino:' && read destino && [ -d \"\$destino\" ] && mv \"\$origen\" \"\$destino\" && echo 'Movido con éxito' || echo 'Archivo o carpeta no encontrados o directorio de destino no válido.'"
    "Eliminar archivo o carpeta:|echo 'Ingrese el nombre del archivo o carpeta a eliminar:' && read objetivo && [ -e \"\$objetivo\" ] && rm -r \"\$objetivo\" && echo 'Eliminado con éxito' || echo 'Archivo o carpeta no encontrados.'"
    "Mostrar contenido de archivo o carpeta:|echo 'Ingrese el nombre del archivo o carpeta:' && read objetivo && [ -e \"\$objetivo\" ] && ( [ -f \"\$objetivo\" ] && cat \"\$objetivo\" || [ -d \"\$objetivo\" ] && cd \"\$objetivo\" ) || echo 'Archivo o carpeta no encontrados.'"
    "Comprimir archivo gzip:|echo 'Ingrese el nombre del archivo a comprimir:' && read archivo && [ -e \"\$archivo\" ] && gzip \"\$archivo\" && echo 'Archivo comprimido con éxito' || echo 'Archivo no encontrado.'"
    "Descomprimir archivo gzip:|echo 'Ingrese el nombre del archivo a descomprimir:' && read archivo && [ -e \"\$archivo\" ] && gunzip \"\$archivo\" && echo 'Archivo descomprimido con éxito' || echo 'Archivo no encontrado.'"
    "Comprimir archivo gzip con máxima compresión:|echo 'Ingrese el nombre del archivo a comprimir con máxima compresión:' && read archivo && [ -e \"\$archivo\" ] && gzip -9 \"\$archivo\" && echo 'Archivo comprimido con éxito' || echo 'Archivo no encontrado.'"
    "Comprimir archivo bzip2:|echo 'Ingrese el nombre del archivo a comprimir con bzip2:' && read archivo && [ -e \"\$archivo\" ] && bzip2 \"\$archivo\" && echo 'Archivo comprimido con éxito' || echo 'Archivo no encontrado.'"
    "Descomprimir archivo bzip2:|echo 'Ingrese el nombre del archivo a descomprimir de bzip2:' && read archivo && [ -e \"\$archivo\" ] && bunzip2 \"\$archivo\" && echo 'Archivo descomprimido con éxito' || echo 'Archivo no encontrado.'"
    "Crear archivo tar descomprimido:|echo 'Ingrese el nombre del archivo tar a crear:' && read archivo && tar -cvf \"\$archivo.tar\" file1 && echo 'Archivo tar creado con éxito' || echo 'Error al crear archivo tar.'"
    "Crear archivo tar con varios archivos y directorios:|echo 'Ingrese el nombre del archivo tar a crear:' && read archivo && tar -cvf \"\$archivo.tar\" file1 file2 dir1 && echo 'Archivo tar creado con éxito' || echo 'Error al crear archivo tar.'"
    "Mostrar contenido de archivo tar:|echo 'Ingrese el nombre del archivo tar:' && read archivo && tar -tf \"\$archivo\" || echo 'Archivo tar no encontrado o inválido.'"
    "Extraer archivo tar:|echo 'Ingrese el nombre del archivo tar a extraer:' && read archivo && tar -xvf \"\$archivo\" && echo 'Archivo tar extraído con éxito' || echo 'Error al extraer archivo tar.'"
    "Extraer archivo tar en directorio específico:|echo 'Ingrese el nombre del archivo tar a extraer:' && read archivo && echo 'Ingrese el directorio de destino:' && read directorio && tar -xvf \"\$archivo\" -C \"\$directorio\" && echo 'Archivo tar extraído con éxito en el directorio \$directorio' || echo 'Error al extraer archivo tar o directorio de destino inválido.'"
    "Crear archivo tar comprimido en bzip2:|echo 'Ingrese el nombre del archivo tar.bz2 a crear:' && read archivo && tar -cvfj \"\$archivo.tar.bz2\" dir1 && echo 'Archivo tar.bz2 creado con éxito' || echo 'Error al crear archivo tar.bz2.'"
    "Descomprimir archivo tar comprimido en bzip2:|echo 'Ingrese el nombre del archivo tar.bz2 a descomprimir:' && read archivo && tar -xvfj \"\$archivo.tar.bz2\" && echo 'Archivo tar.bz2 descomprimido con éxito' || echo 'Error al descomprimir archivo tar.bz2.'"
    "Crear archivo tar comprimido en gzip:|echo 'Ingrese el nombre del archivo tar.gz a crear:' && read archivo && tar -cvfz \"\$archivo.tar.gz\" dir1 && echo 'Archivo tar.gz creado con éxito' || echo 'Error al crear archivo tar.gz.'"
    "Descomprimir archivo tar comprimido en gzip:|echo 'Ingrese el nombre del archivo tar.gz a descomprimir:' && read archivo && tar -xvfz \"\$archivo.tar.gz\" && echo 'Archivo tar.gz descomprimido con éxito' || echo 'Error al descomprimir archivo tar.gz.'"
    "Crear archivo comprimido en zip:|echo 'Ingrese el nombre del archivo zip a crear:' && read archivo && zip \"\$archivo.zip\" file1 && echo 'Archivo zip creado con éxito' || echo 'Error al crear archivo zip.'"
    "Crear archivo comprimido en zip con varios archivos y directorios:|echo 'Ingrese el nombre del archivo zip a crear:' && read archivo && zip -r \"\$archivo.zip\" file1 file2 dir1 && echo 'Archivo zip creado con éxito' || echo 'Error al crear archivo zip.'"
    "Descomprimir archivo zip:|echo 'Ingrese el nombre del archivo zip a descomprimir:' && read archivo && unzip \"\$archivo.zip\" && echo 'Archivo zip descomprimido con éxito' || echo 'Error al descomprimir archivo zip.'"
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
