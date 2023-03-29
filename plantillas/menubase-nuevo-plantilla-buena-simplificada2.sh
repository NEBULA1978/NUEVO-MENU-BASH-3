#!/bin/bash

PS3="Seleccione una opción: "
opciones=("Listar archivos" "Salir")

seleccionar_opcion() {
    local opcion
    select opcion in "${opciones[@]}"; do
        case $opcion in
            "Listar archivos")
                ls
                ;;
            "Salir")
                echo "¡Hasta luego!"
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

# Esta versión utiliza la misma estructura de la función seleccionar_opcion() y el ciclo while para mostrar el menú y ejecutar las opciones. Sin embargo, la lista de opciones se ha reducido a solo dos elementos: "Listar archivos" y "Salir". También se ha agregado un mensaje de despedida cuando el usuario elige la opción "Salir".