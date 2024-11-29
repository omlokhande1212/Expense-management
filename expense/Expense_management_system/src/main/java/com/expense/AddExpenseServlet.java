package com.expense;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
@WebServlet("/register")
public class AddExpenseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters (replace with your actual database details)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ExpenseManagementSystem";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Root@123";

    // SQL query to insert an expense into the database
    private static final String INSERT_EXPENSE_QUERY = "INSERT INTO expenses (user_id, budget_id, amount, date, category, description) VALUES (?, ?, ?, ?, ?, ?)";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        String amountStr = request.getParameter("amount");
        String date = request.getParameter("date");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String userIdStr = request.getParameter("user_id"); // Assuming user_id is stored in session
        String budgetIdStr = request.getParameter("budget_id"); // Optional, can be null

        // Validation
        if (amountStr == null || amountStr.isEmpty() || !amountStr.matches("\\d+(\\.\\d{1,2})?")) {
            // Invalid amount, redirect back with an error message
            request.setAttribute("errorMessage", "Invalid amount entered.");
            request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
            return;
        }

        double amount = Double.parseDouble(amountStr);
        int userId = Integer.parseInt(userIdStr);
        Integer budgetId = (budgetIdStr != null && !budgetIdStr.isEmpty()) ? Integer.parseInt(budgetIdStr) : null;

        // Connect to the database and insert the expense
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = connection.prepareStatement(INSERT_EXPENSE_QUERY)) {

            stmt.setInt(1, userId);  // Set user_id
            if (budgetId != null) {
                stmt.setInt(2, budgetId);  // Set budget_id if present
            } else {
                stmt.setNull(2, Types.INTEGER);  // Set budget_id to NULL if not provided
            }
            stmt.setDouble(3, amount);    // Set amount
            stmt.setDate(4, Date.valueOf(date));  // Set date
            stmt.setString(5, category);  // Set category
            stmt.setString(6, description);  // Set description (can be null)

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                // Expense successfully added, redirect to a confirmation or expense list page
                response.sendRedirect("expenseList.jsp");  // Redirect to the page where expenses are displayed
            } else {
                // Failed to add expense, show error
                request.setAttribute("errorMessage", "Failed to add the expense.");
                request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
        }
    }
}
