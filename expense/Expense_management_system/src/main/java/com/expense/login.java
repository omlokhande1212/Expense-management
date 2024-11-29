package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/register")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve form parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String birthdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("status", "password_mismatch");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_management", "root", "Root@123");

            // Check if user already exists
            PreparedStatement checkUser = con.prepareStatement("SELECT * FROM users WHERE email = ?");
            checkUser.setString(1, email);
            rs = checkUser.executeQuery();

            if (rs.next()) {
                // If user already exists, set attribute and redirect to registration page with error message
                request.setAttribute("status", "user_exists");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            } else {
                // If new user, insert details into the database
                pst = con.prepareStatement("INSERT INTO users(username, email, password, birthdate, gender, role) VALUES (?, ?, ?, ?, ?, ?)");
                pst.setString(1, username);
                pst.setString(2, email);
                pst.setString(3, password);
                pst.setString(4, birthdate);
                pst.setString(5, gender);
                pst.setString(6, role);

                int rowCount = pst.executeUpdate();

                if (rowCount > 0) {
                    // If insertion successful, create a session for the user
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("email", email);

                    // Redirect to login page with a success message
                    response.sendRedirect("login.jsp?status=success");
                } else {
                    // If insertion failed, set an error attribute and forward to registration page
                    request.setAttribute("status", "failed");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("RegistrationForm.html");
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to an error page in case of exceptions
            response.sendRedirect("error.jsp");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
