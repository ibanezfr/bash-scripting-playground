#!/bin/bash


read -p "Ingrese un número: " num1
read -p "Igrese otro número: " num2

suma=$(echo "$num1 + $num2" | bc)
resta=$(echo "$num1 - $num2" | bc)
producto=$(echo "$num1 * $num2" | bc)
division=$(echo "scale=2; $num1 / $num2" | bc)

echo -e "\n\t$num1 + $num2 = $suma"
echo -e "\t$num1 - $num2 = $resta"
echo -e "\t$num1 * $num2 = $producto"
echo -e "\t$num1 / $num2 = $division\n"

