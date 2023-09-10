#!/bin/bash

# Directorios de origen y destino
dir_origen="/home/franco/programacion/ASM_scripts/SRC"
dir_destino="/tmp/freedos_mount/SRC/AsmCode"

# Inicializar contadores
archivos_nuevos=0
archivos_modificados=0

# Verificar si hay archivos .ASM en la carpeta de destino
if ls "$dir_destino"/*.ASM 1> /dev/null 2>&1; then
    # Iterar sobre los archivos .ASM en la carpeta de destino
    for archivo_destino in "$dir_destino"/*.ASM; do
        archivo_nombre=$(basename "$archivo_destino")
        archivo_origen="$dir_origen/$archivo_nombre"

        # Comprobar si el archivo de origen existe y si es diferente del archivo de destino
        if [ -e "$archivo_origen" ] && [ "$archivo_destino" -nt "$archivo_origen" ]; then
            archivos_modificados=$((archivos_modificados + 1))
            cp "$archivo_origen" "$archivo_destino"
        fi
    done
else
    # Si no existen archivos .ASM en la carpeta de destino, copiar todos los archivos .ASM desde la carpeta de origen
    cp "$dir_origen"/*.ASM "$dir_destino"
    archivos_nuevos=$(ls -1 "$dir_origen"/*.ASM | wc -l)
fi

# Mostrar el informe
echo "Informe:"
echo "Archivos nuevos copiados: $archivos_nuevos"
echo "Archivos modificados: $archivos_modificados"

