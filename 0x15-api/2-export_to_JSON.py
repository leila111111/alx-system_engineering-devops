#!/usr/bin/python3
"""extend the last Python script to export data in the JSON format"""
import json
import requests
from sys import argv

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    userId = argv[1]
    user = requests.get(url + "users/{}".format(userId)).json()
    todos = requests.get(url + "todos", params={"userId": userId}).json()
    username = user.get("username")
    with open("{}.json".format(userId), "w") as f:
        todo_list = []
        for todo in todos:
            todo_info = {
                "task": todo.get("title"),
                "completed": todo.get("completed"),
                "username": username
            }
            todo_list.append(todo_info)
        data = {userId: todo_list}
        json.dump(data, f)
