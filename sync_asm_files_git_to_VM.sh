#!/bin/bash

# Directorios de origen y destino
dir_origen="/home/franco/programacion/ASM_scripts/SRC"
dir_destino="/tmp/freedos_mount/SRC/AsmCode"

# Inicializar contadores
archivos_nuevos=0
archivos_modificados=0

# Verificar si hay archivos .ASM en el directorio de destino
if ls "$dir_destino"/*.ASM 1> /dev/null 2>&1; then
    # Iterar sobre los archivos .ASM en el directorio de destino
    for archivo_destino in "$dir_destino"/*.ASM; do
        archivo_nombre=$(basename "$archivo_destino")
        archivo_origen="$dir_origen/$archivo_nombre"

        # Calcular los hashes de los archivos
        hash_destino=$(md5sum "$archivo_destino" | awk '{print $1}')

        if [ -e "$archivo_origen" ]; then
            hash_origen=$(md5sum "$archivo_origen" | awk '{print $1}')
        else
            hash_origen=""
        fi

        # Comprobar si los hashes son diferentes
        if [ "$hash_destino" != "$hash_origen" ]; then
            if [ -e "$archivo_origen" ]; then
                archivos_modificados=$((archivos_modificados + 1))
            else
                archivos_nuevos=$((archivos_nuevos + 1))
            fi
            cp "$archivo_destino" "$archivo_origen"
        fi
    done
else
    echo "No se encontraron archivos .ASM en $dir_destino"
fi

# Mostrar el informe
echo "Informe:"
echo "Archivos nuevos copiados: $archivos_nuevos"
echo "Archivos modificados: $archivos_modificados"

