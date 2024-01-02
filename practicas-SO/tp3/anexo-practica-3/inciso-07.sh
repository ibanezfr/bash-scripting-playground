#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Por favor, proporciona un nombre de archivo como argumento."
  exit 1
fi

filename=$1
output_file="copia"

if [ ! -f "$filename" ]; then
  echo "El archivo $filename no existe."
  exit 1
fi

while IFS= read -r line; do
  echo "$line"
  echo "$line" >> "$output_file"
  sleep 3
done < "$filename"

echo "Proceso completado. Las líneas se han guardado en el archivo 'copia'."

