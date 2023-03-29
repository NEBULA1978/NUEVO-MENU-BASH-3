#!/bin/bash

PS3="Ingrese el número de la opción deseada: "

opciones=("Mostrar directorio" "Información del sistema" "Apagar el sistema" "Reiniciar" "Cerrar sesión" "Salir")

seleccionar_opcion() {
    local opcion
    select opcion in "${opciones[@]}"; do
        case $opcion in
        "Mostrar directorio")
            ls
            ;;
        "Información del sistema")
            echo 'Arquitectura de la máquina (1):' && arch
            echo 'Arquitectura de la máquina (2):' && uname -m
            echo 'Versión del kernel usado:' && uname -r
            echo 'Información completa:' && uname -a
            echo 'Información completa de la distribución:' && lsb_release -a
            echo 'Nombre de la distribución:' && cat /etc/issue
            echo 'Componentes (hardware) del sistema:' && dmidecode -q
            echo 'Características de un disco duro:' && hdparm -i /dev/hda
            echo 'Prueba de lectura en un disco duro:' && hdparm -tT /dev/sda
            echo 'Información de la CPU:' && cat /proc/cpuinfo
            echo 'Número de procesadores:' && grep -c ^processor /proc/cpuinfo
            echo 'Interrupciones:' && cat /proc/interrupts
            echo 'Uso de memoria:' && cat /proc/meminfo
            echo 'Ficheros swap:' && cat /proc/swaps
            echo 'Versión del kernel:' && cat /proc/version
            echo 'Adaptadores de red y estadísticas:' && cat /proc/net/dev
            echo 'Sistema de ficheros montado:' && cat /proc/mounts
            echo 'Dispositivos PCI:' && lspci -tv
            echo 'Dispositivos USB:' && lsusb -tv
            echo 'Listar el hardware:' && lshw
            echo 'Listar el hardware (alternativo):' && discover
            echo 'Fecha del sistema:' && date
            echo 'Almanaque de 2011:' && cal 2011
            echo 'Almanaque para el mes julio de 2011:' && cal 07 2011
            echo 'Colocar (declarar, ajustar) fecha y hora:' && date 041217002011.00
            echo 'Guardar los cambios de fecha en la BIOS:' && clock -w
            echo 'Información (nombre, etiqueta, UUID, tipo de partición) sobre los dispositivos de bloque (discos rígidos, etc.):' && blkid
            ;;
        "Apagar el sistema")
            echo "Seleccione una opción de apagado:"
            select apagado in "Apagar ahora" "Planificar apagado" "Cancelar planificación"; do
                case $apagado in
                "Apagar ahora")
                    shutdown -h now
                    ;;
                "Planificar apagado")
                    echo "Ingrese la hora (HH:MM) en la que desea apagar el sistema:"
                    read hora
                    shutdown -h $hora &
                    ;;
                "Cancelar planificación")
                    shutdown -c
                    ;;
                *)
                    echo "Opción inválida."
                    ;;
                esac
                echo "Presione Enter para continuar..."
                read
                break
            done
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
    done
}

seleccionar_opcion

exit 0

# Este es un script de shell que presenta un menú de opciones al usuario para realizar diferentes acciones en el sistema. Las opciones incluyen mostrar el contenido del directorio actual, obtener información del sistema, apagar el sistema, reiniciar, cerrar sesión o salir del programa.

# Para mostrar información del sistema, el script utiliza una variedad de comandos, incluyendo "arch", "uname", "lsb_release", "dmidecode", "hdparm", "cat", "grep", "lspci", "lsusb", "lshw", "date", "cal" y "blkid", entre otros.

# Para apagar el sistema, el script presenta al usuario tres opciones: apagar ahora, planificar un apagado o cancelar una planificación previa.

# Una vez que el usuario selecciona una opción del menú, el script realiza la acción correspondiente y luego vuelve a presentar el menú de opciones para que el usuario pueda elegir otra acción o salir del programa.