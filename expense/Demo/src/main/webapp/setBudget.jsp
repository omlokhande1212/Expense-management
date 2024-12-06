<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Set Monthly Budget - Expense Manager</title>
  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- FontAwesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <!-- SweetAlert2 for alerts -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <!-- Custom CSS for consistent styling -->
  <style>
    /* General Styles */
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
      margin: 0;
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

    /* Main Content Wrapper */
    .content-wrapper {
      margin-left: 250px;
      padding: 30px;
      transition: all 0.3s;
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

      .content-wrapper {
        margin-left: 0;
        padding: 20px;
      }

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

    /* Main Content Section */
    .main-content {
      padding: 20px;
      background-color: #ffffff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    @media (max-width: 768px) {
      .main-content {
        padding: 15px;
      }
    }

    @media (max-width: 576px) {
      .main-content {
        padding: 10px;
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

  <!-- Header Section -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Expense Manager</a>
      <span class="navbar-toggler sidebar-toggle" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
      </span>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="#">Welcome</a></li>
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
    <a href="report.jsp"><i class="fas fa-tag"></i> View Expenses by Category</a>
     <a href="finincialtips.html"><i class="fas fa-lightbulb"></i> Financial Tips</a>
 
  </aside>

  <!-- Main Content -->
  <div class="content-wrapper">
    <div class="main-content">
      <div class="text-center mb-4">
        <h2>Set Your Monthly Budget</h2>
        <p>Specify your budget for the month to manage your expenses.</p>
      </div>

<!-- Display the current budget in the center -->
<div class="text-center mt-4">
    <h3>
        <% 
            Double monthlyBudget = (Double) session.getAttribute("monthlyBudget");
            if (monthlyBudget != null) { 
                out.print("Your Current Budget: $" + monthlyBudget);
            } else { 
                out.print("No budget set for this month."); 
            }
        %>
    </h3>
</div>


      <!-- Monthly Budget Form -->
      <div class="card p-4 shadow-sm">
        <form action="BudgetServlet" method="POST">
          <div class="mb-3">
            <label for="monthlyBudget" class="form-label">Monthly Budget</label>
            <input type="number" class="form-control" name="monthlyBudget" placeholder="Enter your monthly budget" required>
          </div>
          <button type="submit" class="btn btn-primary w-100">Set Monthly Budget</button>
        </form>
      </div>
     <center><div class="col-md-6 col-lg-4 mb-4">
          <div class="card">
            <div class="card-body">
      
            <center></center> <a href="budgetReport.jsp" class="btn btn-primary">Budget Information</a></center>
            </div>
          </div>
        </div>
      </div></center>
      <!-- Display success or error message -->
      <%
        String message = (String) request.getAttribute("message");
        String alertType = (String) request.getAttribute("alertType");
        if (message != null && alertType != null) {
      %>
        <script>
          Swal.fire({
            icon: '<%= alertType %>',
            title: '<%= alertType.equals("success") ? "Success" : "Error" %>',
            text: '<%= message %>'
          });
        </script>
      <% } %>
    </div>
  </div>

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

  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    function toggleSidebar() {
      document.querySelector('.sidebar').classList.toggle('open');
      document.querySelector('.overlay').classList.toggle('show');
    }
  </script>

</body>
</html>
