<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // Get filter parameters for monthly/yearly
    String filterType = request.getParameter("filterType"); 
    String month = request.getParameter("month"); 
    String year = request.getParameter("year");  

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expensemanagementsystem", "root", "Root@123");

        // Retrieve user ID based on username
        String getUserIdQuery = "SELECT user_id FROM users WHERE username = ?";
        stmt = conn.prepareStatement(getUserIdQuery);
        stmt.setString(1, username);
        rs = stmt.executeQuery();

        int userId = -1;
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }

        if (userId == -1) {
            out.println("<p>Error: User not found.</p>");
        } else {
            if (stmt != null) stmt.close();

            // Construct the query based on filter type
            String getExpensesQuery = "SELECT * FROM expenses WHERE user_id = ?";
            if ("monthly".equalsIgnoreCase(filterType) && month != null && year != null) {
                getExpensesQuery += " AND MONTH(date) = ? AND YEAR(date) = ?";
            } else if ("yearly".equalsIgnoreCase(filterType) && year != null) {
                getExpensesQuery += " AND YEAR(date) = ?";
            }
            getExpensesQuery += " ORDER BY date DESC";

            stmt = conn.prepareStatement(getExpensesQuery);
            stmt.setInt(1, userId);
            
            if ("monthly".equalsIgnoreCase(filterType) && month != null && year != null) {
                stmt.setInt(2, Integer.parseInt(month));
                stmt.setInt(3, Integer.parseInt(year));
            } else if ("yearly".equalsIgnoreCase(filterType) && year != null) {
                stmt.setInt(2, Integer.parseInt(year));
            }

            rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Expenses</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
 
<style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
    }

    .navbar {
      background-color: #007BFF;
    }

    .navbar .navbar-brand, .navbar-nav .nav-link {
      color: white;
    }

    /* Sidebar Styles */
    .sidebar {
      background-color: #343a40;
      color: white;
      min-height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      width: 250px;
      padding-top: 30px;
      transition: all 0.3s;
      z-index: 1000;
    }

    .sidebar a {
      color: #f8f9fa;
      padding: 15px;
      text-decoration: none;
      display: block;
      transition: all 0.3s;
    }

    .sidebar a:hover {
      background-color: #007BFF;
      color: white;
    }

    .sidebar-toggle {
      display: none;
    }

    /* Responsive adjustments for sidebar */
    @media (max-width: 992px) {
      .sidebar {
        left: -250px;
      }

      .sidebar.open {
        left: 0;
      }

      .sidebar-toggle {
        display: inline-block;
        color: white;
        font-size: 24px;
        cursor: pointer;
      }

      /* Overlay effect for sidebar */
      .overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 999;
      }

      .overlay.show {
        display: block;
      }
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
     /* Container Styling */
    .expense-table-section {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }

    /* Table Styling */
    .expense-table-section .table {
        margin: 0;
    }

    .expense-table-section .table thead {
        background-color: #343a40;
        color: white;
    }

    .expense-table-section .table th,
    .expense-table-section .table td {
        vertical-align: middle;
        padding: 12px;
    }

    .expense-table-section .table tbody tr:hover {
        background-color: #f1f1f1;
    }

    /* Header Styling */
    .expense-table-section h3 {
        font-weight: 600;
        color: #007BFF;
        margin-bottom: 20px;
    }

    /* Table Amount Column */
    .expense-table-section td:nth-child(2) {
        font-weight: bold;
        color: #28a745;
    }

    /* Mobile Responsiveness */
    @media (max-width: 768px) {
        .expense-table-section h3 {
            font-size: 1.5rem;
        }
        
        .expense-table-section td, .expense-table-section th {
            font-size: 0.9rem;
            padding: 10px;
        }
    } /* Container Styling */
    .expense-table-section {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }

    /* Table Styling */
    .expense-table-section .table {
        margin: 0;
    }

    .expense-table-section .table thead {
        background-color: #343a40;
        color: white;
    }

    .expense-table-section .table th,
    .expense-table-section .table td {
        vertical-align: middle;
        padding: 12px;
    }

    .expense-table-section .table tbody tr:hover {
        background-color: #f1f1f1;
    }

    /* Header Styling */
    .expense-table-section h3 {
        font-weight: 600;
        color: #007BFF;
        margin-bottom: 20px;
    }

    /* Table Amount Column */
    .expense-table-section td:nth-child(2) {
        font-weight: bold;
        color: #28a745;
    }

    /* Mobile Responsiveness */
    @media (max-width: 768px) {
        .expense-table-section h3 {
            font-size: 1.5rem;
        }
        
        .expense-table-section td, .expense-table-section th {
            font-size: 0.9rem;
            padding: 10px;
        }
    }
</style>
</head>
<body>

    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Expense Manager</a>
            <span class="navbar-toggler sidebar-toggle" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </span>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Welcome, User</a></li>
                      <li class="nav-item"><a class="nav-link" href="aboutus.html">About Us</a></li>
          <li class="nav-item"><a class="nav-link" href="contactus.html">Contact Us</a></li>
         <li class="nav-item"><a class="nav-link" href="userdashboard.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="overlay" onclick="toggleSidebar()"></div>
    <aside class="sidebar">
        <a href="setBudget.jsp"><i class="fas fa-wallet"></i> Set Budget</a>
         <a href="addExpense.jsp"><i class="fas fa-plus-circle"></i> Add Your Expense</a>
        <a href="ViewExpenses.jsp"><i class="fas fa-calendar-alt"></i> View All Expenses </a>
           <a href="finincialtips.html"><i class="fas fa-lightbulb"></i> Financial Tips</a>
        <a href="report.jsp"><i class="fas fa-tag"></i> View Expenses by Category</a>
    </aside>

    <!-- Expense Table Section -->
    <div class="expense-table-section container my-5 p-4 bg-light rounded shadow-sm">
        <h3 class="text-center mb-4">Expense Records</h3>
        
        <table class="table table-hover table-bordered text-center">
            <thead class="table-dark">
                <tr>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Category</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Display each expense record
                    while (rs.next()) {
                        String date = rs.getString("date");
                        String amount = rs.getString("amount");
                        String category = rs.getString("category");
                        String description = rs.getString("description");
                %>
                <tr>
                    <td><%= date %></td>
                    <td>₹<%= amount %></td>
                    <td><%= category %></td>
                    <td><%= description != null ? description : "N/A" %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer class="footer mt-5 bg-dark text-white text-center p-3">
        <p>&copy; 2024 Expense Management System</p>
        <div class="social-icons">
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
        </div>
    </footer>

    <!-- Bootstrap JS and Sidebar Script -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script>
        function toggleSidebar() {
            document.querySelector('.sidebar').classList.toggle('open');
            document.querySelector('.overlay').classList.toggle('show');
        }
    </script>

</body>
</html>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error retrieving expenses. Please try again later.</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>