<%@ page import="java.sql.*" 
   %>

<html>
<head>
<meta charset="UTF-8">
<title>Donations</title>
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
        margin-bottom: 80px;
        margin-top: 80px;
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
              margin-left:10px;
              margin-right:10px;
        }
        .btn-bot button{
             position: absolute;
             bottom: 0px;
             text-align: center;
        }
</style>
</head>
<body>
<h1>Charitable Donations</h1>
<div class="Donations" align='center'>
<table>
    <tr>
        <th>ID</th>
        <th>Organisation Name</th>
        <th>Donor</th>
        <th>Amount</th>
        <th>Date</th>
        <th>Donor Phone</th>
    </tr>
<%
try{
	String connectionURL="jdbc:mysql://localhost:3307/charity";
	Connection connection=null;
	Statement statement=null;
	ResultSet rs=null;
	
	connection=DriverManager.getConnection(connectionURL,"root","Sthira@123");
	statement=connection.createStatement();
	String SQLQuery="SELECT * FROM donations";
	rs=statement.executeQuery(SQLQuery);
	
	while(rs.next()){
		int id=rs.getInt("id");
		String org_name=rs.getString("org_name");
		String name=rs.getString("donar_n");
		int amount=(rs.getInt("amt"));
		Date date=rs.getDate("date");
		String phone=rs.getString("donar_ph");
		%>
        <tr>
            <td><%= id %></td>
            <td><%= org_name %></td>
            <td><%= name %></td>
            <td><%= amount %></td>
            <td><%= date %></td>
            <td><%= phone %></td>
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
        <form method="post" action="DONinsert.jsp">
            
            <button class='btn-bot' type="submit">Insert</button>
        </form>
        <form method="post" action="DONupdate.jsp">
            
            <button class='btn-bot' type="submit">Update</button>
        </form>
   </div>

</body>
</html>