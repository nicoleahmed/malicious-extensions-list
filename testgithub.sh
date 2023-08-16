#!/bin/bash

# URL of the page
url="https://github.com/theaj42/malicious_chrome_extensions/blob/master/malicious-chrome-extensions.txt"

# Fetch the HTML content using curl
html=$(curl -s "$url")

# Search for <relative-time> within the HTML content
result=$(echo "$html" | grep -c ""createdAt"")

# Check if any occurrences were found
if [ "$result" -gt 0 ]; then
  echo "Occurrences found in the HTML content"
else
  echo "No occurrences of found in the HTML content"
fi