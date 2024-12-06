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

@WebServlet("/BudgetReportServlet")
public class BudgetReportServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/expensemanagementsystem";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Root@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id"); // Ensure user_id is retrieved
        response.setContentType("text/html; charset=UTF-8");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        double monthlyBudget = 0;
        double totalExpenses = 0;
        double remainingBudget = 0;

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Get Budget
            String budgetQuery = "SELECT monthly_budget FROM monthly_budgets WHERE user_id = ?";
            try (PreparedStatement budgetStmt = connection.prepareStatement(budgetQuery)) {
                budgetStmt.setInt(1, userId);
                ResultSet budgetRs = budgetStmt.executeQuery();
                if (budgetRs.next()) {
                    monthlyBudget = budgetRs.getDouble("monthly_budget");
                }
            }

            // Get Total Expenses
            String expensesQuery = "SELECT COALESCE(SUM(amount), 0) AS total_expenses FROM expenses WHERE user_id = ?";
            try (PreparedStatement expensesStmt = connection.prepareStatement(expensesQuery)) {
                expensesStmt.setInt(1, userId);
                ResultSet expensesRs = expensesStmt.executeQuery();
                if (expensesRs.next()) {
                    totalExpenses = expensesRs.getDouble("total_expenses");
                }
            }

            remainingBudget = monthlyBudget - totalExpenses;
            request.setAttribute("monthlyBudget", monthlyBudget);
            request.setAttribute("totalExpenses", totalExpenses);
            request.setAttribute("remainingBudget", remainingBudget);

            request.getRequestDispatcher("budgetReport.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
