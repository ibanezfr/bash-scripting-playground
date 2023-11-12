#!/bin/bash

if [ ! -d "tp2" ]; then
  echo "La carpeta 'tp2' no existe."
  exit 1
fi

mkdir -p execu
mkdir -p no-execu

listado="archivos_copiados.txt"

for file in tp2/*; do
  if [ -x "$file" ]; then
    cp "$file" execu/
    echo "$file" >> "$listado"
  else
    cp "$file" no-execu/
  fi
done

echo -e "\nProceso completado. Archivos ejecutables copiados a 'execu', no
ejecutables a 'no-execu'."
echo "Listado de archivos copiados en '$listado':"
cat "$listado"

