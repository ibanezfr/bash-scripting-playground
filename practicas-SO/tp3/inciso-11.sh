#!/bin/bash


while true
do
  read -p "Introducir palabra clave > " keyword

  if [ "$keyword" == "secreto" ]; then
    echo "¡Bienvenido!"
    break
  else
    echo "Incorrecto. Inténtelo nuevamente."
  fi

done

