#!/usr/bin/python3
"""extend  Python script that, using a REST API, for a given employee ID,
returns information about his/her TODO list progress to export data in
the CSV format."""
import csv
import requests
from sys import argv

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    userId = argv[1]
    user = requests.get(url + "users/{}".format(userId)).json()
    todos = requests.get(url + "todos", params={"userId": userId}).json()
    username = user.get("username")
    with open("{}.csv".format(userId), "w", newline="") as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        for todo in todos:
            writer.writerow(
                [userId, username, todo.get("completed"), todo.get("title")])
