<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Resorts</title>

 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: url('images/resort2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 10px 0;
        }
        .navbar-brand {
            color: #f39c12 !important;
            font-weight: bold;
        }
        .navbar-nav a {
            color: #fff !important;
            margin: 0 15px;
            font-size: 18px;
        }
        .navbar-nav a:hover {
            color: #f39c12 !important;
        }
        .container {
            margin-top: 50px;
        }
        .resort-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s;
        }
        .resort-card:hover {
            transform: scale(1.05);
        }
        .resort-img {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            object-fit: cover;
        }
        .resort-title {
            color: #333;
            font-size: 20px;
            font-weight: bold;
        }
        .resort-description {
            font-size: 14px;
            color: #555;
            height: 50px;
            overflow: hidden;
        }
        .resort-price {
            font-size: 18px;
            color: #e67e22;
            font-weight: bold;
        }
        .book-btn {
            background-color: #f39c12;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            text-decoration: none;
            display: inline-block;
        }
        .book-btn:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">Luxury Resorts</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="user_dashboard.jsp">Dashboard</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="text-center text-light">Available Resorts</h2>
    <div class="row mt-4">

    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC", "root", "root75");

            String sql = "SELECT * FROM resorts";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int resortId = rs.getInt("id");
                String resortName = rs.getString("resort_name");
                String resortDescription = rs.getString("resort_description");
                double price = rs.getDouble("price");

                // Convert BLOB to Base64 string for image display
                Blob blob = rs.getBlob("resort_image");
                String base64Image = "";
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image = "data:image/jpeg;base64," + new String(java.util.Base64.getEncoder().encode(imageBytes));
                }
    %>

           
            <div class="col-md-4 mb-4">
                <div class="resort-card">
                    <img src="<%= base64Image %>" class="resort-img" alt="Resort Image">
                    <h3 class="resort-title"><%= resortName %></h3>
                    <p class="resort-description"><%= resortDescription %></p>
                    <p class="resort-price">$<%= price %> / night</p>
                    
                    <!-- Redirect to book_resort.jsp -->
                    <a href="book_resort.jsp?resort_id=<%= resortId %>" class="book-btn">Book Now</a>
                </div>
            </div>

    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
        <p class="text-danger text-center">Error loading resorts. Please try again later.</p>
    <%
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    %>

    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
