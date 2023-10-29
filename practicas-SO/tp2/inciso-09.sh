#!/bin/bash


# Comienzo

file="/etc/passwd"

if [ -f $file ]; then
  cat $file | while IFS= read -r line; do
    echo $line
  done
else
  echo "El archivo $file no existe."
fi


# Fin
