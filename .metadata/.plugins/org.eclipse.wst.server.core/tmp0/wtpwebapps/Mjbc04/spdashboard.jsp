<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Provider Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
<style>
    body {
        margin: 0;
        padding: 0;
        background: linear-gradient(to bottom right, #0f0f0f, #1a1a1a);
        font-family: 'Orbitron', sans-serif;
        color: #00ffee;
    }

    header {
        background: #000000cc;
        padding: 20px;
        text-align: center;
        font-size: 2em;
        text-shadow: 0 0 8px #00ffee;
        border-bottom: 1px solid #00ffee44;
    }

    .dashboard {
        display: flex;
        justify-content: center;
        gap: 30px;
        padding: 60px 20px;
        flex-wrap: wrap;
    }

    .card {
        background: rgba(0, 255, 255, 0.05);
        border: 1px solid #00ffee55;
        border-radius: 15px;
        width: 260px;
        height: 180px;
        padding: 20px;
        box-shadow: 0 0 20px #00ffee22;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        text-align: center;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 0 30px #00ffee99;
    }

    .card a {
        text-decoration: none;
        color: #00ffee;
        font-size: 1.4em;
        display: block;
        margin-top: 40px;
    }

    .card::before {
        content: '';
        position: absolute;
        width: 120%;
        height: 4px;
        top: 0;
        left: -10%;
        background: linear-gradient(90deg, transparent, #00ffee88, transparent);
        animation: glowLine 2.5s infinite linear;
    }

    @keyframes glowLine {
        0% { left: -100%; }
        100% { left: 100%; }
    }

    .card-info {
        font-size: 0.9em;
        color: #bbffff;
        margin-top: 10px;
    }

    footer {
        text-align: center;
        padding: 20px;
        color: #888;
    }
</style>
</head>
<body>

<header> Service Provider Dashboard</header>

<div class="dashboard">

    <div class="card" onclick="location.href='userRequest.jsp';">
        <a href="userRequest.jsp">File Request</a>
        <div class="card-info">Review and manage file access requests from users in real time.</div>
    </div>

    <div class="card" onclick="location.href='UserDetails.jsp';">
        <a href="UserDetails.jsp">User Details</a>
        <div class="card-info">View registered users, status, and linked file info.</div>
    </div>

    <div class="card" onclick="location.href='index.html';">
        <a href="index.html">Logout</a>
        <div class="card-info">Exit the vault dashboard securely and return to login.</div>
    </div>

</div>

<footer>
    &copy; 2025 | CyberVault Systems - Securing Data with Intelligence
</footer>

</body>
</html>
