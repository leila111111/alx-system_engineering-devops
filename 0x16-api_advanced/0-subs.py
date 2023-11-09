i#!/usr/bin/python3
""" function that queries the Reddit API and returns the number of subscribers"""
import requests


def number_of_subscribers(subreddit):
    """returns the number of subscriber, for a given subreddit"""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {"User-Agent": "User"}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        return 0
    results = response.json().get("data")
    return results.get("subscribers")
