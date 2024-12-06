package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String birthdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load and connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expensemanagementsystem", "root", "Root@123");

            // Check if the user already exists
            String checkUserQuery = "SELECT email FROM users WHERE email = ?";
            stmt = conn.prepareStatement(checkUserQuery);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // User already exists
                request.setAttribute("status", "userexists");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                // Insert new user
                String insertUserQuery = "INSERT INTO users (username, email, password, birthdate, gender, role) VALUES (?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertUserQuery);
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, password); // Ensure you hash the password in real applications
                stmt.setString(4, birthdate);
                stmt.setString(5, gender);
                stmt.setString(6, role);

                int result = stmt.executeUpdate();
                if (result > 0) {
                	 request.setAttribute("status", "success");
                    response.sendRedirect("Login.jsp");
                } else {
                    // Registration failed
                    request.setAttribute("status", "failed");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
