#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Por favor, proporciona un directorio como parámetro."
  exit 1
fi

dir="$1"

for file in "$dir"/*; do
  if [ -f "$file" ]; then
    sed 's/^/   /' "$file" > "${file}.tmp"
    mv "${file}.tmp" "$file"

    echo "Se han insertado 3 espacios en blanco el principio de cada línea en
    '$file'."
  fi
done

echo -e "\nProceso completado. Archivos modificados en el directorio '$dir'."

