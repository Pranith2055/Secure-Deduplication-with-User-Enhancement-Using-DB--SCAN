<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <title>Dashboard - SecureCloud</title>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
      margin: 0;
      padding: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #1f4037, #99f2c8);
      min-height: 100vh;
      color: white;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .container {
      padding: 40px 20px;
      max-width: 1200px;
      width: 100%;
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
    }

    .header h2 {
      font-size: 32px;
      color: #ffffff;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 30px;
      margin-top: 30px;
    }

    .card {
      background: rgba(255, 255, 255, 0.1);
      border-radius: 16px;
      padding: 25px;
      text-align: center;
      backdrop-filter: blur(10px);
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
      transition: transform 0.3s, background 0.3s;
      cursor: pointer;
    }

    .card:hover {
      transform: translateY(-8px);
      background: rgba(255, 255, 255, 0.15);
    }

    .card h3 {
      margin-bottom: 10px;
      color: #00ffe0;
    }

    .card p {
      font-size: 14px;
      color: #e0f7fa;
    }

    .logout-link {
      margin-top: 40px;
      text-align: center;
    }

    .logout-link a {
      color: #ff6f61;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
    }

    .logout-link a:hover {
      text-decoration: underline;
    }

    @media screen and (max-width: 600px) {
      .header h2 {
        font-size: 24px;
      }
    }
  </style>
</head>
<body>
<%
String user = (String) session.getAttribute("user");
if (user == null) {
  response.sendRedirect("login.jsp");
  return;
}
%>
  <div class="container">
    <div class="header">
      <h2>Welcome, <%= user %> </h2>
      <p>You're securely logged into your personal SecureCloud dashboard.</p>
    </div>

    <div class="grid">
      <div class="card" onclick="window.location='upload.jsp'">
        <h3>Upload</h3>
        <p>Upload and securely deduplicate your files using our smart algorithm.</p>
      </div>

     <!--  <div class="card" onclick="window.location='ViewData.jsp'">
        <h3>My Gallery</h3>
        <p>Browse all the files you've uploaded and managed in your account.</p>
      </div>
 -->
      <div class="card" onclick="window.location='Search.jsp'">
        <h3>Search</h3>
        <p>Quickly find files by name or metadata using advanced filters.</p>
      </div>

      <div class="card" onclick="window.location='viewkey.jsp'">
        <h3>View Key</h3>
        <p>Access your secure encryption key used during file deduplication.</p>
      </div>
    </div>

    <div class="logout-link">
      <a href="logout"> Logout</a>
    </div>
  </div>
</body>
</html>
