<%@page import="com.controller.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        margin: 0;
        padding: 20px;
        font-family: 'Montserrat', sans-serif;
        background: linear-gradient(135deg, #1a1a1a, #0f0f0f);
        color: #e0f7fa;
    }

    nav {
        text-align: center;
        margin-bottom: 30px;
    }

    nav a {
        color: #00e5ff;
        margin: 0 20px;
        text-decoration: none;
        font-weight: 600;
        font-size: 1.1em;
        padding: 10px 15px;
        border-radius: 6px;
        transition: background 0.3s, color 0.3s;
    }

    nav a:hover {
        background: #00e5ff33;
        color: #ffffff;
    }

    h2 {
        text-align: center;
        color: #00e5ff;
        margin-bottom: 20px;
        text-shadow: 0 0 10px #00e5ff88;
    }

    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        background: #1f1f1f;
        box-shadow: 0 0 20px #00e5ff22;
        border-radius: 8px;
        overflow: hidden;
    }

    thead {
        background: #00e5ff;
        color: #000;
    }

    th, td {
        padding: 14px 20px;
        text-align: center;
    }

    tbody tr:nth-child(even) {
        background-color: #2a2a2a;
    }

    tbody tr:hover {
        background-color: #00e5ff11;
        transition: background 0.3s ease;
    }

    footer {
        margin-top: 40px;
        text-align: center;
        font-size: 0.9em;
        color: #888;
    }
</style>
</head>
<body>

<nav>
    <a href="userRequest.jsp"> File Request</a>
    <a href="UserDetails.jsp">User Details</a>
    <a href="index.html">Logout</a>
</nav>

<h2> Registered User Details</h2>

<table>
<thead>
<tr>
    <th>User Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Date of Birth</th>
    <th>Gender</th>
    <th>Request Time</th>
</tr>
</thead>
<tbody>
<%
    /* ResultSet rs = DAO.getpendingdata(); */
    ResultSet rs=DAO.getusers();
    while (rs.next()) {
%>
<tr>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(5) %></td>
    <td><%= rs.getString(6) %></td>
    <td><%= rs.getString(7) %></td>
    <td><%= rs.getString(9) %></td>
</tr>
<%
    }
%>
</tbody>
</table>

<footer>
    &copy; 2025 | User Insight Dashboard | Powered by QuantumVault
</footer>

</body>
</html>
