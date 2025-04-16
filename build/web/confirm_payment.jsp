<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("login.jsp?msg=Session%20expired.%20Please%20login%20again.");
        return;
    }

    String username = (String) sessionObj.getAttribute("username");
    String resortId = request.getParameter("resort_id");
    String checkinDate = request.getParameter("checkin_date");
    String checkoutDate = request.getParameter("checkout_date");
    String guests = request.getParameter("guests");
    String requests = request.getParameter("requests");
    String totalAmount = request.getParameter("total_amount");

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTCs", "root", "root75");

        String query = "INSERT INTO bookings (username, resort_id, checkin_date, checkout_date, guests, requests, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')";
        pst = conn.prepareStatement(query);
        pst.setString(1, username);
        pst.setInt(2, Integer.parseInt(resortId));
        pst.setString(3, checkinDate);
        pst.setString(4, checkoutDate);
        pst.setInt(5, Integer.parseInt(guests));
        pst.setString(6, requests);
        pst.setDouble(7, Double.parseDouble(totalAmount));

        int result = pst.executeUpdate();

        if (result > 0) {
            response.sendRedirect("payment.jsp?resort_id=" + resortId + "&total_amount=" + totalAmount);
        } else {
            response.sendRedirect("error.jsp?msg=Booking%20Failed");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("index.html");
    } finally {
        if (pst != null) pst.close();
        if (conn != null) conn.close();
    }
%>
