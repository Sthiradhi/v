<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert into Organisations</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url("https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjU0NmJhdGNoMy1teW50LTM0LWJhZGdld2F0ZXJjb2xvcl8xLmpwZw.jpg");
        margin: 0;
        padding: 0;
        align-items:center;
    }
    h1 {
        text-align: center;
        padding: 20px;
    }
    .container {
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
             margin-top:5rem;
             text-align: center;
        }
</style>
</head>
<body>
<h1>Add new Organizations</h1>
<%
try{
    String connectionURL = "jdbc:mysql://localhost:3307/charity";
    Connection connection = null;
    Statement statement = null;
    String id = request.getParameter("id_get");
    String name = request.getParameter("name_get");
    String desc = request.getParameter("description_get");
    String ph = request.getParameter("phone_get");
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection(connectionURL, "root", "Sthira@123");
    String SQLQuery = "insert into organizations (id, name, description, phone) values(?, ?, ?, ?)";
    PreparedStatement ps = connection.prepareStatement(SQLQuery);
    
    ps.setString(1, id);
    ps.setString(2, name);
    ps.setString(3, desc);
    ps.setString(4, ph);
    int x = ps.executeUpdate();
    
    connection.close();
    
} catch(SQLException e){
    out.println(e.getMessage());
}
%>
<form class="container" action="" method="post">
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

            <button class='btn-bot' type="submit">Add</button>
        </form>
    <form  method="post" action="home.jsp">
            <button class='btn-bot' type="submit">Back</button>
        </form>
   
</form>
</body>
</html>