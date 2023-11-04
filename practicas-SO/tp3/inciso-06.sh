#!/bin/bash


if [ $# -ne 1 ]; then
  echo "Uso: $0 <directorio>"
fi

dir="$1"

echo "Archivos modificados en los últimos 30 minutos: "
find "$dir" -type f -mmin -30

echo "Archivos accedidos en los últimos 60 minutos: "
find "$dir" -type f -amin -60

echo "Archivos modificados en los últimos 5 días: "
find "$dir" -type f -mtime -5

echo "Archivos modificados hace más de 10 días: "
find "$dir" -type f -mtime +10


