#!/bin/bash

PS3="Ingrese el número de la opción deseada: "

opciones=("Mostrar directorio" "Mostrar calendario" "Mostrar calculadora" "Sustituir palabra puedo por voy de una fase con echo y sed" "Mostrar el archivo out.txt con cat" "Mostrar las lineas del 3 al 7 del archivo out.txt con sed" "Mostrar todas las lineas del archivo out.txt con sed" "Eliminar todas las lineas del 3 al 7 del archivo out.txt con sed" "Mostrar solo las lineas del 3 al 7" "Sustituir una palabra por otra dentro de un arvhivo de texto este donde este la palabra dentro del archivo out.txt con sed" "Sustituir una palabra por otra dentro de un arvhivo de texto este la linea 8 dentro del archivo out.txt con sed" "Menos la linea 8 introduce la palabra que le decimos" "Insertar palabra despues de la linea 8" "Insertar palabra antes de la linea 8" "Eliminar una linea annes de la ultima linea e introduce palabra" "Agregar una linea al final e introduce palabra" "Mostrar la 1º linea de un archivo out.txt con sed" "Mostrar la 8º linea de un archivo out.txt con sed" "Mostrar la ultima linea de un archivo out.txt con sed" "Salir")

seleccionar_opcion() {
    local opcion
    select opcion in "${opciones[@]}"; do
        case $opcion in
        "Mostrar directorio")
            ls
            ;;
        "Mostrar calendario")
            xcal
            ;;
        "Mostrar calculadora")
            date
            ;;
        "Sustituir palabra puedo por voy de una fase con echo y sed")
            echo "Este es un mensaje de prueba con el simbolo | puedo ejecutar otro comando" | sed 's/puedo/voy/g'
            ;;
        "Mostrar el archivo out.txt con cat")
            cat out.txt
            ;;
        "Mostrar las lineas del 3 al 7 del archivo out.txt con sed")
            cat out.txt | sed -n '3,7 p'
            ;;
        "Mostrar todas las lineas del archivo out.txt con sed")
            cat out.txt | sed '3d'
            ;;
        "Eliminar todas las lineas del 3 al 7 del archivo out.txt con sed")
            cat out.txt | sed '3,7d'
            ;;
        "Mostrar solo las lineas del 3 al 7")
            cat out.txt | sed '3,7!d'
            ;;
        "Sustituir una palabra por otra dentro de un arvhivo de texto este donde este la palabra dentro del archivo out.txt con sed")
            cat out.txt | sed 's/todoreal/real/g'
            ;;
        "Sustituir una palabra por otra dentro de un arvhivo de texto este la linea 8 dentro del archivo out.txt con sed")
            cat out.txt | sed '/8/ cprueba'
            ;;
        "Menos la linea 8 introduce la palabra que le decimos")
            cat out.txt | sed '/8/ !cprueba'
            ;;
        "Insertar palabra despues de la linea 8")
            cat out.txt | sed '/8/ aprueba'
            ;;
        "Insertar palabra antes de la linea 8")
            cat out.txt | sed '/8/" iprueba'
            ;;
        "Eliminar una linea annes de la ultima linea e introduce palabra")
            cat out.txt | sed '$d' | sed '$a prueba'
            ;;
        "Agregar una linea al final e introduce palabra")
            cat out.txt | sed '$a prueba'
            ;;
        "Mostrar la 1º linea de un archivo out.txt con sed")
            cat out.txt | sed -n '1p'
            ;;
        "Mostrar la 8º linea de un archivo out.txt con sed")
            cat out.txt | sed -n '8p'
            ;;
        "Mostrar la ultima linea de un archivo out.txt con sed")
            cat out.txt | sed -n '$p'
            ;;
        "Salir")
            exit 0
            ;;
        *)
            echo "Opción inválida."
            ;;
        esac
        echo "Presione Enter para continuar..."
        read
        break
    done
}

while true; do
    clear
    seleccionar_opcion
done
