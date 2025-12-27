<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register | SecureCloud</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(120deg, #1f1c2c, #928dab);
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }

    .container {
      display: flex;
      width: 90%;
      max-width: 1100px;
      height: 80vh;
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
      overflow: hidden;
    }

    .left-panel {
      flex: 1;
      background: linear-gradient(to right, #141e30, #243b55);
      color: white;
      padding: 60px 40px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .left-panel h1 {
      font-size: 36px;
      margin-bottom: 20px;
    }

    .left-panel p {
      font-size: 16px;
      line-height: 1.6;
      opacity: 0.9;
    }

    .form-panel {
      flex: 1.2;
      padding: 40px 50px;
      overflow-y: auto;
    }

    .form-panel h2 {
      font-size: 28px;
      color: #333;
      margin-bottom: 25px;
    }

    .form-group {
      position: relative;
      margin-bottom: 25px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 12px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      background: transparent;
      color: #333;
      outline: none;
    }

    .form-group label {
      position: absolute;
      top: -10px;
      left: 12px;
      background: #fff;
      padding: 0 5px;
      font-size: 13px;
      color: #555;
    }

    button {
      width: 100%;
      padding: 12px;
      background: #4CAF50;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    button:hover {
      background: #388e3c;
    }

    nav {
      position: absolute;
      top: 20px;
      right: 30px;
    }

    nav a {
      margin-left: 20px;
      color: #fff;
      text-decoration: none;
      font-weight: 600;
    }

    nav a:hover {
      text-decoration: underline;
    }

    @media screen and (max-width: 768px) {
      .container {
        flex-direction: column;
        height: auto;
      }

      .left-panel {
        padding: 30px;
        text-align: center;
      }

      .form-panel {
        padding: 30px;
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

<div class="container">
  <div class="left-panel">
    <h1>Welcome to SecureCloud</h1>
    <p>Join the future of cloud security where deduplication and data integrity meet modern design. Your information is encrypted, efficient, and secure.</p>
  </div>

  <div class="form-panel">
    <h2>Create Your Account</h2>
    <form action="Register" method="POST">
      <div class="form-group">
        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullname" required>
      </div>

      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
      </div>

      <div class="form-group">
        <label for="confirm_password">Confirm Password</label>
        <input type="password" id="confirm_password" name="confirm_password" required>
      </div>

      <div class="form-group">
        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="e.g. 9876543210" required>
      </div>

      <div class="form-group">
        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" name="dob" required>
      </div>

      <div class="form-group">
        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
          <option value="">Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
      </div>

      <div class="form-group">
        <label for="address">Address</label>
        <textarea id="address" name="address" rows="3" required></textarea>
      </div>

      <button type="submit">Register</button>
    </form>
  </div>
</div>

</body>
</html>
