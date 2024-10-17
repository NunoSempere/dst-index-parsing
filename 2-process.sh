#!/bin/bash

for file in downloads/*; do
  # echo $file
  cat $file | sed -n '/<pre class="data">/,/<\/pre>/p'  | head -n-2 | tail -n+9 | cut -d' ' -f3- | sed 's|-|\n-|g' | sed 's| |\n|g' | sed '/^$/d'
done
