#!/bin/bash

: << EOF
Nombre del script: inciso-2.sh
Autor: Franco E. Ibañez
Frecha de creación: 26 de octubre de 2023
Descripción: Este script muestra el espacio disponible en el sistema de
             archivos raíz.
Uso: ./inciso-2.sh
EOF

# Comienzo

espacio_disponible=$(df -h | grep -E '/$' | awk {'print $4'})

clear

echo -e "\n\n\nEl espacio disponible en el sistema de archivos raíz es:\
 $espacio_disponible\n\n\n"

# Fin

: << EOF
1. df -h
    El comando df se utiliza para mostrar información sobre el uso del disco en
    sistemas Unix/Linux. La opción -h "human-readable" formatea la salida de
    manera que los tamaños de disco se muestren en un formato más fácil de
    entender.

2. |
    El símbolo pipe se utiliza para redigir la salida del comando 'df -h' al
    comando siguiente.

3. grep -E '/$'
    El comando grep se usa para buscar patrones en texto. La opción -E permite
    usar expresiones regulares extendidas. '/' es el patrón que estamos
    buscando, y '$' significa que debe estar al final de la línea. El objetivo
    es capturar las líneas que contengan el sistema de archivos raíz("/").

4. awk {'print $4'}
    awk es un lenguaje de procesamiento de texto y se utiliza aquí para
    imprimir la cuarta columna de la entrada (segundo pipe). Dentro de las
    comillas simples, 'print $4' indica que se debe imprimir el cuarto campo o
    columna de la línea. En este contexto, el cuarto campo representa el
    espacio disponible en el sistema de archivos.
EOF

