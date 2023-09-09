#!/bin/bash

# Directorios de origen y destino
dir_origen="/tmp/freedos_mount/SRC/AsmCode"
dir_destino="/home/franco/programacion/ASM_scripts/SRC"

# Inicializar contadores
archivos_nuevos=0
archivos_modificados=0

# Verificar si hay archivos .ASM en el directorio de origen
if ls "$dir_origen"/*.ASM 1> /dev/null 2>&1; then
    # Iterar sobre los archivos .ASM en el directorio de origen
    for archivo_origen in "$dir_origen"/*.ASM; do
        archivo_nombre=$(basename "$archivo_origen")
        archivo_destino="$dir_destino/$archivo_nombre"

        # Calcular los hashes de los archivos
        hash_origen=$(md5sum "$archivo_origen" | awk '{print $1}')

        if [ -e "$archivo_destino" ]; then
            hash_destino=$(md5sum "$archivo_destino" | awk '{print $1}')
        else
            hash_destino=""
        fi

        # Comprobar si los hashes son diferentes
        if [ "$hash_origen" != "$hash_destino" ]; then
            if [ -e "$archivo_destino" ]; then
                archivos_modificados=$((archivos_modificados + 1))
            else
                archivos_nuevos=$((archivos_nuevos + 1))
            fi
            cp "$archivo_origen" "$archivo_destino"
        fi
    done
else
    echo "No se encontraron archivos .ASM en $dir_origen"
fi

# Mostrar el informe
echo "Informe:"
echo "Archivos nuevos copiados: $archivos_nuevos"
echo "Archivos modificados: $archivos_modificados"

