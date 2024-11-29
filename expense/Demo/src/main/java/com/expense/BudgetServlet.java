package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/BudgetServlet")
public class BudgetServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ExpenseManagementSystem";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Root@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the monthly budget from the request
        String monthlyBudgetStr = request.getParameter("monthlyBudget");

        // Get the username from the session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("Login.jsp"); // Redirect to login if username is not in session
            return;
        }

        try {
            double monthlyBudget = Double.parseDouble(monthlyBudgetStr);

            if (monthlyBudget <= 0) {
                request.setAttribute("message", "Please enter a positive budget value.");
                request.setAttribute("alertType", "error");
                request.getRequestDispatcher("setBudget.jsp").forward(request, response);
                return;
            }

            // Fetch the user_id from the database using the username
            Integer userId = null;
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                String sql = "SELECT user_id FROM users WHERE username = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    userId = rs.getInt("user_id");
                }

                if (userId == null) {
                    request.setAttribute("message", "User not found in the database.");
                    request.setAttribute("alertType", "error");
                    request.getRequestDispatcher("setBudget.jsp").forward(request, response);
                    return;
                }

                // Check if the user has already set the budget for the current month
                String monthCheckSql = "SELECT date_set FROM monthly_budgets WHERE user_id = ? " +
                                       "AND YEAR(date_set) = YEAR(CURDATE()) AND MONTH(date_set) = MONTH(CURDATE())";
                PreparedStatement monthCheckStmt = conn.prepareStatement(monthCheckSql);
                monthCheckStmt.setInt(1, userId);
                ResultSet monthCheckRs = monthCheckStmt.executeQuery();

                if (monthCheckRs.next()) {
                    // User has already set the budget this month
                    request.setAttribute("message", "You have already set your budget for this month.");
                    request.setAttribute("alertType", "error");
                    request.getRequestDispatcher("setBudget.jsp").forward(request, response);
                    return;
                }

                // Insert or update the monthly budget in the database
                String budgetSql = "INSERT INTO monthly_budgets (user_id, monthly_budget, date_set) VALUES (?, ?, CURDATE()) " +
                                   "ON DUPLICATE KEY UPDATE monthly_budget = VALUES(monthly_budget), date_set = CURDATE()";
                PreparedStatement budgetStmt = conn.prepareStatement(budgetSql);
                budgetStmt.setInt(1, userId);
                budgetStmt.setDouble(2, monthlyBudget);

                int rowsAffected = budgetStmt.executeUpdate();
                if (rowsAffected > 0) {
                    request.setAttribute("message", "Monthly budget set successfully!");
                    request.setAttribute("alertType", "success");

                    // Store the budget in the session
                    session.setAttribute("monthlyBudget", monthlyBudget);
                } else {
                    request.setAttribute("message", "Failed to set monthly budget.");
                    request.setAttribute("alertType", "error");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Database error. Please try again.");
                request.setAttribute("alertType", "error");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid budget format. Please enter a number.");
            request.setAttribute("alertType", "error");
        }

        // Forward to JSP with the message
        request.getRequestDispatcher("setBudget.jsp").forward(request, response);
    }

    // Retrieve the budget from the session
    public static double getBudgetFromSession(HttpSession session) {
        Object budgetObj = session.getAttribute("monthlyBudget");
        if (budgetObj != null) {
            return (double) budgetObj;
        }
        return 0.0; // Default to 0 if no budget is found in session
    }
}