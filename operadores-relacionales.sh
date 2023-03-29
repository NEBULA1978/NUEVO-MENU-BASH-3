#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls"

    "Salir:|exit 0"
)#!/bin/bash

echo -n "Escribe un número: "
read valor

if [ $valor -eq 0 ]; then
    echo "El número es cero"
elif [ $valor -gt 0 ]; then
    echo "El número es positivo"
else
    echo "El número es negativo"
fi

#Operadores relacionales
#-eq: igual a
#-ne: no es igual a
#-gt: Mayor a
#-ge: Mayor o igual a
#-lt: Menor a
#-le: Menor o igual a

echo -n "Escribe una palabra: "
read palabra

if [ ${#palabra} -eq 5 ]; then
    echo "La palabra tiene 5 caracteres"
elif [ ${#palabra} -gt 5 ]; then
    echo "La palabra tiene más de 5 caracteres"
else
    echo "La palabra tiene menos de 5 caracteres"
fi

#Operadores relacionales
#-eq: igual a
#-ne: no es igual a
#-gt: Mayor a
#-ge: Mayor o igual a
#-lt: Menor a
#-le: Menor o igual a
# ${#variable}: devuelve la longitud de la variable

echo -n "Ingresa un número del 1 al 10: "
read num

if [[ $num -lt 1 || $num -gt 10 ]]; then
    echo "El número está fuera del rango [1, 10]"
else
    echo "El número está dentro del rango [1, 10]"
fi

#Operadores relacionales
#-eq: igual a
#-ne: no es igual a
#-gt: Mayor a
#-ge: Mayor o igual a
#-lt: Menor a
#-le: Menor o igual a
# ||: or lógico

echo -n "Ingresa un número entero: "
read num

if (( num % 2 == 0 )); then
    echo "El número es par"
else
    echo "El número es impar"
fi

#Operadores aritméticos
# %: módulo (devuelve el resto de la división)
# (( )): se utiliza para evaluar expresiones aritméticas


while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}" # Imprimimos el índice de la opción y su nombre (sin el comando correspondiente).
    done
    read opcion

    # Validamos que la opción ingresada sea un número válido dentro del rango de opciones.
    if [[ $opcion =~ ^[0-9]+$ ]] && [ $opcion -ge 0 ] && [ $opcion -lt ${#opciones[@]} ]; then
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

done

# El script es un menú interactivo en bash que permite realizar operaciones en una instancia de MongoDB que se ejecuta en un contenedor de Docker. El menú presenta varias opciones que incluyen comandos para mostrar información del sistema de archivos, conectarse a la instancia de MongoDB, crear una base de datos, agregar valores a la base de datos, buscar registros, ordenar registros, etc.

# El script utiliza un array para almacenar las opciones del menú, donde cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente. Luego, utiliza un ciclo while para mostrar el menú en pantalla y ejecutar el comando correspondiente a la opción seleccionada por el usuario.

# El script utiliza la función eval para ejecutar los comandos, lo que significa que el usuario debe tener cuidado al seleccionar opciones y no ingresar comandos maliciosos. Además, el script asume que el contenedor de MongoDB ya está instalado y disponible en el sistema.

# Sí, se pueden implementar medidas de seguridad para evitar la inyección de comandos maliciosos. Algunas sugerencias son:

#     Utilizar una lista blanca de comandos permitidos: en lugar de permitir cualquier comando que se ingrese desde el menú, se puede crear una lista blanca de comandos permitidos y validar que el comando seleccionado por el usuario esté en la lista. De esta manera, solo se permitirían comandos específicos que se consideren seguros.

#     Sanitizar la entrada del usuario: se pueden utilizar herramientas como sed o awk para eliminar los caracteres especiales que puedan ser utilizados para inyectar comandos maliciosos. Por ejemplo, se pueden eliminar caracteres de escape, comillas y caracteres especiales como punto y coma (;) que se utilizan para separar comandos.

#     Limitar los permisos de ejecución: se pueden limitar los permisos de ejecución de los comandos que se ejecutan desde el menú, para evitar que se realicen operaciones maliciosas. Por ejemplo, se pueden limitar los permisos de escritura o lectura en archivos importantes del sistema.

#     Utilizar variables en lugar de eval: en lugar de usar eval para ejecutar los comandos, se pueden utilizar variables para almacenar los comandos y luego ejecutarlos. De esta manera, se limitaría la posibilidad de inyección de comandos maliciosos.

#     Validar la entrada del usuario: se pueden validar los datos ingresados por el usuario para asegurarse de que solo se ingresen datos válidos y seguros. Por ejemplo, se pueden utilizar expresiones regulares para validar el formato de los datos, o limitar la cantidad de caracteres que se pueden ingresar.

# Es importante tener en cuenta que ninguna medida de seguridad es completamente efectiva, por lo que es recomendable utilizar varias medidas de seguridad para reducir el riesgo de inyección de comandos maliciosos.