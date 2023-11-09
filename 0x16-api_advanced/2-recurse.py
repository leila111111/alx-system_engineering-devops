#!/usr/bin/python3
"""recursive function that queries the Reddit API and
returns a list containing the titles of all hot articles
for a given subreddit"""
import requests


def recurse(subreddit, hot_list=[], after=""):
    """returns a list containing the titles of all
    hot articles for a given subreddit."""
    url = "https://www.reddit.com/r/{}/hot.json?after={}".format(subreddit)
    headers = {"User-Agent": "User"}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        return None
    results = response.json().get("data")
    after = data.get("data").get("after")
    hot_list.extend([i.get("data").get("title") for i in results.get("children")])
    if after is not None:
        recurse(subreddit, hot_list, after)
    return hot_list
