#!/bin/bash
# Written by randomaccess3 at https://github.com/randomaccess3/detections/tree/main/extensions/chromium
# Produce a list of chromium extension ids that have been flagged as malicious 
# to produce csv from web sources of malicious extension IDs
# Sources are listed in sources.txt
# Output is written to live_extensions.csv and dead_extensions.csv


# Function to check if a Chrome extension is live using its ID
check_extension_live() {
    extension_id="$1"
    webstore_url="https://chrome.google.com/webstore/detail/$extension_id"

    response=$(curl -s -o /dev/null -w "%{http_code}" "$webstore_url")
    

    if [[ $response -eq 200 || $response -eq 301 ]]; then
        echo "$extension_id,$webstore_url,$link" >> live_extensions.csv
    else
        echo "$extension_id,$webstore_url,$link" >> dead_extensions.csv
    fi
}

# Create the output CSV files
echo "extensionID,link,source" > live_extensions.csv
echo "extensionID,link,source" > dead_extensions.csv

# Read each source URL from sources.txt
cat "./sources.txt" | while read link
do
    echo "Parsing $link"
    escaped_link=$(printf '%s\n' "$link" | sed -e 's/[]\/$*.^[]/\\&/g')
    curl -sL "$link" | egrep -o "[a-z]{32}" | sort | uniq | sed "s/$/,\"${escaped_link}\"/g" | while IFS= read -r line
    do
        extension_id=$(echo "$line" | awk -F ',' '{print $1}')
        check_extension_live "$extension_id"
    done
done