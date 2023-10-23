#!/usr/bin/python3
"""extend your Python script to export new data in the JSON format."""
import requests
import json

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users").json()
    data = {}
    for user in users:
        userId = user.get("id")
        username = user.get("username")
        do_user = requests.get(url + "todos", params={"userId": userId}).json()
        data[userId] = []
        for todo in do_user:
            todo_info = {
                "task": todo.get("title"),
                "completed": todo.get("completed"),
                "username": username
                }
            data[userId].append(todo_info)
    with open("todo_all_employees.json", "w") as f:
        json.dump(data, f)
