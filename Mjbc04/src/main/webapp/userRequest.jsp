<%@page import="com.controller.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User File Requests</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap" rel="stylesheet">
<style>
    body {
        margin: 0;
        font-family: 'Roboto Mono', monospace;
        background: #121212;
        color: #e0f7fa;
        padding: 20px;
    }

    nav {
        margin-bottom: 30px;
        text-align: center;
    }

    nav a {
        color: #00e5ff;
        margin: 0 15px;
        text-decoration: none;
        font-weight: bold;
        font-size: 1.1em;
        transition: color 0.3s ease;
    }

    nav a:hover {
        color: #ffffff;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    table {
        margin: 0 auto;
        width: 90%;
        border-collapse: collapse;
        background: #1e1e1e;
        box-shadow: 0 0 15px #00e5ff22;
        border-radius: 8px;
        overflow: hidden;
    }

    thead {
        background: #00e5ff;
        color: #000;
    }

    th, td {
        padding: 15px;
        text-align: center;
    }

    tr:nth-child(even) {
        background-color: #2b2b2b;
    }

    tr:hover {
        background-color: #00e5ff11;
        transition: 0.3s ease;
    }

    .approve-btn {
        background: #00e5ff;
        color: #000;
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
        transition: background 0.3s ease;
    }

    .approve-btn:hover {
        background: #00bcd4;
        color: #fff;
    }
</style>
</head>
<body>

<nav>
    <a href="userRequest.jsp">File Request</a>
    <a href="UserDetails.jsp">User Details</a>
    <a href="index.html">Logout</a>
</nav>

<h2> Pending User File Requests</h2>

<table>
<thead>
<tr>
    <th>FID</th>
    <th>File Name</th>
    <th>User ID</th>
    <th>Status</th>
</tr>
</thead>
<tbody>
<%
    ResultSet rs = DAO.getpendingdata();
    while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td>
        <a class="approve-btn" href="updatestatus.jsp?Fid=<%=rs.getInt(1)%>&Filename=<%=rs.getString(2)%>">Approve</a>
    </td>
</tr>
<%
    }
%>
</tbody>
</table>

</body>
</html>
