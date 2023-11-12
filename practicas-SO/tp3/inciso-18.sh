#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Por favor, proporciona un directorio como parámetro".
  exit 1
fi

dir="$1"
dir_salida="ar-modificados"

if [ ! -d = "$dir_salida" ]; then
  mkdir "$dir_salida"
fi

for file in "$dir"/*; do
  if [ -f "$file" ]; then
    file_name=$(basename "$file")

    file_name="$dir_salida/${file_name}-m"

    sed '2,5d' "$file" > "$file_name"

    echo "Se han eliminado las líneas 2 a 5 de '$file_name' y se ha guardado
    en $file_name"
  fi
done

echo "Proceso completado. Los archivos modificados se encuentran en el
directorio '$dir_salida'."

