#!/bin/bash

waiting_processes=$(ps -eo stat | grep -c "R")

sleeping_processes=$(ps -eo stat | grep -c "S")

swap_processes=$(grep Swap /proc/*/status 2>/dev/null | awk '{ sum += $2 } END { print sum }')

swap_in=$(grep SwapIn /proc/vmstat | awk '{ print $2 }')

swap_out=$(grep SwapOut /proc/vmstat | awk '{ print $2 }')

echo "a) Procesos esperando por CPU: $waiting_processes"
echo "b) Número de procesos en estado dormido: $sleeping_processes"
echo "c) Memoria swap utilizada por procesos dormidos: $swap_processes KB"
echo "d) Cantidad de memoria intercambiada desde el disco: $swap_in KB"
echo "e) Cantidad de memoria intercambiada hacia el disco: $swap_out KB"

