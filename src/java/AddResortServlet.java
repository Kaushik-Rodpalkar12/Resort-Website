import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/addResort")
@MultipartConfig(
    maxFileSize = 16177215 
)
public class AddResortServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String resortName = request.getParameter("resort_name");
        String resortDescription = request.getParameter("resort_description");
        double price = 0;

        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            response.sendRedirect("add_resort.jsp?error=Invalid price format");
            return;
        }

      
        Part resortImagePart = request.getPart("resort_image");

        
        if (resortImagePart == null || resortImagePart.getSize() == 0) {
            response.sendRedirect("add_resort.jsp?error=Please upload an image");
            return;
        }

        InputStream resortImageStream = resortImagePart.getInputStream();

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
          
            Class.forName("com.mysql.cj.jdbc.Driver");

          
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resortdb78?useSSL=false&serverTimezone=UTC", "root", "root75");

           
            System.out.println("Connected to Database...");

           
            String sql = "INSERT INTO resorts (resort_name, resort_description, price, resort_image) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, resortName);
            stmt.setString(2, resortDescription);
            stmt.setDouble(3, price);
            stmt.setBlob(4, resortImageStream); 

           
            System.out.println("Executing Query: " + sql);
            System.out.println("Resort Name: " + resortName);
            System.out.println("Description: " + resortDescription);
            System.out.println("Price: " + price);
            System.out.println("Image Size: " + resortImagePart.getSize());

        
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("admin_dashboard.jsp?message=Resort Added Successfully");
            } else {
                response.sendRedirect("add_resort.jsp?error=Failed to add resort");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("add_resort.jsp?error=Database Driver Not Found");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("add_resort.jsp?error=SQL Error: " + e.getMessage());
        } finally {

            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
