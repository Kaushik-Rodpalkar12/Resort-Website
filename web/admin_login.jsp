<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
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
            flex-direction: column;
        }

        /* Header Style */
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

      
        .login-container {
            width: 100%;
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #fff;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #fff;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #f39c12;
            border: none;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #e67e22;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
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

    <div class="login-container">
        <h2>Admin Login</h2>

        <form action="AdminLoginServlet" method="post">
            <label for="password">Admin Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter Admin Password" required><br>

            <button type="submit">Login</button>
        </form>

        
    </div>
</body>
</html>
