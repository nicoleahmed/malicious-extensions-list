#!/bin/bash
# Written by randomaccess3 at https://github.com/randomaccess3/detections/tree/main/extensions/chromium
# Produce a list of chromium extension ids that have been flagged as malicious 
# to produce csv from web sources of malicious extension IDs

echo "extensionID,reference" > suspicious_chromium_extensions.csv

cat "./sources.txt" | while read link
do
    echo "Parsing $link"
    escaped_link=$(printf '%s\n' "$link" | sed -e 's/[]\/$*.^[]/\\&/g');
    curl -sL $link | egrep -o "[a-z]{32}" | sort | uniq | sed "s/$/,\"${escaped_link}\"/g" >> suspicious_chromium_extensions.csv
done
