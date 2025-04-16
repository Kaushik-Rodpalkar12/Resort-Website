<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
      
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

       
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: #e3eaf6;
        }

   
        header {
            background: #1e3c72;
            background: linear-gradient(to right, #1e3c72, #2a5298);
            padding: 20px;
            text-align: center;
            color: white;
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #1e3c72;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
            border-left: 4px solid transparent;
        }

        .sidebar a:hover, .sidebar a.active {
            background: #2a5298;
            border-left: 4px solid #f39c12;
        }

       
        .main-content {
            margin-left: 270px;
            padding: 30px;
            flex: 1;
            background: #ffffff;
        }

        .main-content h2 {
            color: #2a5298;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        .card {
            background: linear-gradient(to right, #f8f9fa, #e3eaf6);
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card h3 {
            color: #1e3c72;
            margin-bottom: 15px;
            font-size: 22px;
        }

        .card p {
            color: #333;
            font-size: 16px;
        }

        .card a {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: #f39c12;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 10px;
            transition: 0.3s;
        }

        .card a:hover {
            background: #d4890b;
        }

        /* Footer */
        footer {
            background: #1e3c72;
            color: white;
            text-align: center;
            padding: 15px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

    
    <header>
        Admin Dashboard
    </header>

  
    <div class="sidebar">
        <a href="#" class="active">Dashboard</a>
        <a href="add_resort.jsp">Add Resort</a>
        <a href="update_resort.jsp">Update Resort</a>
        <a href="delete_resort.jsp">Delete Resort</a>
        <a href="admin_logout.jsp">Logout</a>
    </div>


    <div class="main-content">
        <h2>Welcome, Admin!</h2>

        <div class="card">
            <h3>Manage Resorts</h3>
            <p>Use the links in the sidebar to add, view, update, or delete resorts.</p>
            <a href="add_resort.jsp">Add New Resort</a>
        </div>

        <div class="card">
            <h3>Resort Operations</h3>
            <p>Click below to view and manage existing resorts.</p>
            <a href="view_resorts.jsp">View Resorts</a>
        </div>
    </div>

   
    <footer>
        &copy; 2025 Resort Management. All Rights Reserved.
    </footer>

</body>
</html>
