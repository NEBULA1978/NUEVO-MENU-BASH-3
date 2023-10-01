#!/bin/bash

while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar fecha de dia de hoy"
    echo "5. Crear carpetas"
    echo "6. Eliminar carpetas"
    echo "7. Listar el contenido de los archivos y carpetas almacenados en carpeta actual"
    echo "8. Muestra tamaño de los directorios /home"
    echo "9. Cambiar a usuario root"
    echo "10. Reiniciar la interfaz de red"
    echo "11. Apagar equipo"
    echo "12. Reiniciar equipo"
    echo "13. Mostrar puertos abiertos"
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
        cal
        read foo
        ;;
    3)
        echo "Mostrando datos"
        date
        read foo
        ;;
    5)
        echo "Mostrando carpetas creadas"
        for x in {1..64}; do
            mkdir ./test$x
        done
        echo "mkdir ./test$x"
        read foo
        ;;
    6)
        echo "Mostrando carpetas eliminadas"
        for x in {1..64}; do
            rm -r ./test$x
        done
        echo "rm -r ./test$x"
        read foo
        ;;
    7)
        echo "Creando archivo.txt con todos los archivos del directoria actual"
        ls /home/next/Documentos/ >lista.txt
        echo "Archivo creado"
        read foo
        ;;
    8)
        echo "Tamaño total de los archivos del directoria actual /home"
        if [ $(id -u) -ne 0 ]; then
            echo "[ERROR] - El script se debe ejecutar como root"
            exit 1
        fi

        for dir in $(ls /home); do
            echo "Directorio: $dir"
            ls -ld /home/$dir
            du -sh /home/$dir
        done
        read foo
        ;;
    9)
        sudo su
        read foo
        ;;
    10)
        /etc/init.d/networking restart
        read foo
        ;;
    11)
        shutdown -h now
        read foo
        ;;
    12)
        reboot
        read foo
        ;;
    13)
        nmap localhost
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
