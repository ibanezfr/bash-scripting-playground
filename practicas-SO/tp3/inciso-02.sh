#!/bin/bash

# Nombre del script: inciso-02.sh
# Autor: Franco E. Ibañez
# Fecha de creación: 31 de octubre de 2023
# Descripción: Recorre la carpeta tp2, y asigna permisos de ejecución a otros,
#              y de escritura al grupo del dueño, a los archivos con extensión
#              .sh .

dir="../tp2"

if [ -d "$dir" ]; then

  find "$dir" -type f -name "*.sh" -exec chmod 775 {} \;

  echo "Permisos cambiados con éxito para los scripts de la carpeta $dir"

else

  echo "El directorio $dir no existe"

fi

# La parte -exec chmod 775 {} \; que se encuentra en el comando find es una
# acción ejecutada en cada archivo que cumple con las condiciones especificadas
# en la búsqueda.
#
#   -exec: Indica que se ejecutará un comando en los archivos que cumplan con
#   las condiciones especificadas.

#   chmod 775 {}: Es el comando que se ejecuta en cada archivo encontrado.
#   chmod es un comando para cambiar los permisos de archivos.
#   En este caso, 775 son los permisos que se están estableciendo:
#   lectura, escritura y ejecución para el propietario, lectura y
#   ejecución para el grupo, y lectura y ejecución para otros.

#   {}: Este es un marcador que representa cada archivo encontrado por el
#   comando find. En cada iteración, se sustituirá por el nombre del archivo
#   actual.

#   \;: Indica el final del comando -exec. Es importante colocar un
#   espacio antes del \;.
#
# El número "775" que se usa en el comando chmod representa los permisos de
# lectura, escritura y ejecución en un sistema Unix o Linux.
# Estos números son parte de un sistema octal de representación de permisos,
# donde cada dígito se refiere a un conjunto específico de permisos.

#   El primer dígito (7) se refiere a los permisos del propietario del archivo.
#   En "775", el propietario tiene permisos de lectura (4) + escritura (2) +
#   ejecución (1), lo que suma 7.

#   El segundo dígito (7) se refiere a los permisos del grupo al que pertenece
#   el archivo. En "775", el grupo tiene los mismos permisos que el
#   propietario: lectura (4) + escritura (2) + ejecución (1), lo que suma 7.

#   El tercer dígito (5) se refiere a los permisos para otros usuarios
#   (usuarios que no son el propietario ni están en el grupo).
#   En "775", los otros usuarios solo tienen permisos de lectura (4) +
#   ejecución (1), lo que suma 5.

