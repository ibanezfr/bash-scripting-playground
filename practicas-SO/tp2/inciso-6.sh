#!/bin/bash
# Nombre del Script: inciso-6.sh
# Autor: Franco E. Ibañez
# Fecha de creación: 29 de octubre de 2023
# Descripción: Este script se centra en descomprimir un archivo .tar.gz y
#              buscar líneas de interés en un archivo específico dentro de la
#              carpeta descomprimida. Luego, guarda estas líneas en un archivo
#              de texto y lo comprime en formato .tar.gz.
# Uso: ./inciso-6.sh

# Comienzo

mkdir nuevo
touch listado

tar -xzvf ../tp1.tar.gz -C nuevo

grep -w 'ls' nuevo/tp1/hist.txt > listado

tar -czvf listado.tar.gz listado


# Fin

