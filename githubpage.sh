#!/bin/bash
# Create the output CSV file
echo "source,last_modified" > githubswithdates.csv

# Read each source URL from sources.txt
cat "./sources.txt" | while read link
do
    echo "Parsing $link"
        escaped_link=$(printf '%s\n' "$link" | sed -e 's/[]\/$*.^[]/\\&/g')
            curl -s "$link" | grep -oP '<script type="application/json" data-target="react-app.embeddedData".*?"refInfo"'| grep -oP 'datetime="\K[^"]+' | cut -d "T" -f 1 | sed -e 's/^[[:space:]]*//' | xargs -I {} date -d {} +%d/%m/%Y | sed "s/^/${escaped_link},/g" | while IFS= read -r line
            do
                echo "$line" >> githubswithdates.csv
            done
done