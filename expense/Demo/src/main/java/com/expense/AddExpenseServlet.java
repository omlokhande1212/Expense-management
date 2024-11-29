package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddExpenseServlet")
public class AddExpenseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters (replace with your actual database details)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/expensemanagementsystem";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Root@123";

    // SQL query to insert an expense into the database
    private static final String INSERT_EXPENSE_QUERY = "INSERT INTO expenses (user_id, amount, date, category, description) VALUES (?, ?, ?, ?, ?)";
    
    // SQL query to get the user_id based on the username
    private static final String GET_USER_ID_QUERY = "SELECT user_id FROM users WHERE username = ?";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        String amountStr = request.getParameter("amount");
        String date = request.getParameter("date");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        // Get username from session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");  // Assuming "username" is stored in session

        // Validation
        if (username == null || username.isEmpty()) {
            request.setAttribute("errorMessage", "User is not logged in.");
            request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
            return;
        }
        
        if (amountStr == null || amountStr.isEmpty() || !amountStr.matches("\\d+(\\.\\d{1,2})?")) {
            request.setAttribute("errorMessage", "Invalid amount entered.");
            request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
            return;
        }

        double amount = Double.parseDouble(amountStr);
        int userId = getUserIdFromUsername(username);  // Get user_id from username
        
        if (userId == -1) {
            request.setAttribute("errorMessage", "User not found.");
            request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
            return;
        }

        // Connect to the database and insert the expense
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = connection.prepareStatement(INSERT_EXPENSE_QUERY)) {

            stmt.setInt(1, userId);  // Set user_id
            stmt.setDouble(2, amount);    // Set amount
            stmt.setDate(3, java.sql.Date.valueOf(date));  // Set date
            stmt.setString(4, category);  // Set category
            stmt.setString(5, description);  // Set description (can be null)

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                // Expense successfully added
                request.setAttribute("successMessage", "Expense added successfully!");
                request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
            } else {
                // Failed to add expense
                request.setAttribute("errorMessage", "Failed to add the expense.");
                request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/addExpense.jsp").forward(request, response);
        }
    }

    // Method to get user_id from username
    private int getUserIdFromUsername(String username) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = connection.prepareStatement(GET_USER_ID_QUERY)) {

            stmt.setString(1, username);  // Set username

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("user_id");  // Return user_id
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;  // Return -1 if user not found
    }
}
