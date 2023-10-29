#!/bin/bash
: << EOF
Nombre del script: inciso-3.sh
Autor: Franco E. Ibañez
Fecha de creación: 26 de octubre de 2023
Descripción: Este script determina cuál entre 2 archivos posee la mayor
            cantidad de líneas. Recibe dichos archivos como parámetros.
            Además comprueba que se hallan pasado los archivos al script.
Uso: ./inciso-3.sh archivoA.sh archivoB.sh
EOF

# Comienzo

if [ $# -ne 2 ]; then
  echo "Por favor, proporciona 2 nombres de archivos como argumentos."
  exit 1
fi

arch1="$1"
arch2="$2"

lin1=$(wc -l < $arch1)
lin2=$(wc -l < $arch2)

if [ $lin1 -gt $lin2 ]; then
  echo -e "\n\nEl archivo $arch1 tiene más líneas que el archivo $arch2.\n"
elif [ $lin2 -gt $lin1 ]; then
  echo -e "\n\nEl archivo $arch2 tiene más líneas que el archivo $arch1.\n"
else
  echo -e "\n\nLos archivos $arch1 y $arch2 tienen la misma cantidad \
    de líneas.\n"
fi

# Fin


