#!/bin/bash

while true
do
  echo "Este es un bucle infinito..."
  sleep 2
done & #ejecutar el bucle en 2do plano


# Para listar los procesos usar el comando: ps
#
# Para ver los procesos de forma online: top
#   Dentro de top, para matar un proceso, presionamos k, seguido del PID, y
#   luego la signal para terminarlo (de defecto ya está SIGTERM), enter.
#

