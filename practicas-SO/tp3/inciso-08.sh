#!/bin/bash


if [ $# -ne 1 ]; then
  echo "Uso: $0 <directorio>"
  exit 1
fi

dir="$1"

if [ -d "$dir" ]; then
  fileCount=0
  dirCount=0

  for item in "$dir"/*; do
    if [ -f "$item" ]; then
      fileCount=$((fileCount + 1))
    elif [ -d "$item" ]; then
      dirCount=$((dirCount + 1))
    fi
  done

  echo "Archivos: $fileCount" > conteo.txt
  echo "Directorios: $dirCount" >> conteo.txt

  echo "Contadores guardados en conteo.txt"

else
  echo "El directorio $dir no existe."
  exit 1
fi
