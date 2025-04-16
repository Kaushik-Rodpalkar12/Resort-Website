<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
            max-width: 500px;
            padding: 25px;
            background: rgba(255, 255, 255, 0.9); /* Slight transparency */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            border-radius: 12px;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            font-size: 26px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
            color: #34495e;
            text-align: left;
        }

        input[type="text"], input[type="password"], input[type="number"], select {
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
            margin-top: 15px;
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
        <h2>User Registration</h2>

        <form action="RegisterServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter Username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter Password" required>

            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" placeholder="Enter Full Name" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" placeholder="Enter Age" required>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="phone">Phone Number:</label>
            <input type="number" id="phone" name="phone" placeholder="Enter Phone Number" required>

            <button type="submit">Register</button>
        </form>

        <div class="redirect-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

</body>
</html>
