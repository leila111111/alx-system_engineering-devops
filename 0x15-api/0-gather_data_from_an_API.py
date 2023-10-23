#!/usr/bin/python3
"""Python script that, using a given REST API, for a given employee ID,
returns information about his/her TODO list progress."""
import requests
import sys

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    user = requests.get(url + "users/{}".format(sys.argv[1])).json()
    todos = requests.get(url + "todos", params={"userId": sys.argv[1]}).json()
    completed = []
    for todo in todos:
        if todo.get("completed") is True:
            completed.append(todo.get("title"))
    print(f"Employee {user.get('name')} is done with tasks("
          f"{len(completed)}/{len(todos)}):")
    for i in completed:
        print(f"\t {i}")
