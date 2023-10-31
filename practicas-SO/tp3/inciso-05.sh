#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Uso: $0 directorio mes (número del mes)"
  exit 1
fi

dir="$1"
mes="$2"

if ! [[ "$mes" =~ ^[0-9]+$ ]] || [ "$mes" -lt 1 -o "$mes" -gt 12 ]; then

  echo "El mes ingresado es inválido. Debe ser un número entre 1 y 12."
  exit 1

fi

found=false

for file in "$dir"/*; do

  if [ -f "$file" ] && [ "$(stat -c %y "$file" | cut -d ' ' -f 1 | \
    cut -d '-' -f 2)" -eq "$mes" ]; then

    echo "$file fue modificado el mes $mes."
    found=true
  fi
done

if [ "$found" = false ]; then
  echo "No se encontraron archivos modificados en el mes $mes"
fi

# [[ "$mes" =~ ^[0-9]+$ ]]:
#   Esto es una expresión condicional que utiliza el operador [[ ... ]] y el
#   operador =~ para realizar una coincidencia de patrones utilizando una
#   expresión regular. En este caso, la expresión regular ^[0-9]+$ verifica si
#   la variable $mes contiene solo dígitos numéricos
#   (es decir, si es un número).
#   Veamos los componentes:

#   ^: Indica que la coincidencia debe comenzar desde el principio de la cadena.
#   [0-9]: Representa cualquier dígito numérico, es decir, del 0 al 9.
#   +: Indica que debe haber al menos un dígito, pero puede haber más.
#   $: Indica que la coincidencia debe llegar al final de la cadena.


# $(stat -c %y "$file" | cut -d ' ' -f 1 | cut-d '-' -f 2)
#
# stat -c %y "$file":
#   El comando stat se utiliza para mostrar información sobre un archivo, y la
#   opción -c permite especificar el formato en el que se mostrará la
#   información. En este caso, %y es un formato que muestra la fecha y hora de
#   la última modificación del archivo.
#   $file es la variable que contiene el nombre del archivo en cuestión.
#   El resultado de esta parte será algo como:
#   "2023-04-15 13:45:22.000000000 +0000".

# |:
#    Este es el operador de tubería, que toma la salida del comando anterior y
#    la pasa como entrada al siguiente comando.

# cut -d ' ' -f 1:
#    El comando cut se utiliza para dividir o cortar una línea de texto en
#    partes. Aquí, -d ' ' especifica que el delimitador utilizado para dividir
#    la línea es un espacio en blanco. -f 1 indica que queremos la primera
#    parte de la línea dividida. En este caso, estamos tomando la parte de la
#    fecha, que está separada de la hora por un espacio en blanco.
#    Entonces, esta parte del comando extrae la fecha, que será "2023-04-15".


# cut -d '-' -f 2:
#    Nuevamente, usamos el comando cut, pero esta vez estamos dividiendo la
#    fecha extraída en partes basadas en el guión ("-") como delimitador,
#    y -f 2 significa que estamos tomando la segunda parte. En este contexto,
#    la segunda parte es el mes de la fecha. Por lo tanto, esta parte del
#    comando extrae el mes, que será "04" en este ejemplo.
