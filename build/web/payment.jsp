<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String bookingId = request.getParameter("booking_id");
    String username = request.getParameter("username");
    String amount = request.getParameter("amount");

    if (bookingId == null || username == null || amount == null) {
        out.println("<h3 style='color:red;text-align:center;'>Invalid Payment Details</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center">Payment Details</h3>
        <hr>
        <p><strong>Booking ID:</strong> <%= bookingId %></p>
        <p><strong>Username:</strong> <%= username %></p>
        <p><strong>Total Amount:</strong> $<%= amount %></p>

        <!-- Payment Form -->
        <form action="payment.jsp" method="post">
            <input type="hidden" name="booking_id" value="<%= bookingId %>">
            <input type="hidden" name="username" value="<%= username %>">
            <input type="hidden" name="amount" value="<%= amount %>">

            <label>Select Payment Method:</label>
            <select name="payment_method" class="form-control" required>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="UPI">UPI</option>
                <option value="Net Banking">Net Banking</option>
                <option value="Cash">Cash</option>
            </select>

            <button type="submit" class="btn btn-success mt-3">Confirm Payment</button>
        </form>

        <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String paymentMethod = request.getParameter("payment_method");

            if (paymentMethod != null) {
                String url = "jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC";
                String user = "root";
                String password = "root75";
                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    String sql = "INSERT INTO payments (booking_id, username, resort_id, amount, payment_method, payment_status) VALUES (?, ?, ?, ?, ?, 'Completed')";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, Integer.parseInt(bookingId));
                    stmt.setString(2, username);
                    stmt.setInt(3, Integer.parseInt(request.getParameter("resort_id"))); // Resort ID should be passed in request
                    stmt.setDouble(4, Double.parseDouble(amount));
                    stmt.setString(5, paymentMethod);

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        response.sendRedirect("confirmation.jsp?booking_id=" + bookingId);
                    } else {
                        out.println("<h3 class='text-danger text-center mt-3'>Payment Failed</h3>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<h3 class='text-danger text-center mt-3'>Database Error: " + e.getMessage() + "</h3>");
                } finally {
                    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                    try { if (conn != null) conn.close(); } catch (Exception e) {}
                }
            }
        }
        %>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
