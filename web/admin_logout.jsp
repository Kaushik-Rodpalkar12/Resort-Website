<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Logout</title>
    <style>
 
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       
        body {
            font-family: 'Arial', sans-serif;
            color: #fff;
            background: url('images/resort2.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

       
        .logout-container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #f39c12;
            margin-bottom: 15px;
        }

        p {
            color: #fff;
            margin-bottom: 20px;
            font-size: 16px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f39c12;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>

<%
    
    session.invalidate();
%>

<div class="logout-container">
    <h2>Logged Out Successfully</h2>
    <p>You have been logged out. Click below to login again.</p>
    <a href="admin_login.jsp" class="btn">Login Again</a>
</div>

</body>
</html>
