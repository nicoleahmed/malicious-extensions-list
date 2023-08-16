#!/bin/bash
# update_refresh_sources_list.sh
# Go through all source urls and find last modfied date
# Produce csv of source url and last modified date
# Sources are listed in sources.txt
# Output is written to sourceswithdates.csv

# Create the output CSV files
echo "source,last_modified" > sourceswithdates.csv

# Read each source URL from sources.txt
cat "./sources.txt" | while read link
do
    echo "Parsing $link"
    escaped_link=$(printf '%s\n' "$link" | sed -e 's/[]\/$*.^[]/\\&/g')
        curl -s -I "$link" | grep -i "last-modified" | awk -F ':' '{print $2}' | sed -e 's/^[[:space:]]*//' | xargs -I {} date -d {} +%d/%m/%Y | sed "s/^/${escaped_link},/g" | while IFS= read -r line
        do
            echo "$line" >> sourceswithdates.csv
        done
done
