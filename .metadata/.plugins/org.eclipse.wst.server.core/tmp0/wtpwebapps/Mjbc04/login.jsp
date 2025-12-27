<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>SecureCloud Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      height: 100vh;
      overflow-x: hidden;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
      padding: 60px 20px 20px;
      color: white;
    }

    nav {
      position: fixed;
      top: 20px;
      right: 40px;
      z-index: 10;
    }

    nav a {
      color: #fff;
      margin-left: 20px;
      text-decoration: none;
      font-weight: bold;
      font-size: 16px;
      transition: color 0.3s;
    }

    nav a:hover {
      color: #00c6ff;
    }

    .info-box {
      background: rgba(255, 255, 255, 0.15);
      border-radius: 15px;
      padding: 25px;
      margin-bottom: 30px;
      width: 80%;
      max-width: 700px;
      color: #ffffff;
      text-align: center;
      box-shadow: 0 4px 20px rgba(0,0,0,0.2);
      backdrop-filter: blur(8px);
    }

    .info-box h1 {
      font-size: 28px;
      margin-bottom: 10px;
      color: #00c6ff;
    }

    .info-box p {
      font-size: 16px;
      line-height: 1.6;
    }

    .login-container {
      backdrop-filter: blur(12px);
      background: rgba(255, 255, 255, 0.1);
      border-radius: 16px;
      padding: 40px;
      width: 100%;
      max-width: 380px;
      box-shadow: 0 8px 32px 0 rgba(0,0,0,0.37);
      color: white;
    }

    h2 {
      text-align: center;
      margin-bottom: 24px;
    }

    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin: 10px 0 20px;
      border: none;
      border-radius: 10px;
      outline: none;
      font-size: 16px;
    }

    input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #00c6ff;
      border: none;
      color: white;
      border-radius: 10px;
      font-size: 18px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #0072ff;
    }

    .error {
      color: #ff4b5c;
      text-align: center;
    }

    .animated-bg {
      position: absolute;
      bottom: -20px;
      left: 0;
      width: 100%;
      height: 45%;
      background: url('https://www.svgrepo.com/show/494195/cloud-encryption.svg') no-repeat center bottom;
      background-size: contain;
      opacity: 0.2;
      animation: float 8s ease-in-out infinite;
      pointer-events: none;
    }

    @keyframes float {
      0%, 100% {
        transform: translateY(0px);
      }
      50% {
        transform: translateY(-20px);
      }
    }

    @media (max-width: 480px) {
      .info-box h1 {
        font-size: 22px;
      }

      .info-box p {
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
  <nav>
    <a href="SP.jsp">Service Provider</a>
    <a href="login.jsp">User Login</a>
    <a href="Register.jsp">Register</a>
  </nav>

  <div class="info-box">
    <h1>Welcome to SecureCloud</h1>
    <p>SecureCloud is a cutting-edge platform that ensures <strong>safe and efficient data transfer</strong> using <strong>deduplication technology</strong>. 
       By identifying and eliminating redundant data, we reduce storage costs and accelerate transmission-without compromising security.</p>
    <p>Your trust matters. All data is encrypted and transferred over secure channels.</p>
  </div>

  <div class="login-container">
    <h2>User Login</h2>
    <form action="login" method="post">
      Email: <input type="email" name="email" required>
      Password: <input type="password" name="password" required>
      <input type="submit" value="Login">
    </form>
    <p class="error"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
  </div>

  <div class="animated-bg"></div>
</body>
</html>
