<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <style>
       
        body {
            font-family: 'Arial', sans-serif;
            background: url('images/resort2.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

       
        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9); /* Slight transparency effect */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            font-size: 24px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #34495e;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #007bff;
            border: none;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 6px;
            transition: 0.3s;
        }

        button:hover {
            background: #0056b3;
        }

        .redirect-link {
            margin-top: 15px;
        }

        .redirect-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .redirect-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>User Login</h2>

        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter Username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>
        </form>

        <div class="redirect-link">
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>
    </div>

</body>
</html>
