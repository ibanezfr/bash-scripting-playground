#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Por favor, proporciona un archivo como parámetro."
  exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
  echo "El archivo '$file' no existe."
  exit 1
fi

tr 'a-z' 'A-Z' < "$file" > "$file.tmp"
mv "$file.tmp" "$file"

echo "Se han convertido todas las letras a mayúsculas en el archivo'$file'."


