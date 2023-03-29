#!/bin/bash


# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls"

    "Salir:|exit 0"
)

while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}" # Imprimimos el índice de la opción y su nombre (sin el comando correspondiente).
    done
    read opcion

    case $opcion in
        [0-9]*)
            if [ $opcion -ge 0 ] && [ $opcion -lt ${#opciones[@]} ]; then
                clear
                comando="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
                eval "$comando"                     # Ejecutamos el comando.
                echo ""
                echo "Presione Enter para continuar..."
                read
            else
                echo "Opción inválida. Presione Enter para continuar..."
                read
            fi
            ;;
        *)
            echo "Opción inválida. Presione Enter para continuar..."
            read
            ;;
    esac
done


# La estructura case permite realizar la validación de la entrada del usuario y ejecutar el código correspondiente de una forma más clara y legible. En este caso, la entrada del usuario se valida utilizando una expresión regular que verifica que sea un número, y luego se comparan los números con los límites del array de opciones. Si la entrada del usuario es válida, se ejecuta el comando correspondiente. Si no es válida, se muestra un mensaje de error.