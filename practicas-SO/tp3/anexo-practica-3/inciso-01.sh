# Autor: Franco E. Ibañez
# Fecha: 12 de diciembre de 2023
# Descripción: Este script primero verifica si se proporcionaron los dos
#              parámetros esperados. Luego, comprueba si el archivo dado existe.
#              Posteriormente, utiliza el comando 'grep' para buscar la cadena
#              en el archivo. Si la cadena se encuentra en el archivo, muestra
#              un mensaje indicando su presencia; de lo contrario, muestra un
#              mensaje indicando que no se econtró la cadena en el archivo.

#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Por favor, proporciona un archivo y una cadena de texto como parámetros"
  exit 1
fi

file="$1"
str="$2"

if [ ! -f "$file" ]; then
  echo "El archivo '$file' no existe."
  exit 1
fi

if grep -q "$str" "$file"; then
  echo "La cadena '$str' está en el archivo '$file'"
else
  echo "La cadena '$str' NO está en el archivo '$file'"
fi

