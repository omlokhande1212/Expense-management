<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Report</title>
     <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- FontAwesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <!-- SweetAlert2 for alerts -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
         body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }

.navbar {
            background-color: #007BFF;
        }

        .navbar .navbar-brand {
            color: white;
        }

        .navbar .navbar-nav {
            margin-left: auto;
        }

        .navbar .nav-link {
            color: white !important;
        }
    /* Sidebar styles */
    .sidebar {
      background-color: #343a40;
      color: white;
      min-height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      width: 250px;
      padding-top: 30px;
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

    /* Responsive Sidebar */
    @media (max-width: 992px) {
      .sidebar {
        left: -250px;
        transition: all 0.3s;
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
    }

    /* Content wrapper for main section */
    .content-wrapper {
      margin-left: 250px;
      padding: 20px;
    }
    @media (max-width: 992px) {
      .content-wrapper {
        margin-left: 0;
      }
    }

    /* Card styling for responsive forms */
    .card {
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
    }.expense-table-section {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }

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
    /* Footer styles */
    .footer {
      background-color: #343a40;
      color: white;
      text-align: center;
      padding: 20px 0;
      margin-top: auto;
    }
    .social-icons a {
      color: white;
      font-size: 20px;
      margin: 0 10px;
    }

        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        form input, form select, form button {
            padding: 10px;
            margin: 5px 0;
            width: calc(33% - 12px);
            box-sizing: border-box;
        }
        form button {
            width: 100%;
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        form button:hover {
            background-color: #218838;
        }
          .filter-output {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-left: 4px solid #007BFF;
            border-radius: 5px;
            font-size: 16px;
        }

        .filter-output span {
            font-weight: bold;
            color: #007BFF;
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

  <!-- Sidebar Section -->
  <div class="overlay" onclick="toggleSidebar()"></div>
  <aside class="sidebar">
    <a href="setBudget.jsp"><i class="fas fa-wallet"></i> Set Budget</a>
    <a href="addExpense.jsp"><i class="fas fa-plus-circle"></i> Add Your Expense</a>
    <a href="ViewExpenses.jsp"><i class="fas fa-calendar-alt"></i> View All Expenses </a>
       <a href="finincialtips.html"><i class="fas fa-lightbulb"></i> Financial Tips</a>
   
    <a href="#"><i class="fas fa-tag"></i> View Expenses by Category</a>
  </aside>
  <!-- Main Content -->
  <div class="content-wrapper">
    <div class="container">
      <div class="text-center mb-4">
        <h2>Expense Report</h2>
        <p>Filter and download your expense reports.</p>
      </div>

      <!-- Filter Form -->
      <div class="card p-4 mb-4">
        <form method="post">
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="category">Category</label>
              <select name="category" class="form-control" required>
                <option value="">Select Category</option>
                <option value="Food">Food</option>
                <option value="Transport">Transport</option>
                <option value="Entertainment">Entertainment</option>
                <option value="Healthcare">Healthcare</option>
                <option value="Other">Other</option>
              </select>
            </div>
            <div class="col-md-4 mb-3">
              <label for="start_date">Start Date</label>
              <input type="date" class="form-control" name="start_date" required>
            </div>
            <div class="col-md-4 mb-3">
              <label for="end_date">End Date</label>
              <input type="date" class="form-control" name="end_date" required>
            </div>
          </div>
          <button type="submit" class="btn btn-primary btn-block">Filter</button>
        </form>
      </div>

      <!-- Download Button -->
      <div class="text-right mb-3">
        <form method="post" action="downloadCSV.jsp">
          <input type="hidden" name="category" value="<%= request.getParameter("category") %>">
          <input type="hidden" name="start_date" value="<%= request.getParameter("start_date") %>">
          <input type="hidden" name="end_date" value="<%= request.getParameter("end_date") %>">
          <button type="submit" class="btn btn-success">Download CSV</button>
        </form>
         <div class="filter-output">
                <p>Filter Results:</p>
                <p>Category: <span><%= request.getParameter("category") != null ? request.getParameter("category") : "All" %></span></p>
                <p>Start Date: <span><%= request.getParameter("start_date") != null ? request.getParameter("start_date") : "N/A" %></span></p>
                <p>End Date: <span><%= request.getParameter("end_date") != null ? request.getParameter("end_date") : "N/A" %></span></p>
            </div>
      </div>
        <table class="table table-bordered table-responsive">
                        <thead class="table-dark">

                <tr>
                    <th>Expense ID</th>
                    <th>Category</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    String dbUrl = "jdbc:mysql://localhost:3306/expensemanagementsystem";
                    String dbUser = "root";
                    String dbPassword = "Root@123";

                    String username = (String) session.getAttribute("username");
                    String category = request.getParameter("category");
                    String startDate = request.getParameter("start_date");
                    String endDate = request.getParameter("end_date");

                    if (username != null && category != null && startDate != null && endDate != null) {
                        Connection con = null;
                        PreparedStatement userPst = null;
                        PreparedStatement expensePst = null;
                        ResultSet userRs = null;
                        ResultSet expenseRs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                            String userQuery = "SELECT user_id FROM users WHERE username = ?";
                            userPst = con.prepareStatement(userQuery);
                            userPst.setString(1, username);
                            userRs = userPst.executeQuery();

                            int userId = -1;
                            if (userRs.next()) {
                                userId = userRs.getInt("user_id");
                            }

                            if (userId != -1) {
                                String expenseQuery = "SELECT * FROM expenses WHERE user_id = ? AND category = ? AND date BETWEEN ? AND ?";
                                expensePst = con.prepareStatement(expenseQuery);
                                expensePst.setInt(1, userId);
                                expensePst.setString(2, category);
                                expensePst.setString(3, startDate);
                                expensePst.setString(4, endDate);

                                expenseRs = expensePst.executeQuery();

                                boolean hasRecords = false;
                                while (expenseRs.next()) {
                                    hasRecords = true;
                %>
                <tr>
                    <td><%= expenseRs.getInt("expense_id") %></td>
                    <td><%= expenseRs.getString("category") %></td>
                    <td><%= expenseRs.getDouble("amount") %></td>
                    <td><%= expenseRs.getDate("date") %></td>
                    <td><%= expenseRs.getString("description") %></td>
                </tr>
                <%
                                }

                                if (!hasRecords) {
                %>
                <tr>
                    <td colspan="5">No expenses found for the selected filters!</td>
                </tr>
                <%
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (userRs != null) userRs.close();
                                if (expenseRs != null) expenseRs.close();
                                if (userPst != null) userPst.close();
                                if (expensePst != null) expensePst.close();
                                if (con != null) con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    } else if (username == null) {
                %>
                <tr>
                    <td colspan="5">Please log in to view your expenses.</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
     <!-- Footer Section -->
  <footer class="footer">
    <p>&copy; 2024 Expense Management System</p>
    <div class="social-icons">
      <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
      <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
      <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
    </div>
  </footer>

  <!-- JavaScript -->
  <script>
    // Toggle Sidebar
    function toggleSidebar() {
      document.querySelector('.sidebar').classList.toggle('open');
      document.querySelector('.overlay').classList.toggle('show');
    }
  </script>
</body>
</html>
