#!/bin/bash

PS3="Ingrese el número de la opción deseada: "

opciones=("Mostrar directorio" "Salir")

seleccionar_opcion() {
    local opcion
    select opcion in "${opciones[@]}"; do
        case $opcion in
            "Mostrar directorio")
                ls
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

# En esta versión, utilizamos la variable PS3 para establecer el prompt que se muestra antes de la lista de opciones. Luego, definimos un array opciones con los nombres de las opciones que queremos mostrar en el menú.

# La función seleccionar_opcion() es la encargada de mostrar el menú y ejecutar la opción seleccionada. Utilizamos la sentencia select para mostrar la lista de opciones y esperar a que el usuario seleccione una. Luego, utilizamos una estructura case para ejecutar el comando correspondiente a la opción seleccionada o mostrar un mensaje de error si la opción es inválida.

# Por último, en el ciclo while simplemente llamamos a la función seleccionar_opcion() dentro de un clear para que el menú se muestre continuamente hasta que el usuario seleccione la opción "Salir".