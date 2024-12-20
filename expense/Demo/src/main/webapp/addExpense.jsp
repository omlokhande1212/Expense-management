<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Expense - Expense Manager</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    /* Custom styling for the form */
    body {
      background-color: #f7f7f9;
      color: #333;
    }
    .container {
      max-width: 600px;
      padding-top: 30px;
    }
    .card {
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    .form-label {
      font-weight: bold;
      color: #555;
    }
    .btn-primary {
      background-color: #4caf50;
      border: none;
    }
    .btn-primary:hover {
      background-color: #45a049;
    }
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

    /* Main content wrapper with sidebar margin */
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

    /* Responsive Layout */
    .card {
      width: 100%;
      margin-bottom: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
  </style>
  <script>
    function validateForm() {
      // Check that the amount is positive
      const amount = document.getElementById("amount").value;
      if (amount <= 0) {
        alert("Please enter a positive amount.");
        return false;
      }
      // Check that a valid date is selected
      const date = document.getElementById("date").value;
      if (!date) {
        alert("Please select a date.");
        return false;
      }
      return true;
    }
  </script>
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
       <a href="finincialtips.html"><i class="fas fa-lightbulb"></i> Financial Tips</a>
    <a href="report.jsp"><i class="fas fa-tag"></i> View Expenses by Category</a>
  </aside>

  <!-- Add Expense Form Container -->
  <div class="container">
    <div class="card p-4">
      <h3 class="text-center mb-4">Add New Expense</h3>
      
      <!-- Show success or error messages -->
      <% 
        String errorMessage = (String) request.getAttribute("errorMessage");
        String successMessage = (String) request.getAttribute("successMessage");
        if (errorMessage != null) { 
      %>
        <div class="alert alert-danger">
          <%= errorMessage %>
        </div>
      <% 
        }
        if (successMessage != null) {
      %>
        <div class="alert alert-success">
          <%= successMessage %>
        </div>
      <% 
        }
      %>

      <!-- Expense Form -->
      <form action="AddExpenseServlet" method="POST" onsubmit="return validateForm()">
        
        <!-- Expense Amount -->
        <div class="mb-3">
          <label for="amount" class="form-label">Amount</label>
          <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter amount" required>
        </div>
        
        <!-- Expense Date -->
        <div class="mb-3">
          <label for="date" class="form-label">Date</label>
          <input type="date" class="form-control" id="date" name="date" required>
        </div>
        
        <!-- Expense Category -->
        <div class="mb-3">
          <label for="category" class="form-label">Category</label>
          <select class="form-select" id="category" name="category" required>
            <option value="Food">Food</option>
            <option value="Transportation">Transportation</option>
            <option value="Utilities">Utilities</option>
            <option value="Entertainment">Entertainment</option>
            <option value="Shopping">Shopping</option>
            <option value="Healthcare">Healthcare</option>
            <option value="Other">Other</option>
          </select>
        </div>
        
        <!-- Expense Description -->
        <div class="mb-3">
          <label for="description" class="form-label">Description (Optional)</label>
          <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter a brief description"></textarea>
        </div>
        
        <!-- Submit and Reset Buttons -->
        <div class="d-flex justify-content-between">
          <button type="submit" class="btn btn-primary w-45">Submit</button>
          <button type="reset" class="btn btn-secondary w-45">Reset</button>
        </div>
      </form>
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

  <!-- Bootstrap JS, Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

  <script>
    // Toggle Sidebar and overlay
    function toggleSidebar() {
      document.querySelector('.sidebar').classList.toggle('open');
      document.querySelector('.overlay').classList.toggle('show');
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
