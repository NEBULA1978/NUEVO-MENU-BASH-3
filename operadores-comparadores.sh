#!/bin/bash

seleccionar_opcion() {
    local opcion
    select opcion in "Mostrar directorio actual" "Salir" "Comparar numeros"; do
        case $opcion in
        "Mostrar directorio actual")
            ls
            ;;
        "Salir")
            exit 0
            ;;
        "Comparar numeros")
            echo -n "Escribe un número: "
            read valor

            if [[ $valor -gt 5 ]]; then
                echo "Tu numero es mayor que 5"
            elif [[ $valor -ge 5 ]]; then
                echo "Tu numero es mayor o igual a 5"
            elif [[ $valor -lt 5 ]]; then
                echo "Tu numero es menor que 5"
            elif [[ $valor -le 5 ]]; then
                echo "Tu numero es menor o igual a 5"
            elif [[ $valor -eq 5 ]]; then
                echo "Tu numero es igual a 5"
            else
                echo "Tu numero es distinto a 5"
            fi
            echo ""
            echo 'if [[ $valor -gt 5 ]]; then
                    echo "Tu numero es mayor que 5"
                elif [[ $valor -ge 5 ]]; then
                    echo "Tu numero es mayor o igual a 5"
                elif [[ $valor -lt 5 ]]; then
                    echo "Tu numero es menor que 5"
                elif [[ $valor -le 5 ]]; then
                    echo "Tu numero es menor o igual a 5"
                elif [[ $valor -eq 5 ]]; then
                    echo "Tu numero es igual a 5"
                else
                    echo "Tu numero es distinto a 5"
                fi'
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

# El código incluye una nueva opción "Comparar numeros" que permite al usuario ingresar un número y luego lo compara con el número 5 utilizando los operadores de comparación disponibles en Bash. Cuando el usuario selecciona esta opción, se muestra el prompt "Escribe un número: " y luego se realiza la comparación correspondiente.
