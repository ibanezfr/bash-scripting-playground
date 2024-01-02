#!/bin/bash

if [ -z "$1" ]; then
  echo "Por favor, proporciona un directorio como parámetro."
  exit 1
fi

directorio="$1"

archivo_total="TOT_GENERAL"

total_lineas=0

for archivo in "$directorio"/*; do
  if [ -f "$archivo" ]; then
    lineas_archivo=$(wc -l < "$archivo")
    total_lineas=$((total_lineas + lineas_archivo))
    echo "El archivo $archivo tiene $lineas_archivo líneas."
  fi
done

total_lineas_msg="El total de líneas de todos los archivos es : $total_lineas"

echo "$total_lineas_msg" > "$archivo_total"
echo "Se ha guardado el total de líneas en '$archivo_total'."

