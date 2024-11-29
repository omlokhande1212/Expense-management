package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/SetMonthlyBudgetServlet")
public class BudgetServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ExpenseManagementSystem";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "your_password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the monthly budget from the request
        String monthlyBudgetStr = request.getParameter("monthlyBudget");

        // Get user ID from the session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if user is not authenticated
            return;
        }

        try {
            double monthlyBudget = Double.parseDouble(monthlyBudgetStr);

            if (monthlyBudget <= 0) {
                request.setAttribute("message", "Please enter a positive budget value.");
                request.setAttribute("alertType", "alert-danger");
                request.getRequestDispatcher("setMonthlyBudget.jsp").forward(request, response);
                return;
            }

            // Insert or update the monthly budget in the database
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                String sql = "INSERT INTO monthly_budgets (user_id, monthly_budget) VALUES (?, ?) " +
                             "ON DUPLICATE KEY UPDATE monthly_budget = VALUES(monthly_budget)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                stmt.setDouble(2, monthlyBudget);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    request.setAttribute("message", "Monthly budget set successfully!");
                    request.setAttribute("alertType", "alert-success");
                } else {
                    request.setAttribute("message", "Failed to set monthly budget.");
                    request.setAttribute("alertType", "alert-danger");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Database error. Please try again.");
                request.setAttribute("alertType", "alert-danger");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid budget format. Please enter a number.");
            request.setAttribute("alertType", "alert-danger");
        }

        // Forward to JSP with the message
        request.getRequestDispatcher("setMonthlyBudget.jsp").forward(request, response);
    }
}
