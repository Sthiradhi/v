<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert into Donations</title>
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
    
      .donation button {
            background-color: #d49697;
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
<h1>Add new Donations</h1>
<%
try{
    String connectionURL="jdbc:mysql://localhost:3307/charity";
    Connection connection=null;
    Statement statement=null;
    
    String id = request.getParameter("id_get");
    String orgname = request.getParameter("orgname_get");
    String dname = request.getParameter("donarname_get");
    String amount = request.getParameter("amt_get");
    String date  = request.getParameter("date_get");
    String ph = request.getParameter("phone_get");
    
    //Class.forName("com.mysql.cj.jdbc.Driver");
    connection=DriverManager.getConnection(connectionURL,"root","Sthira@123");
    
    String SQLQuery="insert into donations (id,org_name,donar_n,amt,date,donar_ph) values(?,?,?,?,?,?)";
    
    PreparedStatement ps=connection.prepareStatement(SQLQuery);
    
    ps.setString(1,id);
    ps.setString(2,orgname);
    ps.setString(3,dname);
    ps.setString(4,amount);
    ps.setString(5,date);
    ps.setString(6,ph);
    int x=ps.executeUpdate();
    
    connection.close();
    
}
catch(SQLException e){
    out.println(e.getMessage());
}
%>
 <div class="donation" align='center'>
<form action="" method="post">
    <div class="form-row">
        <label class="form-label" for="id_get">ID:</label>
        <input type="text" name="id_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="orgname_get">Organisation Name:</label>
        <input type="text" name="orgname_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="donarname_get">Donor name:</label>
        <input type="text" name="donarname_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="amt_get">Amount:</label>
        <input type="text" name="amt_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="date_get">Date:</label>
        <input type="text" name="date_get" class="form-input">
    </div>
    <div class="form-row">
        <label class="form-label" for="phone_get">Phone:</label>
        <input type="text" name="phone_get" class="form-input">
    </div>
    
    <form method="post" action="">
            
            <button class='btn-bot' type="submit">Add</button>
        </form>
    <form method="post" action="home.jsp">
            <button class='btn-bot' type="submit">Back</button>
        </form>
        </div>
        </form>
</body>
</html>