#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Este script necesita privilegios de superusuario para liberar memoria."
  echo "Por favor, ejecútalo con 'sudo'."
  exit 1
fi

echo "Seleccionar nivel de liberación:"
echo "0: No liberar nada"
echo "1: Liberar pagecache"
echo "2: Liberar inodos y dentries"
echo "3: Liberar pagacache, inodos y dentries"
read -p "Ingresa el número correspondiente al nivel de liberación > " nivel

free -h > mem-actual

case $nivel in
  0)
    echo "No se liberaró nada de la memoria cache."
    ;;
  1)
    echo "Forzando al kernel a liberar la pagecache."
    sync && echo 1 > /proc/sys/vm/drop_caches
    ;;
  2)
    echo "Forzando al kernel a liberar inodos y dentries."
    sync && echo 2 > /proc/sys/vm/drop_caches
    ;;
  3)
    echo "Forzando al kernel a liberar pagecache, inodos y dentries."
    sync && echo 3 > /proc/sys/vm/drop_caches
    ;;
  *)
    echo "Opción inválida."
    exit 1
    ;;
esac

free -h > mem-limpia

echo "Proceso completado. Revisa los archivos mem-actual y mem-limpia."

