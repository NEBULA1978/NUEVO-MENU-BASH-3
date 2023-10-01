#!/bin/bash

# Escribo el principio del programa , pidiendo al usuario que introduzca el nombre de su nuevo fichero y quitándole todos los permisos al mismo una vez creado.

echo "Escribe el nombre de tu fichero"

read fichero

touch $fichero.txt

chmod -rwx $fichero.txt

# Creo todas las opciones del menú 

Opcion1="Visualizar permisos de $fichero.txt"
Opcion2="Dar permisos de lectura a $fichero.txt"
Opcion3="Dar permisos de escritura a $fichero.txt"
Opcion4="Dar permisos de ejecución a $fichero.txt"
Opcion5="Quitar todos permisos de ejecución a $fichero.txt"

Opcion6="Salir"


# Creo el cuerpo del menú en cuestión , empezando de arriba a abajo ya que primero confeccioné la opción "Salir"

select opcion in "$Opcion1" "$Opcion2" "$Opcion3" "$Opcion4" "$Opcion5" "$Opcion6" ;
do
	if [ "$opcion" = "$Opcion6"  ]; then 
		echo "Gracias por usar mi script! ¿ Deseas borrar el archivo que acabas de crear ?" # Cuando el usuario elije la opción "Salir" le pregunto si quiere deshacerse del archivo que ha creado usando un submenú.
		select opcionexit in "Si" "No";
		do
			if [ $opcionexit = "Si" ]; then
			rm $fichero.txt
			echo "Archivo borrado correctamente" # Si quiere borrar el archivo lo borra , si no salimos del programa mediante exit.
			exit
			else
			echo "Hasta la próxima!"
			exit	
		fi
	done

# A partir de aquí es todo lo mismo , las opciones 2 , 3 y 4 son idénticas , solo cambia el echo y el valor de chmod
	
	elif [ "$opcion" = "$Opcion5" ]; then  
        chmod -xrw $fichero.txt
        echo "Quitando permisos de ejecución a $fichero.txt"



	elif [ "$opcion" = "$Opcion4" ]; then  
	chmod +x $fichero.txt
	echo "Agregado permiso de ejecución a $fichero.txt"


	elif [ "$opcion" = "$Opcion3" ]; then
	chmod +w $fichero.txt
	echo "Agregado permiso de escritura a $fichero.txt"


	elif [ "$opcion" = "$Opcion2" ]; then
	chmod +r $fichero.txt
	echo "Agregado permiso de lectura a $fichero.txt"


	elif [ "$opcion" = "$Opcion1" ]; then # La opción1 nos permite visualizar los permisos mediante ls -la
	ls -la $fichero.txt


	else
		echo "Opción no válida" # Por último , si el usuario eligiese cualquier otra opción que no fuese de la 1 a la 5 , imprimiríamos en pantalla "Opción no válida"
	fi
	done
