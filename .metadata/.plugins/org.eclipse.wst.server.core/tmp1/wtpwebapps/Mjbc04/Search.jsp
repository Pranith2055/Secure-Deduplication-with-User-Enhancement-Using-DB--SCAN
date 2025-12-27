<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Search - SecureCloud</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #2c3e50, #3498db);
      color: white;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 60px 20px;
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
      color: #00e6ff;
    }

    h2 {
      margin-bottom: 30px;
      color: #00e6ff;
    }

    .search-container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      padding: 30px;
      border-radius: 16px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
      width: 100%;
      max-width: 500px;
      text-align: center;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    input[type="text"] {
      padding: 12px;
      border: none;
      border-radius: 10px;
      font-size: 16px;
      outline: none;
    }

    input[type="submit"] {
      padding: 12px;
      background-color: #00c6ff;
      border: none;
      border-radius: 10px;
      color: white;
      font-size: 18px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #007acc;
    }

    .error {
      color: #ffcccb;
      margin-top: 20px;
    }

    .footer-info {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      margin-top: 50px;
      background: rgba(255, 255, 255, 0.1);
      padding: 30px;
      border-radius: 16px;
      width: 90%;
      max-width: 1000px;
      backdrop-filter: blur(10px);
    }

    .info-block {
      background: rgba(0, 0, 0, 0.2);
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    }

    .info-block h3 {
      color: #00eaff;
      margin-bottom: 10px;
    }

    .info-block p {
      color: #e0f7fa;
      font-size: 14px;
      line-height: 1.6;
    }

    @media screen and (max-width: 600px) {
      .search-container {
        padding: 20px;
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

  <h2>Search for Uploaded File</h2>

  <div class="search-container">
    <form action="search" method="post">
      <label for="keyword">Enter Keyword:</label>
      <input type="text" name="keyword" id="keyword" placeholder="e.g. invoice, report" required />
      <input type="submit" value="Search" />
    </form>

    <c:if test="${not empty message}">
      <p class="error">${message}</p>
    </c:if>
  </div>

  <div class="footer-info">
    <div class="info-block">
      <h3> How Search Works</h3>
      <p>Your uploaded files are indexed using keywords. When you enter a keyword, we match it against your uploaded files in real-time.</p>
    </div>
    <div class="info-block">
      <h3> Deduplication Aware</h3>
      <p>We ensure that duplicate files are never stored. Even during searches, you only see original, verified content.</p>
    </div>
    <div class="info-block">
      <h3> Instant Results</h3>
      <p>Our search engine is optimized for speed, returning results instantly based on your personal data space.</p>
    </div>
  </div>

</body>
</html>
