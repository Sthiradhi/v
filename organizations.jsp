<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Charitable Organizations</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #b2dfdf;
        margin: 0;
        padding: 0;
        
    }
    h1 {
        text-align: center;
        padding: 20px;
        background-color: #333;
        color: #fff;
    }
    table {
    background-color: #f2f2f2;
        width: 80%;
        margin-bottom: 20px;
        border-collapse: collapse;
        box-shadow:10px 10px #193e3e;
    }
    th, td {
        border: 1px solid #a52a2a;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
     .organizations button {
            background-color: #d49697;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
             margin-top: 10px;
              margin-bottom:10px;
        }
        .btn-bot button{
             position: absolute;
             bottom: 0px;
             text-align: center;
        }
</style>
</head>
<body>
<div class="organizations" align='center'>
<h1>Charitable Organizations</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Phone</th>
    </tr>
    <%
    try {
        String connectionURL = "jdbc:mysql://localhost:3307/charity";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;

        connection = DriverManager.getConnection(connectionURL, "root", "Sthira@123");
        statement = connection.createStatement();
        String SQLQuery = "SELECT id, name, description, phone FROM organizations";
        rs = statement.executeQuery(SQLQuery);

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String desc = rs.getString("description");
            String ph = rs.getString("phone");

            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= desc %></td>
                <td><%= ph %></td>
            </tr>
            <%
        }
        statement.close();
        connection.close();
    } catch (SQLException e) {
        out.println(e.getMessage());
    }
    %>
    </table>
    <form method="post" action="home.jsp">
            
            <button class='btn-bot' type="submit">Back</button>
        </form>
        <form method="post" action="ORGinsert.jsp">
            
            <button class='btn-bot' type="submit">Insert</button>
        </form>
        <form method="post" action="ORGupdate.jsp">
            
            <button class='btn-bot' type="submit">Update</button>
        </form>
   </div>
</body>
</html>