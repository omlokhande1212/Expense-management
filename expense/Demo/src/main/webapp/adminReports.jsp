<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expense Management Reports</title>
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
            margin-top: 30px;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .header h2 {
            margin: 0;
        }
        .section-header {
            background-color: #6c757d;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .btn-group {
            margin-bottom: 20px;
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
        <h2>Expense Management System Reports</h2>
    </div>
    
    <!-- Buttons for Report Types -->
    <div class="section-header">
        <h5>Generate Reports</h5>
    </div>
    <div class="btn-group d-flex justify-content-around" role="group">
        <button onclick="location.href='?reportType=category'" class="btn btn-primary">Category-Wise</button>
        <button onclick="location.href='?reportType=monthly'" class="btn btn-success">Monthly</button>
        <button onclick="location.href='?reportType=user'" class="btn btn-warning">User-Wise</button>
        
    </div>

    <!-- Generate Reports -->
    <%
        String reportType = request.getParameter("reportType");
        String query = "";
        String dbURL = "jdbc:mysql://localhost:3306/expensemanagementsystem";
        String dbUser = "root";
        String dbPassword = "Root@123";

        if ("category".equalsIgnoreCase(reportType)) {
            query = "SELECT category, MAX(amount) AS maxExpense, MIN(amount) AS minExpense, AVG(amount) AS avgExpense FROM expenses GROUP BY category";
        } else if ("monthly".equalsIgnoreCase(reportType)) {
            query = "SELECT DATE_FORMAT(date, '%Y-%m') AS month, MAX(amount) AS maxExpense, MIN(amount) AS minExpense, AVG(amount) AS avgExpense FROM expenses GROUP BY month";
        } else if ("user".equalsIgnoreCase(reportType)) {
            query = "SELECT user_id, MAX(amount) AS maxExpense, MIN(amount) AS minExpense, AVG(amount) AS avgExpense FROM expenses GROUP BY user_id";
        }
    %>
    <%
        if (reportType != null && !query.isEmpty()) {
    %>
    <div class="section-header">
        <h5><%= reportType.substring(0, 1).toUpperCase() + reportType.substring(1) + " Report" %></h5>
    </div>
    <table class="table table-hover table-bordered">
        <thead>
            <%
                if ("category".equalsIgnoreCase(reportType)) {
            %>
            <tr>
                <th>Category</th>
                <th>Maximum Expense</th>
                <th>Minimum Expense</th>
                <th>Average Expense</th>
            </tr>
            <%
                } else if ("monthly".equalsIgnoreCase(reportType)) {
            %>
            <tr>
                <th>Month</th>
                <th>Maximum Expense</th>
                <th>Minimum Expense</th>
                <th>Average Expense</th>
            </tr>
            <%
                } else if ("user".equalsIgnoreCase(reportType)) {
            %>
            <tr>
                <th>User ID</th>
                <th>Maximum Expense</th>
                <th>Minimum Expense</th>
                <th>Average Expense</th>
            </tr>
            <%
                }
            %>
        </thead>
        <tbody>
            <%
                try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(query)) {

                    while (rs.next()) {
                        if ("category".equalsIgnoreCase(reportType)) {
            %>
            <tr>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getDouble("maxExpense") %></td>
                <td><%= rs.getDouble("minExpense") %></td>
                <td><%= rs.getDouble("avgExpense") %></td>
            </tr>
            <%
                        } else if ("monthly".equalsIgnoreCase(reportType)) {
            %>
            <tr>
                <td><%= rs.getString("month") %></td>
                <td><%= rs.getDouble("maxExpense") %></td>
                <td><%= rs.getDouble("minExpense") %></td>
                <td><%= rs.getDouble("avgExpense") %></td>
            </tr>
            <%
                        } else if ("user".equalsIgnoreCase(reportType)) {
            %>
            <tr>
                <td><%= rs.getInt("user_id") %></td>
                <td><%= rs.getDouble("maxExpense") %></td>
                <td><%= rs.getDouble("minExpense") %></td>
                <td><%= rs.getDouble("avgExpense") %></td>
            </tr>
            <%
                        }
                    }
                } catch (SQLException e) {
                    out.println("<tr><td colspan='4' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
    <%
        }
    %>
    

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
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
