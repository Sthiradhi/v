<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            background-color: #96d4d4;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width:400px;
        }

        .login-container h2 {
            margin-bottom: 15px;
        }

        .login-container label {
            display: block;
            margin-bottom: 5px;
        }

        .login-container input {
            width: 300px;
            padding: 10px 20px 15px 5px;
            margin-bottom: 25px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container button {
            background-color: #d49697;
            color: white;
            bord
            
            er: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

       
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form method="post" action="loginProcess.jsp">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required><br>
        
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required><br>
        
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>