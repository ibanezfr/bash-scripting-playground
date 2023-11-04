#!/bin/bash


while true
do
  echo -e "\nMenú:"
  echo -e "\t1. Borrar un archivo"
  echo -e "\t2. Visualizar un archivo"
  echo -e "\t3. Copiar un archivo al directorio actual"
  echo -e "\t0. Salir\n"

  read -p "Elija una opción (1/2/3/0) > " opcion

  case $opcion in
    1)
      read -p "Ingrese la ruta del archivo que desea borrar > " archivo
      rm -i "$archivo" # -i pide confirmación antes de borrar
    ;;
    2)
      read -p "Ingrese la ruta del archivo que desea visualizar > " archivo
      clear
      echo -e "\n\n"
      cat "$archivo"
    ;;
    3)
      read p "Ingrese la ruta del archivo que desea copiar > " archivo
      cp "$archivo" .
    ;;
    0)
      echo "Saliendo del script"
      exit 0
    ;;
    *)
      "Opción no válida. Por favor elija una opción válida (1/2/3/0)."
    ;;
  esac
done

