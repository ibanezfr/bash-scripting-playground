#!/bin/bash


if [ "$#" -ne 2 ]; then
  echo "Uso: ./inciso-10.sh <cadena-1> <cadena-2>"
  exit 1
fi

str1="$1"
str2="$2"

if [ "$str1" == "$str2" ]; then
  echo "Las cadenas son iguales."
else
  echo "Las cadenas son diferentes."
fi


