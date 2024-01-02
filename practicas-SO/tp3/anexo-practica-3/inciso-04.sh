#!/bin/bash

if [ -z "$1" ]; then
  echo "Por favor, proporciona una palabra como argumento."
  exit 1
fi

palabra="$1"

for ((i=0; i<10; i++)); do
  echo "$palabra"
done

echo "$palabra" > word

tar -czf word.tar.gz word

echo "Proceso completado: la palabra se imprimió 10 veces, se guardó en el"
echo " archivo 'word' y se comprimió en 'word.tar.gz'."

