#!/bin/bash

touch process

ps aux >> process

cut -d ' ' -f 1,2 process > solousu

tar -czf proc-usu.tar.gz process solousu

rm process solousu

echo "¡Proceso completado! Se ha creado proc-usu.tar.gz con los archivos "
echo "process y solousu."

