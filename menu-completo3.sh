#!/bin/bash

while :; do
	#Menu
	clear
	echo -e "\e[1;32m"
	echo " MENU SCRIPT V.1 "
	echo ""
	echo "1. Mostrar directorio"
	echo "2. Mostrar calendario"
	echo "3. Mostrar dato"
	echo "5. Para ver la contraseña"
	echo "6. ver apuntes de contraseñas"
	echo "7. Para filtrar usuario"
	echo "8. ver la carpetade usuario"
	echo "9. Para ver los distintos grupos que existen"
	echo "10. FILTRAMOS POR NUESRO USUARIO"
	echo "11. Automatizar musica fotos etc a carpetas asignadas"
	echo "12. Texto comandos complejos"
	echo "13. Comandos linux texto"
	echo "14. Comandos utiles de linux"
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
		sudo cat /etc/shadow
		read foo
		;;
	6)
		echo "-El usuario root es el primer usuario:
-Despues el userid de izquierda a derecha
-Despues idgrupo: empieza por 0
-Despues nombre completo
-el ultimo campo es el shell que estamos usando:

Para filtrar usuario:
cat /etc/passwd | grep (nombre usuario)"
		read foo
		;;
	7)
		cat /etc/passwd | grep next

		read foo
		;;
	8)
		sudo cat /etc/sudoers

		read foo
		;;
	10)
		cat /etc/group | grep next

		read foo
		;;
	11)
		echo Para mover todas las fotos a la carpeta de fotos, pulse 1
		echo Para mover todos los documentos a la carpeta documentos, pulse 2
		echo Para copiar TODOS LOS ARCHIVOS EN TOTAL a la carpeta total, pulse 3

		read -p "Introduce el numero: " numero

		case $numero in
		1)
			find . -type -iname "*.png" -exec mv "{}" fotos/ ";"
			find . -type -iname "*.jpg" -exec mv "{}" fotos/ ";"
			find . -type -iname "*.jpeg" -exec mv "{}" fotos/ ";"
			;;

		2)
			find . -type -iname "*.doc" -exec mv "{}" documentos/ ";"
			find . -type -iname "*.odt" -exec mv "{}" documentos/ ";"
			find . -type -iname "*.docx" -exec mv "{}" documentos/ ";"
			find . -type -iname "*.pdf" -exec mv "{}" documentos/ ";"
			find . -type -iname "*.html" -exec mv "{}" documentos/ ";"
			;;
		3)
			find . -type -iname "*.*" -exec cp "{}" total/ ";"
			;;

			#Para cerrar script
		esac

		read foo
		;;

	12)
		echo "Comandos complejos
Encontrar y ejecutar

find . -name "clave*" -exec command {} \; # ejecuta el comando para cada clave encontrada
find . -name "clave*" -exec command {} +  # ejecuta el comando una sola vez sumando las claves encontradas
find /path/to/base/dir -type d -exec chmod 755 {} +
find /path/to/base/dir -type f -exec chmod 644 {} +
Ejemplo de encontrar y ejecutar. El comando mv con la opción -t fija el directorio "target" al cual mueve todos los archivos de texto

find . -type f -name '*.txt' -exec mv -t ./test/ {} \+
Re-imprimir columnas

awk -F '\t' '{print $1}' file.txt # default delimiter is "space"
awk 'BEGIN {FS="\t";OFS="
		"}{print $1,$3}' file.txt

cut -f 1,3 --output-delimiter="
		" file.txt # default delimiter is "tab"
cut -d ';' -f 1,3 --output-delimiter=$'\t' file.txt
Uso de sed para reemplazar

sed 's/antes/despues/' file.txt # salida estandar
sed -i 's/antes/despues/' file.txt # editará el archivo"
		read foo
		;;
	13)
		echo "RESUMEN
El comando pwd muestra el directorio actual

El comando cd cambia de directorio

El carácter ~ hace referencia al directorio personal del que ejecuta la orden

El comando ls lista el contenido de un directorio. Opciones comunes que modifican cómo se mostrará la información: -l lista con detalle, -h muestra el tamaño más legible, -a muestra los ocultos, -S ordena por tamaño, -t ordena por fecha, -r invierte el criterio de ordenación

Para indicar dónde se encuentra un elemento del sistema de ficheros (un archivo o un directorio), utilizo rutas. Éstas pueden ser absolutas (indico todos los directorios que tengo que seguir desde la raíz del sistema) o relativas (indico el camino desde el directorio donde ejecuto la orden).

Las rutas absolutas siempre empiezan por una barra / (que indica la raíz)

Si utilizo .. en una ruta estoy haciendo referencia al directorio
"
		read foo
		;;

	14)
		echo "Mostrar discos y sus propiedades"
		df -h

		echo "Mostrar las propiedades del disco al que pertenece la carpeta de trabajo actual"
		df -h .

		echo "Mostrar info del de sistema instalado"
		uname -a

		echo "Mostrar versión del sistema operativo (sólo en Ubuntu)"
		lsb_release -a

		echo "Memoria RAM"
		grep MemTotal /proc/meminfo

		echo "Memoria swap"
		grep SwapTotal /proc/meminfo

		echo "Mostrar particiones de discos (detalles)"
		sudo fdisk -l

		echo "Datos sobre memoria ram y swap usada y libre"
		free -h

		echo "Mostrar info de la CPU"
		grep "model name" /proc/cpuinfo

		echo "Mostrar info del último reboot"
		last reboot

		echo "Mostrar el tiempo de uso"
		uptime

		echo "Apagar o reiniciar el sistema. 0: apaga el equipo, 6: reinicia el sistema"
		echo "init <numero>"

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
