<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    
    String username = (String) session.getAttribute("username");

    if (username == null || username.trim().isEmpty()) {
%>
        <h3 style="color:red; text-align:center;">Error: Username is missing!</h3>
        <p style="text-align:center;"><a href="login.jsp">Retry Login</a></p>
<%
        return;
    }

 
    String url = "jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String password = "root75";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking History</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
            text-align: center;
        }
        .container {
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            color: black;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Booking History for <%= username %></h1>

    <table>
        <tr>
            <th>Resort Name</th>
            <th>Check-in Date</th>
            <th>Check-out Date</th>
            <th>Guests</th>
            <th>Total Amount</th>
            <th>Payment Status</th>
        </tr>

        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "SELECT b.checkin_date, b.checkout_date, b.guests, b.total_amount, b.status, r.resort_name " +
                         "FROM bookings b " +
                         "JOIN resorts r ON b.resort_id = r.id " +
                         "WHERE b.username = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("resort_name") %></td>
                <td><%= rs.getString("checkin_date") %></td>
                <td><%= rs.getString("checkout_date") %></td>
                <td><%= rs.getInt("guests") %></td>
                <td>$<%= rs.getDouble("total_amount") %></td>
                <td><%= rs.getString("status") %></td>
            </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;text-align:center;'>Database Error: " + e.getMessage() + "</h3>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
        %>

    </table>
</div>

</body>
</html>
