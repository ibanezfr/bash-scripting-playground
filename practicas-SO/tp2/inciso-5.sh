#!/bin/bash
# Nombre del Script: inciso-5.sh
# Autor: Franco E. Ibañez
# Fecha de creación: 29 de octubre de 2023
# Descripción:
#
# Uso:
# Ingresar este comando para poder usar el script en cualquier carpeta:
# (Disponible hasta que cierra la sesión actual)
#
# alias inciso5="$(pwd)/inciso-5.sh"


# Comienzo
if [ $# -ne 1 ]; then
  echo "Debes pasar un directorio como argumento."
  exit 1
fi

dir="$1"
files=0
dirs=0

if [ -d "$dir" ] || [ "$dir" = "." ]; then
  for item in "$dir"/*; do
    if [ -f "$item" ]; then
      files=$((files + 1))
    elif [ -d "$item" ]; then
      dirs=$((dirs + 1))
    fi
  done

  echo -e "\n'$dir' posee:\n"
  echo -e "\t$files archivos\n"
  echo -e "\t$dirs directorios\n"

else

  echo "Directorio inexistente"

fi
# Fin

