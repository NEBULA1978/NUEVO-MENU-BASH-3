#!/bin/bash

while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar fecha de ahora"
    echo "5. Expresiones regulares"
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
        echo "Mostrar fecha de ahora"
        date
        read foo
        ;;
    5)
        echo "Expresiones Regulares"
        echo "// Con las expresiones regulares Javascript:
// Podemos hacer una busqueda con un patron en un texto
// Tambien podemos limpiar texto,transformar texto y remplazar texto

// Quiero que el texto empieze por la letra a con: /^a/
// const regex = /^a/;
// const text = "fdsfsdfsdfb";
// Quiero que el texto termine por la letra b,con una b tambien true: /b$/
// const regex = /b$/;
// const text = "fdsfsdfsdfb";

// Quiero buscar la palabra git no importa donde esta
// const regex = /git\b/;
// const text = "Me gust git mucho";
// Quiero buscar la palabra cena una sola vez quincena
// const regex = /cena/;
// const text = "Me gusta la quincena antes de git y mucho despues de la cena";
// Quiero buscar la palabra cena las veces que aparezca(encontrara2 quincena y cena)
// const regex = /cena/g;
// const text = "Me gusta la quincena antes de git y mucho despues de la cena";
// Buscar LA en mayuscula y en minuscula /LA/i, si le quito la  i solo marca LA
// const regex = /LA/i;
// const text = "la espero en el aeropuerto de LA";
// Buscar la vocales eo con /[eo]/g (me marca 3)
// const regex = /[eo]/g;
// const text = "te marque anoche";
// Buscar los numeros del 0 al 5 en la frase /[0-5]/g (me marca 4numeros)
// const regex = /[0-5]/g;
// const text = "Mi telefono es 05547898";
// Buscar ningun numero del 0 al 9 en la frase /[^0-9]/g (me marca Mi telefono es) Resumen: que no me muestre los numeros del 0 al 9 por rango
// const regex = /[^0-9]/g;
// const text = "Mi telefono es 05547898";
// Buscar la coincidencia antes de la h la que sea: /.h/g :me marca la h y el caracter de antes en este caso dos
// const regex = /[.h]/g;
// const text = "Dos horas tomando alcohol";"
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
