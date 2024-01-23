#!/bin/bash

iteraciones=10

if [ $# -eq 1 ]; then
  iteraciones=$1
fi

echo "Iniciando script. Presiona Ctrl + C para deternlo o se detendrá después "
echo "de $1 iteraciones."

for ((i = 1; i <= $iteraciones; i++)); do
  echo "Realizando tarea en la iteración $i..."
  sleep 1

done

echo "Script finalizado después de $1 iteraciones."

