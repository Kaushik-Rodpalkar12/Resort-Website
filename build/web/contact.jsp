<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Luxury Resorts</title>
    
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: url('images/resort3.jpg') no-repeat center center fixed;
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
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
        }
        .contact-heading {
            color: #f39c12;
            text-align: center;
            margin-bottom: 20px;
        }
        .contact-info {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .contact-info i {
            color: #f39c12;
            margin-right: 10px;
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
                <li class="nav-item"><a class="nav-link active" href="contact.jsp">Contact</a></li>
               
            </ul>
        </div>
    </div>
</nav>


<div class="container">
    <h2 class="contact-heading">Contact Us</h2>
    
    <p class="contact-info"><i class="fas fa-map-marker-alt"></i> Address: 123 Luxury Street</p>
    <p class="contact-info"><i class="fas fa-phone"></i> Phone:+ 9787247322</p>
    <p class="contact-info"><i class="fas fa-envelope"></i> Email: luxuryresort@gmail.com</p>
    <p class="contact-info"><i class="fas fa-globe"></i> Website: www.luxuryresorts.com</p>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>
