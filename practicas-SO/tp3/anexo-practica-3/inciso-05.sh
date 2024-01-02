#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Por favor, proporciona un nombre de usuario como argumento."
  exit 1
fi

username=$1


shell=$(grep "^$username:" /etc/passwd | cut -d: -f7)


if [ -z "$shell" ]; then
  echo "El usuario $username no existe."
elif [ "$shell" = "/bin/bash" ]; then
  echo "El usuario $username tiene como shell bash."
else
  echo "El usuario $username tiene como shell $shell."
fi

