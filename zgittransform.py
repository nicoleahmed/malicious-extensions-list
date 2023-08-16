"""
This module provides a function to transform a GitHub URL to its corresponding API URL.
"""
import re
import requests
import json

def transform_github_url_to_api():
    """
        Transform a GitHub URL to its corresponding API URL.
    """
    github_url_pattern = r"https?://github.com/([\w-]+)/([\w-]+)/blob/([\w-]+)/(.+)"
    match = re.match(github_url_pattern, link)
    if match:
        # Extract the components from the URL
        owner = match.group(1)
        repo = match.group(2)
        branch = match.group(3)
        file_path = match.group(4)

        # Generate the API URL
        apiurl = f"https://api.github.com/repos/{owner}/{repo}/contents/{file_path}?ref={branch}"
        print(apiurl)  # Print the API URL to the console
        return apiurl
    else:
        print("URL does not match expected pattern")  # Print a message to the console
        return None

def get_last_update_date():
    """
    Get the last update date for a file from the GitHub API.

    Args:
        api_url (str): The API URL of the file.

    Returns:
        str: The last update date of the file, or None if the request fails.
    """
    response = requests.get(api_url, timeout=10)
    if response.status_code == 200:
        data = response.json()
        sha=data["sha"]
        commit_url = f"https://api.github.com/repos/{data['repository']['full_name']}/commits/{sha}"
        commit_url = data["sha"]["url"]
        commit_response = requests.get(commit_url, timeout=10)
        print (commit_url)
        if commit_response.status_code == 200:
            commit_data = commit_response.json()
            lastupdatedate = commit_data["commit"]["committer"]["date"]
            print (lastupdatedate)  # Print the last update date to the console
            return lastupdatedate
        else:
            print("Failed to retrieve commit data")
            return None


# Example usage
link = "https://github.com/theaj42/malicious_chrome_extensions/blob/master/malicious-chrome-extensions.txt"
api_url = transform_github_url_to_api()
last_update_date = get_last_update_date()

print("Link:", link)
print("API URL:", api_url)
print("Last update date:", last_update_date)
