<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>File Search Results - SecureCloud</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #1d4350, #a43931);
      color: white;
      padding: 60px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    nav {
      position: fixed;
      top: 20px;
      right: 30px;
    }

    nav a {
      margin-left: 20px;
      color: #ffffff;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
    }

    nav a:hover {
      color: #00f0ff;
    }

    h2 {
      text-align: center;
      color: #00f0ff;
      margin-bottom: 40px;
    }

    .results-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 30px;
      width: 100%;
      max-width: 1200px;
    }

    .result-card {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      border-radius: 16px;
      padding: 25px;
      box-shadow: 0 8px 32px rgba(0,0,0,0.25);
      transition: transform 0.3s ease;
    }

    .result-card:hover {
      transform: translateY(-5px);
      background: rgba(255, 255, 255, 0.15);
    }

    .result-card h3 {
      color: #00ffe0;
      margin-bottom: 10px;
    }

    .result-card p {
      font-size: 14px;
      color: #e0f7fa;
      margin: 8px 0;
      word-break: break-word;
    }

    .request-btn {
      display: inline-block;
      margin-top: 15px;
      padding: 10px 15px;
      background: #00c6ff;
      border-radius: 10px;
      color: white;
      text-decoration: none;
      font-weight: bold;
      transition: background 0.3s ease;
    }

    .request-btn:hover {
      background: #009bd1;
    }

    @media screen and (max-width: 600px) {
      nav {
        position: static;
        margin-bottom: 20px;
      }
    }
  </style>
</head>
<body>

  <nav>
    <a href="upload.jsp">Upload</a>
    <a href="ViewData.jsp">My Gallery</a>
    <a href="Search.jsp">Search</a>
    <a href="viewkey.jsp">View Key</a>
    <a href="logout">Logout</a>
  </nav>

  <h2>Search Results</h2>

  <div class="results-container">
    <%
      ResultSet rs = (ResultSet) request.getAttribute("result");
      String userid = (String) session.getAttribute("user");
      while (rs != null && rs.next()) {
    %>
      <div class="result-card">
    File Name:    <h3><%= rs.getString(2) %></h3> <!-- File Name -->
        <p><strong>Encrypted Data:</strong> <h3><%= rs.getString(5) %></h3></p>
        <p><strong>User ID:</strong> <h3><%= rs.getString(7) %></h3></p>
        <a class="request-btn" href="request.jsp?Id=<%= rs.getInt(1) %>&&userId=<%= userid %>&&FName=<%= rs.getString(2) %>">Request Access</a>
      </div>
    <%
      }
    %>
  </div>

</body>
</html>
