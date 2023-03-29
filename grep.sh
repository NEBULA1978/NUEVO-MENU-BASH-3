#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls"
    "Mostrar Calaculadora:|xcalc"
    "Mostrar datos:|date"
    "Grep con -i mayúsculas y minúsculas:|grep -i \"h\" comandos-200715-160839.sh"
    "Grep con -i mayúsculas y minúsculas todas las palabras que no contengan la h:|grep -i \"[h]\" comandos-200715-160839.sh"
    "Grep con -i mayúsculas y minúsculas todas las palabras que no contengan la h con -n -h después nombre archivo:|grep -i \"[h]\" comandos-200715-160839.sh -n -H"
    "Grep con -i mayúsculas y minúsculas todas las palabras que no contengan la h con 2 repeticiones con -n -h después nombre archivo:|grep -i \"h\{2\}\" comandos-200715-160839.sh -n -H"
    "Grep con -i mayúsculas y minúsculas todas las palabras que no contengan la h de 1 a 3 repeticiones con -n -h después nombre archivo:|grep -i \"h\{1,3\}\" comandos-200715-160839.sh -n -H"
    "Buscar la palabra prueba con letras delante o atrás en el archivo comandos-200715-160839.sh:|grep -i \"[a-z]\+prueba[a-z]\+\" comandos-200715-160839.sh"
    "Buscar solo la palabra prueba en el archivo comandos-200715-160839.sh:|grep -i -o -w \"prueba\" comandos-200715-160839.sh"
    "Buscar solo la palabra y la línea prueba en el archivo comandos-200715-160839.sh:|grep -i -w -n \"prueba\" comandos-200715-160839.sh"
    "Buscar dos palabras prueba y caso en el archivo comandos-200715-160839.sh:|grep -i -e \"prueba\" -e \"caso\" comandos-200715-160839.sh"

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
    if [[ "$opcion" =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
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
