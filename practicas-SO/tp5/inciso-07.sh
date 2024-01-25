#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta el script como superusuario (root)."
  exit 1
fi

cambiar_nivel_intercambio() {
  local nivel=$1
  case "$nivel" in
    0)
      sysctl -w wm.swappiness=0
      ;;
    50)
      sysctl -w vm.swappiness=50
      ;;
    100)
      sysctl -w vm.swappiness=100
      ;;
    *)
      echo -e "Error: Nivel de intercambio inválido. Por favor, elegir entre "
      echo "0, 50 o 100."
      exit 1
      ;;
  esac
}

read -p "Selecciona el nivel del intercambio (0, 50, 100) > " nivel_swap
cambiar_nivel_intercambio "$nivel_swap"


exit 0

