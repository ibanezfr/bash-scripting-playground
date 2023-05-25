#!/bin/bash

# Obtener el año actual
YEAR=$(date +%Y)

# Texto del banner
TITLE_LINE_1="Potencia tu Trabajo en la Terminal Bash:"
TITLE_LINE_2="     Domina los Atajos de Teclado    "
TITLE_LINE_3="      para un Rendimiento Máximo    "
USERNAME="@francoibanezweb"

# Obtener el ancho de la pantalla
SCREEN_WIDTH=$(tput cols)

# Calcular el espacio en blanco antes y después de cada línea del título
TITLE_SPACING=$((($SCREEN_WIDTH - ${#TITLE_LINE_1}) / 2))

# Calcular el espacio en blanco antes y después del nombre de usuario y el año
USER_SPACING=$((($SCREEN_WIDTH - ${#USERNAME} - ${#YEAR} - 1) / 2))

# Imprimir línea separadora superior con asteriscos
printf "%*s\n" $SCREEN_WIDTH | tr ' ' '*'
printf "%*s\n\n" $SCREEN_WIDTH | tr ' ' '*'

# Cambiar el tamaño de la fuente del título (línea 1)
tput bold
tput smso
printf "%*s%s%*s\n\n" $TITLE_SPACING "" "$TITLE_LINE_1" $TITLE_SPACING ""
tput sgr0

# Cambiar el tamaño de la fuente del título (línea 2)
tput bold
tput smso
printf "%*s%s%*s\n\n" $TITLE_SPACING "" "$TITLE_LINE_2" $TITLE_SPACING ""
tput sgr0

# Cambiar el tamaño de la fuente del título (línea 3)
tput bold
tput smso
printf "%*s%s%*s\n\n" $TITLE_SPACING "" "$TITLE_LINE_3" $TITLE_SPACING ""
tput sgr0

# Cambiar el tamaño de la fuente del nombre de usuario y el año
tput bold
printf "%*s%s %s%*s\n\n" $USER_SPACING "" "$USERNAME" "$YEAR" $USER_SPACING ""
tput sgr0

# Imprimir línea separadora inferior con asteriscos
printf "%*s\n" $SCREEN_WIDTH | tr ' ' '*'
printf "%*s\n\n" $SCREEN_WIDTH | tr ' ' '*'

