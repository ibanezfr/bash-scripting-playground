#!/bin/bash
: << EOF
Nombre del script: inciso-3.sh
Autor: Franco E. Ibañez
Fecha de creación: 26 de octubre de 2023
Descripción: Este script determina cuál entre 2 archivos posee la mayor
            cantidad de líneas. No recibe dichos archivos como parámetros.
Uso: ./inciso-3.sh
EOF

# Comienzo

arch1="inciso-1.sh"
arch2="inciso-2.sh"

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

