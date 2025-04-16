<%@ page import="java.io.*, java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Resort</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            color: #fff;
            background: url('images/resort1.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            background-color: rgba(0, 0, 0, 0.7);
            position: fixed;
            top: 0;
            width: 100%;
            padding: 15px 0;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
        }
        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        nav ul li {
            margin: 0 20px;
        }
        nav ul li a {
            text-decoration: none;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            transition: color 0.3s ease;
        }
        nav ul li a:hover {
            color: #f39c12;
        }
        .form-container {
            max-width: 500px;
            margin: 100px auto 0;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-size: 16px;
            margin-bottom: 8px;
            display: block;
        }
        input[type="text"], input[type="file"], textarea, input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f8f8f8;
        }
        button {
            background-color: #f39c12;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #e67e22;
        }
        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<header>
    <nav>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="contact.html">Contact</a></li>
            <li><a href="login.jsp">User Login</a></li>
            <li><a href="register.jsp">User Registration</a></li>
            <li><a href="admin_login.jsp">Admin Login</a></li>
        </ul>
    </nav>
</header>

<div class="form-container">
    <h2>Update Resort</h2>

    <c:if test="${param.error != null}">
        <div class="error-message">
            <p>${param.error}</p>
        </div>
    </c:if>

    <%
        String resortId = request.getParameter("resort_id");
        String resortName = "";
        String resortDescription = "";
        String price = "";

        if (resortId != null && !resortId.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC", "root", "root75");
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM resorts WHERE id = ?");
                stmt.setInt(1, Integer.parseInt(resortId));
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    resortName = rs.getString("resort_name");
                    resortDescription = rs.getString("resort_description");
                    price = rs.getString("price");
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>

    <form action="UpdateResortServlet" method="post" enctype="multipart/form-data">
        <input type="number" name="resort_id" placeholder="Resort Id"value="<%= resortId %>" required>
        <input type="text" name="resort_name" placeholder="Resort Name" value="<%= resortName %>" required>
        <textarea name="resort_description" placeholder="Resort Description" rows="4" required><%= resortDescription %></textarea>
        <input type="number" name="price" placeholder="Price" value="<%= price %>" required>
        <input type="file" name="resort_image" accept="image/*">
        <button type="submit">Update Resort</button>
    </form>
</div>

</body>
</html>
