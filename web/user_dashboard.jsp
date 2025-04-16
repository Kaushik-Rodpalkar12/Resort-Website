<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  
    String username = (String) session.getAttribute("username");

    if (username == null || username.trim().isEmpty()) {
%>
        <h3 style="color:red; text-align:center;">Error: Username is missing!</h3>
        <p style="text-align:center;"><a href="login.jsp">Retry Login</a></p>
<%
        return; // Stop further execution if username is missing
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            color: white;
            text-align: center;
        }
        
        .container {
            margin-top: 50px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            color: black;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            width: 60%;
        }
        
        .profile-section {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007bff;
        }

        .profile-name {
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
            color: #1e3c72;
        }

        .dashboard-links {
            margin-top: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .dashboard-links a {
            text-decoration: none;
            font-size: 18px;
            padding: 12px 20px;
            background: #007bff;
            color: white;
            border-radius: 5px;
            transition: 0.3s;
        }

        .dashboard-links a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="profile-section">
        <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="User Profile" class="profile-img">
        <p class="profile-name">Welcome, <%= username %>! 🎉</p>
    </div>

    <div class="dashboard-links">
       
        <a href="view_resorts.jsp">🏨 View Resorts</a>
        <a href="booking_history.jsp">📜 Booking History</a>
        <a href="logout.jsp" style="background: #dc3545;">🚪 Logout</a>
    </div>
</div>

</body>
</html>
