#!/bin/bash



# Comienzo

dir=nuevo/tp1

if [ -d $dir ]; then
  for file in $dir/*.txt; do
    if [ -f "$file" ]; then
      chmod o+w "$file"
      echo "Se asignaron permisos de escritura a otros en: $file"
    fi
  done
else
  echo "El directorio 'tp1' no existe."
fi

# Fin

