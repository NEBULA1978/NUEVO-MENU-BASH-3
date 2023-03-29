#!/bin/bash

mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1) Instalar programa"
    echo "2) Entrar en carpeta"
    echo "3) Mover archivo o carpeta"
    echo "4) Eliminar archivo o carpeta"
    echo "5) Mostrar contenido de archivo o carpeta"
    echo "6) Salir"
}

seleccionar_opcion() {
    local opcion
    read -p "Ingrese el número de la opción deseada: " opcion
    case $opcion in
        1)
            echo -n "Instalar programa? [s/n]: "
            read resultado
            if [[ $resultado == [sS] ]]; then
                echo "Instalando programa..."
            elif [[ $resultado == [nN] ]]; then
                echo "El programa no se va a instalar"
            else
                echo "Opción inválida"
            fi
            ;;
        2)
            echo -n "Entrar en carpeta: "
            read nombre_carpeta
            if [ -d $nombre_carpeta ]; then
                cd $nombre_carpeta
                echo "Entrando en la carpeta $nombre_carpeta"
            else
                echo "La carpeta $nombre_carpeta no existe"
            fi
            ;;
        3)
            echo -n "Archivo a mover: "
            read nombre_archivo
            echo -n "Carpeta de destino: "
            read nombre_carpeta
            if [ -f "$nombre_archivo" ] && [ -d "$nombre_carpeta" ]; then
                mv "$nombre_archivo" "$nombre_carpeta"
                echo "El archivo $nombre_archivo ha sido movido a la carpeta $nombre_carpeta"
            else
                echo "El archivo $nombre_archivo o la carpeta $nombre_carpeta no existen"
            fi
            ;;
        4)
            echo -n "Archivo o carpeta a eliminar: "
            read nombre_objeto
            if [ -e "$nombre_objeto" ]; then
                rm -r "$nombre_objeto"
                echo "El archivo o carpeta $nombre_objeto ha sido eliminado"
            else
                echo "El archivo o carpeta $nombre_objeto no existe"
            fi
            ;;
        5)
            echo -n "Archivo o carpeta: "
            read nombre_objeto
            if [ -f "$nombre_objeto" ]; then
                echo "Contenido del archivo $nombre_objeto:"
                cat "$nombre_objeto"
            elif [ -d "$nombre_objeto" ]; then
                echo "Entrando en la carpeta $nombre_objeto"
                cd "$nombre_objeto"
            else
                echo "El archivo o carpeta $nombre_objeto no existe"
            fi
            ;;
        6)
            exit 0
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
    echo "Presione Enter para continuar..."
    read
}

while true; do
    clear
    mostrar_menu
    seleccionar_opcion
done
# En este ejemplo, agregamos una función mostrar_menu() para mostrar las opciones disponibles en el menú. Luego, utilizamos la función seleccionar_opcion() para procesar la selección del usuario y ejec