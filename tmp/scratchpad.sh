cat 195701.html | sed -n '/<pre class="data">/,/<\/pre>/p' | 
cat 195701.html | sed -n '/<pre class="data">/,/<\/pre>/p'  | head -n-2 | tail -n+9 | cut -d' ' -f3- | sed 's|-|\n-|g'
cat 195701.html | sed -n '/<pre class="data">/,/<\/pre>/p'  | head -n-2 | tail -n+9 | cut -d' ' -f3- | sed 's|-|\n-|g' | sed 's| |\n|g' | sed '/^$/d'

