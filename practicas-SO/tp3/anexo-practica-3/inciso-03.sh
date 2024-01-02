#!/bin/bash

echo "Ingrese un número > "
read numero

for ((i = 1; i <= 6; i++))
do
  ((numero++))
  echo $numero
done | tac > num

echo "Se han generado los siguientes 6 números y se han guardado en el archivo"
echo "'num'."

