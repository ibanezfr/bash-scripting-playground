#!/bin/bash

memoria_total=$(free -h | awk '/Mem:/ {print $2}')
memoria_usada=$(free -h | awk '/Mem:/ {print $3}')
memoria_libre=$(free -h | awk '/Mem:/ {print $4}')

archivo_informe="Informe_de_RAM.txt"

echo "Total de memoria del sistema: $memoria_total" > "$archivo_informe"
echo "Total de memoria usada: $memoria_usada" >> "$archivo_informe"
echo "Total de memoria libre: $memoria_libre" >> "$archivo_informe"

echo "Informe de RAM generado correctamente. ¡Listo para revisar!"

