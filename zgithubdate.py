import requests
from bs4 import BeautifulSoup

file_url = "https://github.com/owner/repo/blob/main/path/to/file.txt"

# Send an HTTP GET request to fetch the HTML content
response = requests.get(file_url, timeout=10)

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(response.text, "html.parser")

# Find the last modified date element
last_modified_element = soup.find(class_="last-updated")

# Extract the last modified date
last_modified = last_modified_element.get_text()

# Print the last modified date
print("Last Modified:", last_modified)