#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Este script necesita privilegios de superusuario para liberar memoria."
  echo "Por favor, ejecútalo con 'sudo'."
  exit 1
fi

if ! command -v dmidecode &> /dev/null; then
  echo "dmidecode no está instalado. Intentando instalar..."

  if command -v apt-get &> /dev/null; then
     apt-get update
     apt-get -y install dmidecode
  else
    echo -e "Este sistema NO está basado en Debian. Por favor, instala "
    echo "dmidecode manualmente."
    exit 1
  fi
fi

mod_mem_max=$(dmidecode -t 16 | awk '/Maximum Capacity/ {print $3}')

mem_fisica_max=$((mod_mem_max * $(dmidecode -t 16 | awk '/Number Of Devices/ {print $4}')))


echo -e "\nMemoria Física Máxima Instalable:\t$mem_fisica_max GB"
echo -e "Tamaño Máximo del Módulo de Memoria:\t$mod_mem_max GB"


