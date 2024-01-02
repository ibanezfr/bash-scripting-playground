#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Por favor, proporciona un nombre de directorio como argumento."
  exit 1
fi

directorio="$1"
archivo_perm="perm"
archivo_exten="exten"

find "$directorio" -type f -perm 755 > "$archivo_perm"

find "$directorio" -type f -name "*.conf" > "$archivo_exten"

echo "Archivos con permisos 755 guardados en '$archivo_perm'."
echo "Archivos con extensión .conf guardados en '$archivo_exten'."

