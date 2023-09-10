#!/bin/bash

# Directorios de origen y destino
dir_origen="/home/franco/programacion/ASM_scripts/SRC"
dir_destino="/tmp/freedos_mount/SRC/AsmCode"

# Inicializar contadores
archivos_nuevos=0
archivos_modificados=0

# Usar find y grep para encontrar archivos .ASM y .asm (ignorar mayúsculas y minúsculas)
archivos_a_copiar=$(find "$dir_origen" -type f | grep -iE '\.asm$')

# Iterar sobre los archivos encontrados y copiarlos
for archivo_origen in $archivos_a_copiar; do
    archivo_nombre=$(basename "$archivo_origen")
    archivo_destino="$dir_destino/$archivo_nombre"

    if [ -e "$archivo_destino" ] && [ "$archivo_origen" -nt "$archivo_destino" ]; then
        archivos_modificados=$((archivos_modificados + 1))
        cp "$archivo_origen" "$archivo_destino"
    elif [ ! -e "$archivo_destino" ]; then
        archivos_nuevos=$((archivos_nuevos + 1))
        cp "$archivo_origen" "$archivo_destino"
    fi
done

# Mostrar el informe
echo "Informe:"
echo "Archivos nuevos copiados: $archivos_nuevos"
echo "Archivos modificados: $archivos_modificados"

