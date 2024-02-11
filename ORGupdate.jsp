<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<html>
<head>
<meta charset="UTF-8">
<title>Update Organizations</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #96d4d4;
        margin: 0;
        padding: 0;
        align-items:center;
    }
    h1 {
        text-align: center;
        padding: 20px;
    }
    form {
        background-color: #f2f2f2;
        width: 50%;
        margin: auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 5px 5px #193e3e;
    }
    .form-row {
        margin-bottom: 15px;
    }
    .form-label {
        display: block;
        margin-bottom: 5px;
    }
    .form-input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .button-container {
        text-align: center;
        margin-top: 20px;
    }
    
    .donations button {
            background-color: #d49697;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            flex-direction: row;
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
<h1>Update Organizations</h1>
<%
try {
    String connectionURL = "jdbc:mysql://localhost:3307/charity";
    Connection connection = null;
    PreparedStatement ps = null;

    String id = request.getParameter("id_get");
    String name = request.getParameter("name_get");
    String desc = request.getParameter("description_get");
    String ph = request.getParameter("phone_get");

    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection(connectionURL, "root", "Sthira@123");

    // Create a dynamic SQL query based on the provided values
    StringBuilder SQLQuery = new StringBuilder("UPDATE organizations SET ");
    boolean setAdded = false;

    if (name != null && !name.isEmpty()) {
        SQLQuery.append("name = ?, ");
        setAdded = true;
    }
    if (desc != null && !desc.isEmpty()) {
        SQLQuery.append("description = ?, ");
        setAdded = true;
    }
    if (ph != null && !ph.isEmpty()) {
        SQLQuery.append("phone = ?, ");
        setAdded = true;
    }

    if (setAdded) {
        SQLQuery.delete(SQLQuery.length() - 2, SQLQuery.length());  // Remove the trailing comma and space
        SQLQuery.append(" WHERE id = ?");
        
        ps = connection.prepareStatement(SQLQuery.toString());

        int parameterIndex = 1;
        if (name != null && !name.isEmpty()) {
            ps.setString(parameterIndex++, name);
        }
        if (desc != null && !desc.isEmpty()) {
            ps.setString(parameterIndex++, desc);
        }
        if (ph != null && !ph.isEmpty()) {
            ps.setString(parameterIndex++, ph);
        }

        ps.setString(parameterIndex, id);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Update successful!");
        } else {
            out.println("No rows updated.");
        }
    }

    connection.close();
}
catch(SQLException e){
    out.println(e.getMessage());
}
%>
<form action="" method="post">
    <div class="form-row">
        <label class="form-label" for="id_get">ID:</label>
        <input type="text" name="id_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="name_get">Name:</label>
        <input type="text" name="name_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="description_get">Description:</label>
        <input type="text" name="description_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="phone_get">Phone:</label>
        <input type="text" name="phone_get" class="form-input">
    </div>
    
    <div class="Donations" align='center'>
     <form method="post" action="">
            
            <button class='btn-bot' type="submit">Update</button>
        </form>
    <form method="post" action="home.jsp">
            <button class='btn-bot' type="submit">Back</button>
        </form>
   </div>
   </form>
    </body>
</html>