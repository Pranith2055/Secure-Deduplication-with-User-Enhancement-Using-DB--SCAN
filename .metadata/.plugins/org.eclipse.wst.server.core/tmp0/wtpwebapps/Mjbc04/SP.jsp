<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Service Provider Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #0f0f0f 0%, #1a1a1a 100%);
            font-family: 'Orbitron', sans-serif;
            color: #00ffee;
            overflow: hidden;
        }

        nav {
            background: #000000dd;
            padding: 15px 0;
            text-align: center;
            border-bottom: 2px solid #00ffee44;
        }

        nav a {
            color: #00ffee;
            margin: 0 20px;
            text-decoration: none;
            font-size: 1.1em;
            position: relative;
            transition: color 0.3s ease;
        }

        nav a::after {
            content: '';
            position: absolute;
            width: 0%;
            height: 2px;
            left: 0;
            bottom: -5px;
            background: #00ffee;
            transition: 0.4s ease;
        }

        nav a:hover {
            color: #ffffff;
        }

        nav a:hover::after {
            width: 100%;
        }

        .login-container {
            height: calc(100vh - 80px);
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .glass-panel {
            background: rgba(0, 255, 255, 0.07);
            border: 1px solid #00ffee88;
            backdrop-filter: blur(10px);
            padding: 40px 60px;
            border-radius: 16px;
            box-shadow: 0 0 20px #00ffee33;
            animation: fadeInUp 1.5s ease forwards;
            opacity: 0;
        }

        .glass-panel h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #00ffee;
            text-shadow: 0 0 10px #00ffee;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #aaffee;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            background: #001f1f;
            color: #00ffee;
            border-bottom: 2px solid #00ffeeaa;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #ffffff;
            background: #002828;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #00ffee;
            color: #000;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 0 10px #00ffeecc;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #00cccc;
        }

        .error-message {
            color: #ff4c4c;
            text-align: center;
            margin-top: 10px;
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Decorative floating particles */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            pointer-events: none;
            z-index: -1;
        }

        .particles span {
            position: absolute;
            display: block;
            width: 5px;
            height: 5px;
            background: #00ffee88;
            animation: float 15s linear infinite;
            bottom: -10%;
        }

        @keyframes float {
            0% {
                transform: translateY(0) scale(1);
                opacity: 0.2;
            }
            50% {
                opacity: 1;
            }
            100% {
                transform: translateY(-110vh) scale(0.5);
                opacity: 0;
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

<div class="login-container">
    <div class="glass-panel">
        <h2>Service Provider Login</h2>

        <form action="SP" method="post">
            <label>Username:</label>
            <input type="text" name="username" required />
            <label>Password:</label>
            <input type="password" name="password" required />
            <input type="submit" value="Login" />
        </form>

        <c:if test="${not empty message}">
            <p class="error-message">${message}</p>
        </c:if>
    </div>

    <div class="particles">
        <% for(int i = 0; i < 60; i++) { %>
            <span style="left:<%= (int)(Math.random()*100) %>%; animation-delay:<%= (Math.random()*10) %>s;"></span>
        <% } %>
    </div>
</div>

</body>
</html>
