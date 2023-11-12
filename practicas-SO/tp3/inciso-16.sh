#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Por favor, proporciona un archivo como parámetro."
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "El archivo proporcionado no es de tipo ordinario."
  exit 1
fi

start_line=5
end_line=10

sed -i "${start_line},${end_line}d" "$1"

echo "Se han borrado las líneas de la $start_line a la $end_line del archivo $1"

