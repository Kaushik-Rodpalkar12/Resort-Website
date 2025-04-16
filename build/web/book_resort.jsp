<%@ page import="java.sql.*, java.io.*, java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String resortId = request.getParameter("resort_id");
    if (resortId == null || resortId.trim().isEmpty()) {
        out.println("<h3 style='color:red;text-align:center;'>Invalid Resort ID</h3>");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String password = "root75";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String resortName = "", resortDescription = "", base64Image = "";
    double price = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT resort_name, resort_description, price, resort_image FROM resorts WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(resortId));
        rs = stmt.executeQuery();

        if (rs.next()) {
            resortName = rs.getString("resort_name");
            resortDescription = rs.getString("resort_description");
            price = rs.getDouble("price");

            Blob blob = rs.getBlob("resort_image");
            if (blob != null) {
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageBytes = outputStream.toByteArray();
                base64Image = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageBytes);
            } else {
                base64Image = "images/default_image.jpg"; // Default image path
            }
        } else {
            out.println("<h3 style='color:red;text-align:center;'>Resort not found</h3>");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3 style='color:red;text-align:center;'>Error fetching resort details</h3>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Book Resort</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script>
        function calculateTotalPrice() {
            let checkinDate = new Date(document.getElementById("checkin_date").value);
            let checkoutDate = new Date(document.getElementById("checkout_date").value);
            let pricePerNight = <%= price %>;
            let diffTime = checkoutDate - checkinDate;
            let nights = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

            if (nights < 1) {
                document.getElementById("total_amount").value = 0;
                document.getElementById("total_price_display").innerText = "Invalid dates selected.";
            } else {
                let totalAmount = nights * pricePerNight;
                document.getElementById("total_amount").value = totalAmount;
                document.getElementById("total_price_display").innerText = "Total Price: $" + totalAmount;
            }
        }
    </script>
</head>
<body>

<div class="container mt-5">
    <div class="card shadow p-4">
        <img src="<%= base64Image %>" class="img-fluid rounded" alt="Resort Image">
        <h3 class="mt-3"><%= resortName %></h3>
        <p><%= resortDescription %></p>
        <p class="text-danger fw-bold">Price: $<%= price %> / night</p>

        <!-- Booking Form -->
        <form action="process_payment.jsp" method="post">
            <input type="hidden" name="resort_id" value="<%= resortId %>">
            <input type="hidden" id="total_amount" name="total_amount" value="0">
            
            <label>Username:</label>
            <input type="text" name="username" class="form-control" required>

            <label>Check-in Date:</label>
            <input type="date" id="checkin_date" name="checkin_date" class="form-control" required onchange="calculateTotalPrice()">

            <label>Check-out Date:</label>
            <input type="date" id="checkout_date" name="checkout_date" class="form-control" required onchange="calculateTotalPrice()">

            <label>Number of Guests:</label>
            <input type="number" name="guests" class="form-control" required>

            <label>Special Requests:</label>
            <textarea name="requests" class="form-control"></textarea>

            <h5 class="mt-3">Select Payment Method</h5>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="payment_method" value="Credit Card" checked>
                <label class="form-check-label">💳 Credit Card</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="payment_method" value="Debit Card">
                <label class="form-check-label">💳 Debit Card</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="payment_method" value="UPI">
                <label class="form-check-label">📱 UPI</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="payment_method" value="Net Banking">
                <label class="form-check-label">🏦 Net Banking</label>
            </div>

            <p id="total_price_display" class="text-danger fw-bold mt-2">Total Price: $0</p>

            <button type="submit" class="btn btn-success mt-3">Confirm Booking</button>
        </form>
    </div>
</div>

</body>
</html>
