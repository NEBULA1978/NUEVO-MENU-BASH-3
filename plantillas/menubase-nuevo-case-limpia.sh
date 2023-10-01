#!/bin/bash

PS3="Ingrese el número de la opción deseada: "

opciones=("Mostrar directorio" "Reiniciar" "Cerrar sesión" "Salir")

seleccionar_opcion() {
    select opcion in "${opciones[@]}"; do
        case $opcion in
        "Mostrar directorio")
            ls
            ;;
        "Reiniciar")
            reboot
            ;;
        "Cerrar sesión")
            logout
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
    done
}

seleccionar_opcion

exit 0
