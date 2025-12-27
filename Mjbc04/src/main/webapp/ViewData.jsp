<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.controller.DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>My Uploaded Files - SecureCloud</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #0f2027, #2c5364);
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
      z-index: 10;
    }

    nav a {
      margin-left: 20px;
      color: #ffffff;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
    }

    nav a:hover {
      color: #00c6ff;
    }

    h2 {
      margin-bottom: 30px;
      text-align: center;
      color: #00eaff;
    }

    .table-container {
      width: 90%;
      max-width: 1000px;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 12px;
      box-shadow: 0 8px 32px rgba(0,0,0,0.37);
      overflow-x: auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin: 0;
    }

    thead {
      background: rgba(0, 198, 255, 0.3);
    }

    th, td {
      padding: 15px 20px;
      text-align: left;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    th {
      font-weight: bold;
      color: #ffffff;
    }

    td {
      color: #e0f7fa;
      word-break: break-word;
    }

    tr:hover {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .nodata {
      color: #ffcbcb;
      margin-top: 30px;
      font-size: 18px;
      text-align: center;
    }

    @media screen and (max-width: 600px) {
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

  <h2>My Uploaded Files</h2>

  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>File Name</th>
          <th>File Content</th>
          <th>Encrypted</th>
        </tr>
      </thead>
      <tbody>
        <%
          String userid = (String) session.getAttribute("user");
          String sql = "select * from uploads where userid='" + userid + "'";
          Connection con = DAO.getConnection();
          PreparedStatement ps = con.prepareStatement(sql);
          ResultSet rs = ps.executeQuery();

          boolean hasData = false;
          while (rs.next()) {
            hasData = true;
        %>
          <tr>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(5) %></td>
          </tr>
        <%
          }
          if (!hasData) {
        %>
        </tbody>
      </table>
      <p class="nodata"> No data found for your account.</p>
        <%
          } else {
        %>
      </tbody>
    </table>
    <%
      }
    %>
  </div>

</body>
</html>
