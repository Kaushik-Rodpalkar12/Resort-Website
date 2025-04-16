import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteResortServlet")
public class DeleteResortServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resortId = request.getParameter("resort_id");

        if (resortId == null || resortId.isEmpty()) {
            response.sendRedirect("delete_resort.jsp?error=Please provide a valid Resort ID");
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            String url = "jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC";
            String user = "root";
            String password = "root75";

            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Database connected successfully.");

            // Check if the resort ID exists before deleting
            String checkSql = "SELECT id FROM resorts WHERE id = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setInt(1, Integer.parseInt(resortId));
            if (!pstmt.executeQuery().next()) {
                response.sendRedirect("delete_resort.jsp?error=Resort ID not found");
                return;
            }

            // Delete the resort
            String deleteSql = "DELETE FROM resorts WHERE id = ?";
            pstmt = conn.prepareStatement(deleteSql);
            pstmt.setInt(1, Integer.parseInt(resortId));

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            if (rowsAffected > 0) {
                response.sendRedirect("delete_resort.jsp?success=Resort deleted successfully");
            } else {
                response.sendRedirect("delete_resort.jsp?error=Resort ID not found");
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid Resort ID: " + e.getMessage());
            response.sendRedirect("delete_resort.jsp?error=Invalid Resort ID format");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
            response.sendRedirect("delete_resort.jsp?error=JDBC Driver issue");
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            response.sendRedirect("delete_resort.jsp?error=Database error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
