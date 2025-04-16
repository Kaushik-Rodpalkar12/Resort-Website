import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/UpdateResortServlet")
@MultipartConfig(
    maxFileSize = 16177215 // 16MB limit for image uploads
)
public class UpdateResortServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String resortIdStr = request.getParameter("resort_id");
        String resortName = request.getParameter("resort_name");
        String resortDescription = request.getParameter("resort_description");
        String priceStr = request.getParameter("price");

        // Validate resort ID
        int resortId = 0;
        try {
            resortId = Integer.parseInt(resortIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("update_resort.jsp?error=Invalid resort ID");
            return;
        }

        // Validate price
        double price = 0;
        if (priceStr == null || priceStr.trim().isEmpty()) {
            response.sendRedirect("update_resort.jsp?error=Price cannot be empty");
            return;
        }

        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("update_resort.jsp?error=Invalid price format");
            return;
        }

        // Get resort image from the request
        Part resortImagePart = request.getPart("resort_image");
        InputStream resortImageStream = (resortImagePart != null && resortImagePart.getSize() > 0) ? resortImagePart.getInputStream() : null;

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC", "root", "root75");

            // If a new image is uploaded, update it; otherwise, keep the existing image
            String sql;
            if (resortImageStream != null) {
                sql = "UPDATE resorts SET resort_name=?, resort_description=?, price=?, resort_image=? WHERE id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, resortName);
                stmt.setString(2, resortDescription);
                stmt.setDouble(3, price);
                stmt.setBlob(4, resortImageStream);
                stmt.setInt(5, resortId);
            } else {
                sql = "UPDATE resorts SET resort_name=?, resort_description=?, price=? WHERE id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, resortName);
                stmt.setString(2, resortDescription);
                stmt.setDouble(3, price);
                stmt.setInt(4, resortId);
            }

            // Execute update
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("admin_dashboard.jsp?message=Resort Updated Successfully");
            } else {
                response.sendRedirect("update_resort.jsp?error=Failed to update resort");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("update_resort.jsp?error=Database Driver Not Found");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("update_resort.jsp?error=SQL Error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
