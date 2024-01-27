#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Por favor, ingresa un valor de umbral como parámetro."
  exit 1
fi

umbral=$1

while true; do
  memoria_libre=$(free -k | awk 'NR==2{print $4}')

  if [ $memoria_libre -lt $umbral ]; then
    echo "¡Alerta! La memoria libre ha alcanzado el umbral de $umbral KB."
  fi

  sleep 5

done

