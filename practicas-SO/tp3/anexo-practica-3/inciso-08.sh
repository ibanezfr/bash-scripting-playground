#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Por favor, proporciona un nombre de directorio como argumento."
  exit 1
fi

directory=$1
output_file="solo-archi"
counter=0

if [ -z "$directory" ]; then
  echo "El nombre del directorio está en blanco. Proporciona un nombre"
  echo " de directorio válido."
  exit 1
fi

if [ ! -d "$directory" ]; then
  echo "El directorio $directory no existe."
  exit 1
fi

for file in "$directory"/*; do
  if [ -f "$file" ]; then
    echo "$(basename "$file")" >> "$output_file"
    ((counter++))
  fi
done

echo "Cantidad de archivos comunes: $counter" >> "$output_file"
echo "Proceso completado. Los nombres de los archivos comunes se han guardado"

