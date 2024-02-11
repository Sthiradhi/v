<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Charity Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #96d4d4; /* Set the background color */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .content h1 {
            margin-bottom: 20px;
        }

        .content ul {
            list-style: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        .content li {
            margin-bottom: 10px;
            
        }

        .content a {
            
            color: #333;
        }

       
    </style>
</head>
<body>
    <div class="content">
        <h1>Welcome to Charity Management</h1>
        <ul>
        
            <li><a href="organizations.jsp" >Organizations</a></li>
            <li><a href="donations.jsp" >Donations</a></li>
            
        </ul>
    </div>
</body>
</html>