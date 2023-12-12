
#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Por favor, proporciona un directorio como parámetro"
  exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
  echo "El directorio '$dir' no existe."
  exit 1
fi

out="primeras_lineas.txt"

echo "===Primeras 5 líneas de archivos en el directorio: $dir ===" > "$out"

for file in "$dir"/*; do
  if [ -f "$file" ]; then
    echo "Archivo: $file" >> "$out"
    echo "=========================" >> "$out"
    head -n 5 "$file" >> "$out"
    echo "" >> "$out"
  fi
done

echo "Las primeras 5 líneas de cada archivo en '$dir' han sido guardadas en
'$out'"

