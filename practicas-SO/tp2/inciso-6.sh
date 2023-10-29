#!/bin/bash
# Nombre del Script: inciso-6.sh
# Autor: Franco E. Ibañez
# Fecha de creación: 29 de octubre de 2023
# Descripción: Este script descomprime un archivo .tar.gz, extrae ciertas
#              líneas de interés de un archivo recién descomprimido, y las
#              inserta dentro de un archivo .txt .
# Uso:

# Comienzo

mkdir nuevo
touch listado

tar -xzvf ../tp1.tar.gz -C nuevo

grep -w 'ls' nuevo/tp1/hist.txt > listado

tar -czvf listado.tar.gz listado


# Fin

