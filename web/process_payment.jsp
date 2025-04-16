<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String username = request.getParameter("username");
    String resortId = request.getParameter("resort_id");
    String checkinDate = request.getParameter("checkin_date");
    String checkoutDate = request.getParameter("checkout_date");
    String guests = request.getParameter("guests");
    String requests = request.getParameter("requests");
    String totalAmount = request.getParameter("total_amount");
    String paymentMethod = request.getParameter("payment_method");

    if (username == null || resortId == null || checkinDate == null || checkoutDate == null || guests == null || totalAmount == null || paymentMethod == null) {
        response.sendRedirect("error.jsp?msg=Missing Booking Details");
        return;
    }

    int resortIdInt = Integer.parseInt(resortId);
    int guestsInt = Integer.parseInt(guests);
    double totalAmountDouble = Double.parseDouble(totalAmount);

    Connection conn = null;
    PreparedStatement paymentStmt = null;
    PreparedStatement bookingStmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC", "root", "root75");

        // Start transaction
        conn.setAutoCommit(false);

        // Insert payment record
        String paymentSQL = "INSERT INTO payments (username, resort_id, checkin_date, checkout_date, guests, total_amount, payment_method, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";
        paymentStmt = conn.prepareStatement(paymentSQL);
        paymentStmt.setString(1, username);
        paymentStmt.setInt(2, resortIdInt);
        paymentStmt.setString(3, checkinDate);
        paymentStmt.setString(4, checkoutDate);
        paymentStmt.setInt(5, guestsInt);
        paymentStmt.setDouble(6, totalAmountDouble);
        paymentStmt.setString(7, paymentMethod);

        int paymentInserted = paymentStmt.executeUpdate();

        if (paymentInserted > 0) {
            // Insert booking record
            String bookingSQL = "INSERT INTO bookings (username, resort_id, checkin_date, checkout_date, guests, requests, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";
            bookingStmt = conn.prepareStatement(bookingSQL);
            bookingStmt.setString(1, username);
            bookingStmt.setInt(2, resortIdInt);
            bookingStmt.setString(3, checkinDate);
            bookingStmt.setString(4, checkoutDate);
            bookingStmt.setInt(5, guestsInt);
            bookingStmt.setString(6, requests);
            bookingStmt.setDouble(7, totalAmountDouble);

            int bookingInserted = bookingStmt.executeUpdate();

            if (bookingInserted > 0) {
                conn.commit();
                response.sendRedirect("confirm_payment.jsp?username=" + username + "&resort_id=" + resortId);
            } else {
                conn.rollback();
                response.sendRedirect("error.jsp?msg=Booking%20Failed");
            }
        } else {
            conn.rollback();
            response.sendRedirect("error.jsp?msg=Payment%20Failed");
        }
    } catch (Exception e) {
        if (conn != null) conn.rollback();
        e.printStackTrace();
        response.sendRedirect("index.html");
    } finally {
        if (paymentStmt != null) paymentStmt.close();
        if (bookingStmt != null) bookingStmt.close();
        if (conn != null) conn.close();
    }
%>
