#!/bin/bash


if [ $# -ne 1 ]; then
  echo "Uso: $0 directorio"
  exit 1
fi

dir="$1"

find "$dir" -type f -name 'a*' -exec basename {} \; > name

find "$dir" -type f -name '*.txt' -exec basename {} \; > extend

find "$dir" -type f -perm 644 -exec basename {} \; > perm

find "$dir" -type f -size +1k -exec basename {} \; > tam

