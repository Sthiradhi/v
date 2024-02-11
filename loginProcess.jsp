<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Process</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // For demonstration purposes, hardcoding admin credentials
        String adminUsername = "admin";
        String adminPassword = "admin123";
        
        if (username.equals(adminUsername) && password.equals(adminPassword)) {
            //out.println(" Successful login");
            session.setAttribute("loggedIn", true);
            response.sendRedirect("home.jsp");
        } else {
            // Invalid login
            out.println("Invalid login credentials. Please try again.");
        }
    %>
</body>
</html>