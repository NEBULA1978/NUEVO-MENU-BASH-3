# NUEVO-MENU-BASH-3

El script Bash crea un menú interactivo en la terminal que permite al usuario seleccionar
diversas opciones relacionadas con operaciones de archivo, como listar directorios, comprimir y
descomprimir archivos en varios formatos, crear y manipular archivos tar, archivos comprimidos en
bzip2 y gzip, archivos comprimidos en formato zip, y salir del programa. A continuación, describo
la estructura general del menú:

    Definición de opciones: El menú comienza definiendo un arreglo llamado opciones, donde cada 
    elemento del arreglo es una cadena de texto que contiene dos partes separadas por el carácter
    '|'. La primera parte es el nombre de la opción que se mostrará en el menú, y la segunda parte
    es el comando Bash que se ejecutará cuando el usuario seleccione esa opción. Cada opción se define
    como una línea en el arreglo.

    Bucle principal (while true): El script utiliza un bucle while que se ejecuta de forma indefinida
    (while true). Esto permite que el menú se mantenga activo hasta que el usuario elija la opción de salir (exit 0).

    Presentación del menú: Dentro del bucle, el script borra la pantalla (clear) para limpiar la 
    terminal y luego muestra las opciones disponibles al usuario. El usuario debe ingresar el número correspondiente a la opción deseada.

    Validación de entrada: Después de que el usuario ingrese un número, el script valida si la entrada
    es un número válido dentro del rango de opciones disponibles. Si la entrada no es válida, muestra 
    un mensaje de error y espera a que el usuario presione Enter para continuar.

    Ejecución de la opción seleccionada: Si el usuario ingresa un número válido, el script obtiene el 
    comando asociado con la opción seleccionada y lo ejecuta utilizando eval. Esto significa que el 
    comando se ejecuta como si fuera una línea de Bash regular. Después de ejecutar el comando, el 
    script muestra un mensaje y espera a que el usuario presione Enter para continuar.

    Opción de salida: El último elemento del arreglo de opciones permite al usuario salir del programa 
    al ingresar 0. Cuando el usuario selecciona esta opción, el script ejecuta exit 0, lo que finaliza el programa.

En resumen, el script crea un menú interactivo que permite al usuario realizar diversas operaciones relacionadas
con archivos y luego volver al menú para seleccionar más opciones o salir del programa según su elección. 
Cada opción se define con un nombre descriptivo y un comando asociado que se ejecuta cuando se selecciona esa opción.
