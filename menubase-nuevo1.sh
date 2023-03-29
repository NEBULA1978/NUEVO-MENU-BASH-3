#!/bin/bash

PS3="Ingrese el número de la opción deseada: "

opciones=("Mostrar directorio" "Mostrar que shell utilizo" "Mostrar proceso actual de la terminal abierta" "Introducir tu nombre" "Introducir mensaje en archivo test.txt" "Ver mensaje en archivo test.txt" "Creamos e introducimos mensaje y añadimos texto cada vez en archivo test2.txt" "Ver mensaje introducido en archivo test2.txt" "Salir")

seleccionar_opcion() {
    local opcion
    select opcion in "${opciones[@]}"; do
        case $opcion in
            "Mostrar directorio")
                ls
                ;;
            "Mostrar que shell utilizo")
                echo "Mi shell es $SHELL"
                ;;
            "Mostrar proceso actual de la terminal abierta")
                ps -p $$
                ;;
            "Introducir tu nombre")
                read -p "Introduce tu nombre: " nombre
                echo "Hola, $nombre"
                ;;
            "Introducir mensaje en archivo test.txt")
                read -p "Introduce el mensaje: " mensaje
                echo "$mensaje" > test.txt
                ;;
            "Ver mensaje en archivo test.txt")
                cat test.txt
                ;;
            "Creamos e introducimos mensaje y añadimos texto cada vez en archivo test2.txt")
                read -p "Introduce el mensaje: " mensaje
                echo "$mensaje" >> test2.txt
                ;;
            "Ver mensaje introducido en archivo test2.txt")
                cat test2.txt
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

# Este script es un menú interactivo de Bash que ofrece varias opciones al usuario. Al seleccionar una opción, se ejecuta una acción específica en función de la opción elegida.

# El menú inicialmente ofrece dos opciones: "Mostrar directorio" y "Salir". Si se selecciona la opción "Mostrar directorio", se ejecuta el comando ls y se muestran los archivos y carpetas del directorio actual. Si se selecciona la opción "Salir", el script se detiene.

# Además, se han agregado nuevas opciones al menú en una versión posterior del script. Estas nuevas opciones son:

#     "Mostrar que shell utilizo": muestra la shell utilizada en el sistema.
#     "Mostrar proceso actual de la terminal abierta": muestra información sobre el proceso de la terminal actual.
#     "Introducir tu nombre": pide al usuario que introduzca su nombre y lo saluda.
#     "Introducir mensaje en archivo test.txt": pide al usuario que introduzca un mensaje y lo guarda en un archivo llamado "test.txt".
#     "Ver mensaje en archivo test.txt": muestra el contenido del archivo "test.txt".
#     "Creamos e introducimos mensaje y añadimos texto cada vez en archivo test2.txt": pide al usuario que introduzca un mensaje y lo guarda en un archivo llamado "test2.txt". Si el archivo ya existe, agrega el mensaje al final del archivo en lugar de sobrescribirlo.
#     "Ver mensaje introducido en archivo test2.txt": muestra el contenido del archivo "test2.txt".

# El script utiliza un bucle while para mantener el menú en ejecución hasta que se seleccione la opción "Salir". La función seleccionar_opcion muestra el menú, lee la opción seleccionada por el usuario y ejecuta la acción correspondiente.