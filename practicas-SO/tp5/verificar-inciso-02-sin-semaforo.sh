#!/bin/bash

contador_ceros=0
contador_no_ceros=0

for ((i = 0; i <= 1000; i++)); do
	salida=$(./inciso-02-sin-semaforo)

	if [ "$salida" == "0" ]; then
		((contador_ceros++))
	else
		((contador_no_ceros++))
		echo -en "$salida\t"
	fi
done

echo -e "\n\nSe retornó '0': $contador_ceros veces"
echo "Se retornaron valores distintos de '0': $contador_no_ceros veces"

