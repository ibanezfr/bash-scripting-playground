#!/bin/bash


if [ $# -ne 1 ]; then
  echo "Por favor, proporciona un nombre de archivo como argumento."
  exit 1
fi

filename=$1

if [ -z "$filename" ]; then
  echo "El nombre del archivo están en blanco. Proporciona un nombre de archivo"
  echo " válido."
  exit 1
fi

if [ ! -f "$filename" ]; then
  echo "El archivo $filename no existe o no es un archivo ordinario."
  exit 1
fi

file_size=$(stat -c %s "$filename")

echo "El tamaño del archivo $filename es: $file_size bytes."


