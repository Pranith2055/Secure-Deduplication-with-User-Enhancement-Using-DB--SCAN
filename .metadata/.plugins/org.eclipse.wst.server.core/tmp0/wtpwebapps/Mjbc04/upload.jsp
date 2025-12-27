<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Upload - SecureCloud</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #1c1c1c, #3a6073);
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
      color: #fff;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
    }

    nav a:hover {
      color: #00c6ff;
    }

    .info-box {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 15px;
      padding: 20px 30px;
      max-width: 750px;
      margin-bottom: 30px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.2);
      text-align: center;
    }

    .info-box h2 {
      color: #00e0ff;
      margin-bottom: 10px;
    }

    .info-box p {
      font-size: 15px;
      line-height: 1.6;
      color: #d9f7ff;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      border-radius: 16px;
      padding: 30px;
      max-width: 500px;
      width: 100%;
      box-shadow: 0 8px 32px rgba(0,0,0,0.37);
    }

    form {
      display: flex;
      flex-direction: column;
    }

    input[type="text"],
    input[type="file"] {
      margin-bottom: 20px;
      padding: 10px;
      border: none;
      border-radius: 10px;
      font-size: 16px;
    }

    input[type="submit"] {
      padding: 10px;
      background-color: #00c6ff;
      border: none;
      border-radius: 10px;
      color: white;
      font-size: 18px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #0099cc;
    }

    .message {
      margin-top: 20px;
      color: #ffff66;
      font-weight: bold;
      text-align: center;
    }

    @media screen and (max-width: 600px) {
      .info-box h2 {
        font-size: 20px;
      }

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

  <div class="info-box">
    <h2>Upload Files with Smart Deduplication</h2>
    <p>SecureCloud allows you to upload files using our <strong>data deduplication</strong> technology. 
    This process detects and removes duplicate data blocks, ensuring faster uploads, reduced storage usage, and higher efficiency-without ever compromising security.</p>
  </div>

  <div class="form-container">
    <h2>Upload Keyword & File</h2>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
      <input type="text" name="keyword" placeholder="Enter keyword..." required>
      <input type="file" name="file" required>
      <input type="submit" value="Upload">
    </form>

    <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div class="message"><%= message %></div>
    <% } %>
  </div>

</body>
</html>
