<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resorts</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #eaeaea;
            color: #333;
        }

        header {
            background-color: #1e1e1e;
            padding: 20px 0;
            text-align: center;
        }

        header h1 {
            color: #f39c12;
            font-size: 38px;
            letter-spacing: 1px;
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            margin-top: 15px;
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

        .resort-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
            padding: 50px;
        }

        .resort-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .resort-card:hover {
            transform: scale(1.05);
        }

        .resort-image img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }

        .resort-details {
            padding: 25px;
            text-align: center;
        }

        .resort-details h3 {
            font-size: 26px;
            color: #222;
            margin-bottom: 10px;
        }

        .resort-details p {
            font-size: 16px;
            color: #555;
            margin-bottom: 15px;
        }

        .resort-details .price {
            font-size: 24px;
            color: #f39c12;
            font-weight: bold;
        }

        footer {
            background-color: #1e1e1e;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            margin-top: 30px;
        }

    </style>
</head>
<body>

    <header>
        <h1>Explore Our Luxurious Resorts</h1>
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

    <div class="resort-container">
        <div class="resort-card">
            <div class="resort-image">
                <img src="images/resort1.jpg" alt="Mountain View Resort">
            </div>
            <div class="resort-details">
                <h3>Mountain View Resort</h3>
                <p>Experience the serene beauty of the mountains at this luxury resort.</p>
                <div class="price">RS25000 / Night</div>
            </div>
        </div>

        <div class="resort-card">
            <div class="resort-image">
                <img src="images/resort2.jpg" alt="Beachfront Paradise">
            </div>
            <div class="resort-details">
                <h3>Beachfront Paradise</h3>
                <p>Relax at our premium beachfront resort.</p>
                <div class="price">RS30000 / Night</div>
            </div>
        </div>

        <div class="resort-card">
            <div class="resort-image">
                <img src="images/resort3.jpg" alt="Desert Oasis Resort">
            </div>
            <div class="resort-details">
                <h3>Desert Oasis Resort</h3>
                <p>Unleash the luxury of the desert.</p>
                <div class="price">RS20000 / Night</div>
            </div>
        </div>

        <div class="resort-card">
            <div class="resort-image">
                <img src="images/resort4.jpg" alt="Royal Palace Resort">
            </div>
            <div class="resort-details">
                <h3>Royal Palace Resort</h3>
                <p>Feel like royalty at this luxurious resort.</p>
                <div class="price">RS40000 / Night</div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Resort Management. All Rights Reserved.</p>
    </footer>

</body>
</html>
