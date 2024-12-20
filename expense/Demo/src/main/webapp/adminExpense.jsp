<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expense List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
           .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .navbar-nav .nav-link {
            font-size: 1.2rem;
            padding: 10px 15px;
        }
        .navbar-nav .nav-link:hover {
            background-color: #34495e;
            color: white;
        }
        .container {
            margin-top: 50px;
        }
        .table {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            background-color: #ffffff;
        }
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f3f5;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .header h2 {
            margin: 0;
        }
        
    /* Responsive Footer */
    .footer {
      background-color: #343a40;
      color: white;
      padding: 20px;
      text-align: center;
    }

    .social-icons a {
      color: white;
      font-size: 20px;
      margin: 0 10px;
    }

    /* Footer placement for all screen sizes */
    @media (max-width: 576px) {
      .footer {
        padding: 15px;
        font-size: 0.9rem;
      }

      .social-icons a {
        font-size: 16px;
      }
    }
    </style>
</head>
<body>
 <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">ExpenseManager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                        <a class="nav-link" href="admindashboard.jsp">Home</a>
                    </li>
                   
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.html">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contactus.html">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-light" href="Index.html">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<div class="container">
    <div class="header">
        <h2>Expense Details</h2>
    </div>
    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th>Expense ID</th>
                <th>User ID</th>
                <th>Budget ID</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Category</th>
                <th>Description</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection parameters
                String dbURL = "jdbc:mysql://localhost:3306/expensemanagementsystem ";
                String dbUser = "root";
                String dbPassword = "Root@123";

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM expenses"; // Query your expenses table
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        int expenseId = rs.getInt("expense_id");
                        int userId = rs.getInt("user_id");
                        int budgetId = rs.getInt("budget_id");
                        double amount = rs.getDouble("amount");
                        Date date = rs.getDate("date");
                        String category = rs.getString("category");
                        String description = rs.getString("description");
                        Timestamp createdAt = rs.getTimestamp("created_at");

                        %>
                        <tr>
                            <td><%= expenseId %></td>
                            <td><%= userId %></td>
                            <td><%= budgetId %></td>
                            <td>₹ <%= amount %></td>
                            <td><%= date %></td>
                            <td><%= category %></td>
                            <td><%= description %></td>
                            <td><%= createdAt %></td>
                        </tr>
                        <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='8' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException ex) {
                        out.println("<tr><td colspan='8' class='text-danger text-center'>Error closing resources: " + ex.getMessage() + "</td></tr>");
                    }
                }
            %>
        </tbody>
    </table>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Footer Section -->
  <footer class="footer mt-5">
    <div class="container text-center">
      <p>&copy; 2024 Expense Management System</p>
      <div class="social-icons">
        <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
        <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
        <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
      </div>
    </div>
  </footer>
</body>
</html>
