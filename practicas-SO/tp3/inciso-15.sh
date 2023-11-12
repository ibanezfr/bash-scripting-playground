#!/bin/bash

if [ -z "$1" ]; then
  echo "Debe pasarse el directorio como parámetro."
  exit 1
fi

mkdir -p tp3/scripts-sh

for file in $1/*.sh; do
  content=$(cat "$file")
  content=$(echo "$content" | sed "s/bash/sh/g")

  echo "$content" > tp3/scripts-sh/$(basename "$file")
done

