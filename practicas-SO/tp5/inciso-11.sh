#!/bin/bash

tamanio_pag=1024

calc_dir_fis(){
  pag=$1
  despl=$2
  inicio_pag=$3

  if [ $4 -eq 1 ]; then
    dir_fis=$((inicio_pag + despl))
    echo "Dirección física de Página $pag Desplazamiento $despl: $dir_fis"
  else
    echo "Página $pag no es válida."
  fi
}


declare -A tabla_pags

tabla_pags[P0]="4096 1 80"
tabla_pags[P1]="8192 1 600"
tabla_pags[P2]="2048 0 35"
tabla_pags[P3]="6144 1 150"
tabla_pags[P4]="1024 0 327"



echo  ""

for pagina in "${!tabla_pags[@]}"; do 

  datos=(${tabla_pags[$pagina]})

  calc_dir_fis "${pagina:1}" "${datos[2]}" "${datos[0]}" "${datos[1]}"

done

echo ""

