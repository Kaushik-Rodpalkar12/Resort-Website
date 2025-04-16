import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String enteredPassword = request.getParameter("password");

        // The fixed admin password
        String correctPassword = "admin123";  // Change this to your fixed password

        if (enteredPassword != null && enteredPassword.equals(correctPassword)) {
            // Redirect to the admin dashboard if password is correct
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            // If password is incorrect, redirect back to the login page with an error message
            response.sendRedirect("admin_login.jsp?error=true");
        }
    }
}
