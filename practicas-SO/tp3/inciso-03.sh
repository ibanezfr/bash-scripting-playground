#!/bin/bash


dir="../tp1"

if [ -d "$dir" ]; then

  find "$dir" -type f -perm 644 -exec basename {} \; > perm644

  echo "Lista creada con éxito en archivo perm644"
else
  echo "El directorio $dir no existe"
fi

