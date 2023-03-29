#!/bin/bash

while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar ID"
    echo "3. Añadir Usuario"
    echo "5. Cambiar de Usuario a kike"
    echo "6. Ver Usuario actual"
    echo "7. Cambiar de Usuario a nexxt"
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls
        read foo
        ;;
    2)
        echo "Mostrando calendario"
        id
        read foo
        ;;
    3)
        echo "Añadir Usuario"
        sudo adduser kike
        read foo
        ;;
    5)
        echo "Cambiar de Usuario a kike"
        su kike
        read foo
        ;;
    6)
        echo "ver Usuario actual"
        whoami
        read foo
        ;;
    7)
        echo "Cambiar de Usuario a nexxt"
        su - nexxt
        read foo
        ;;
    4) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
