<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.yogesh.Task" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TODO List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            margin: 0;
        }

        .todo-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        

        .todo-list {
            list-style: none;
            padding: 0;
        }

        .todo-list li {
            background-color: #fff;
            padding: 10px;
            margin: 10px 0;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .task-item {
            flex-grow: 1;
            padding: 0 10px;
            word-wrap: break-word;
            font-size: 20px;
            font-weight: bold;
            
        }

        .completed label {
        	
            text-decoration: line-through;
            color: red;
        }

        .todo-list .actions {
            display: flex;
            align-items: center;
        }

        .todo-list .actions input[type="checkbox"] {
            margin-right: 10px;
        }

        .todo-list .actions input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .todo-list .actions input[type="submit"]:hover {
            background-color: #0056b3;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        .add-task-form {
            text-align: center;
        }
        
        #comp{
        	margin-right: 10px;
        }

        .add-task-form input[type="text"],
        .add-task-form input[type="submit"] {
            padding: 8px 16px;
        }

        .todo-list-container {
            max-height: 400px;
            overflow-y: scroll;
        }
    </style>
</head>
<body>
    <h1>TODO List</h1>
    <div class="todo-container">
        <div class="todo-list-container">
            <ul class="todo-list">
                <%
                    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                    if (tasks != null) {
                        for (Task task : tasks) {
                %>
                <li class="<%= task.isCompleted() ? "completed" : "" %>">
                    <form action="todo" method="post" style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                        <div class="task-item">
                            <input type="hidden" name="id" value="<%= task.getId() %>">
                            <label <% if (task.isCompleted()) { %>class="completed"<% } %>>
                                <%= task.getDescription() %>
                            </label>
                        </div>
                        <div class="actions">
                            <input type="checkbox" name="action" value="complete">
                            <input id="comp" type="submit" value="Complete">
                            <input type="submit" name="action" value="delete">
                        </div>
                    </form>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>

    <h2>Add New Task</h2>
    <div class="add-task-form">
        <form action="todo" method="post">
            <input type="text" name="description" placeholder="Task description" required>
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add Task">
        </form>
    </div>
</body>
</html>
