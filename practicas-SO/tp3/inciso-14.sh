#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Uso: $0 <archivo>"
  exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
  echo "El archivo $file no existe o no es un archivo ordinario."
  exit 1
fi

echo -n "Ingrese la cadena de caracteres a eliminar > "
read string

new_file="nuevo_$file"

grep "$string" "$file" > "$new_file"

sed -i "/$string/d" "$file"

chmod 600 "$new_file"

echo "Cadena eliminada y nuevo archivo creado: $new_file"

