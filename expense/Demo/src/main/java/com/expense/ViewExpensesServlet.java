package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ViewExpenses")
public class ViewExpensesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters (replace with your actual database details)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/expensemanagementsystem";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Root@123";

    // SQL query to fetch expenses grouped by month and category
    private static final String GET_USER_ID_QUERY = "SELECT id FROM users WHERE username = ?";
    private static final String GET_EXPENSES_QUERY = 
        "SELECT MONTH(date) AS month, category, SUM(amount) AS totalAmount " +
        "FROM expenses " +
        "WHERE user_id = ? " +
        "GROUP BY MONTH(date), category " +
        "ORDER BY MONTH(date), category";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username from the session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("Login.jsp"); // Redirect to login if the username is not found in the session
            return;
        }

        // Fetch user ID using the username
        Integer userId = null;
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = connection.prepareStatement(GET_USER_ID_QUERY)) {

            stmt.setString(1, username); // Set the username in the query
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching user ID: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }

        if (userId == null) {
            response.sendRedirect("Login.jsp"); // If user ID is null, redirect to login
            return;
        }

        // Now, fetch expenses using the user ID
        List<Expense> expenses = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = connection.prepareStatement(GET_EXPENSES_QUERY)) {

            stmt.setInt(1, userId); // Set the user ID in the query
            ResultSet rs = stmt.executeQuery();

            // Process the result set and populate the expenses list
            while (rs.next()) {
                int month = rs.getInt("month");
                String category = rs.getString("category");
                double totalAmount = rs.getDouble("totalAmount");

                // Add each expense entry to the list
                expenses.add(new Expense(month, category, totalAmount));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }

        // Set the expenses list as a request attribute
        request.setAttribute("expenses", expenses);

        // Forward the request to the JSP page to display the expenses
        request.getRequestDispatcher("/ViewExpenses.jsp").forward(request, response);
    }

    // Expense class to hold the expense data
    public static class Expense {
        private int month;
        private String category;
        private double totalAmount;

        public Expense(int month, String category, double totalAmount) {
            this.month = month;
            this.category = category;
            this.totalAmount = totalAmount;
        }

        public int getMonth() {
            return month;
        }

        public String getCategory() {
            return category;
        }

        public double getTotalAmount() {
            return totalAmount;
        }
    }
}
