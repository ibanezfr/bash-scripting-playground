#!/bin/bash


# Comienzo

if [ $# -ne 1 ]; then
  echo "Uso: $0 <username>"
  exit 1
fi

username="$1"
uid="uid"
guid="guid"

users_file="usuarios"
if [ -f "$users_file" ]; then
  new_line="$username:x::$uid:$guid::/home/$username:/bin/bash"

  echo "$new_line" >> "$users_file"
  echo "Usuario '$username' añadido al archivo 'usuarios'."
else
  echo "El archivo '$users_file' no existe."
fi

# Fin

