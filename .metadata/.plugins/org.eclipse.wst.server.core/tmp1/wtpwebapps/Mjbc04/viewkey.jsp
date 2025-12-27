<%@page import="com.controller.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>View Keys & Downloads - SecureCloud</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #2c3e50, #4ca1af);
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
      color: #00e6ff;
    }

    h2 {
      margin-bottom: 30px;
      color: #00eaff;
    }

    .table-container {
      width: 100%;
      max-width: 1000px;
      overflow-x: auto;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 16px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
      padding: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    thead {
      background-color: rgba(0, 198, 255, 0.3);
    }

    th, td {
      padding: 15px;
      text-align: left;
      color: #e0f7fa;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    td strong {
      color: #fff57a;
    }

    .download-btn {
      padding: 8px 12px;
      background-color: #00c6ff;
      color: white;
      text-decoration: none;
      border-radius: 10px;
      font-weight: bold;
      transition: background 0.3s ease;
    }

    .download-btn:hover {
      background-color: #009bd1;
    }

    @media screen and (max-width: 600px) {
      nav {
        position: static;
        margin-bottom: 20px;
      }

      th, td {
        font-size: 14px;
        padding: 10px;
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

  <h2>Your File Keys & Download Access</h2>

  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>FID</th>
          <th>File Name</th>
          <th>Secret Key</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <%
          String uid = (String) session.getAttribute("user");
          ResultSet rs = DAO.getKey(uid);
          while (rs.next()) {
        %>
          <tr>
            <td><%= rs.getInt(1) %></td>
            <td><strong><%= rs.getString(2) %></strong></td>
            <td><%= rs.getString(4) %></td>
            <td>
              <a class="download-btn" href="download.jsp?Fid=<%= rs.getString(2) %>&&skey=<%= rs.getString(4) %>">Download</a>
            </td>
          </tr>
        <% } %>
      </tbody>
    </table>
  </div>

</body>
</html>
