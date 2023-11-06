#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Uso: $0 <directorio1> <directorio2>"
  exit 1
fi

dir1="$1"
dir2="$2"

if [ ! -d "$dir1" ]; then
  echo "El directorio $dir1 no existe."
  exit 1
fi

if [ ! -d "$dir2" ]; then
  echo "El directorio $dir2 no existe."
  exit 1
fi

size1=$(du -s "$dir1" | cut -f1)
size2=$(du -s "$dir2" | cut -f1)

if [ "$size1" -gt "$size2" ]; then
  echo "$dir1 es más grande que $dir2."
elif [ "$size2" -gt "$size1" ]; then
  echo "$dir2 es más grande que $dir1."
else
  echo "Ambos directorios tienen el mismo tamaño."
fi

