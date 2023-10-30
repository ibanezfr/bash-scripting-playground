#!/bin/bash

# Nombre de archivo: inciso-01.sh
# Nombre de autor: Franco E. Ibañez
# Fecha de creación: 30 de octubre de 2023
# Descripción: Este script lee diversas variables de entorno y las va guardando
#              en un archivo llamado var-set.

if [ -f "var-set" ]; then
  rm "var-set"
fi

echo "HOSTNAME: $HOSTNAME" >> var-set
echo "HOME: $HOME" >> var-set
echo "LOGNAME: $LOGNAME" >> var-set
echo "PATH: $PATH" >> var-set
echo "" >> var-set

