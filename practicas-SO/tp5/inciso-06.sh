#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 [enable/disable]"
  exit 1
fi

option=$1

case "$option" in
  "enable")
    echo "Habilitando la memoria swap..."
    sudo swapon -a
    ;;
  "disable")
    echo "Deshabilitando la memoria swap..."
    sudo swapoff -a
    ;;
  *)
    echo -e "Opción no válida. Usa 'enable' para habilitar o "
		echo "'disable' para deshabilitar."  
    exit 1
    ;;
esac

exit 0
