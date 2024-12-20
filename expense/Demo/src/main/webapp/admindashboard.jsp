<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f1f1f1;
            color: #333;
            margin: 0;
            padding: 0;
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
        .hero-section {
            background: linear-gradient(135deg, #3a6073, #16222A);
            color: white;
            padding: 80px 0;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .hero-section h1 {
            font-size: 3rem;
            font-weight: bold;
            letter-spacing: 2px;
        }
        .dashboard-container {
            margin-top: 40px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card-header {
            background-color: #2980b9;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            border-radius: 15px 15px 0 0;
        }
        .btn-dashboard {
            width: 100%;
            padding: 10px;
            font-size: 1.1rem;
            background-color: #3498db;
            border: none;
            color: white;
            transition: background-color 0.3s ease;
            border-radius: 5px;
        }
        .btn-dashboard:hover {
            background-color: #2980b9;
        }
        .card-body p {
            font-size: 1.2rem;
        }
        .row .col-md-4 {
            margin-bottom: 30px;
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

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1>Welcome to the Admin Dashboard</h1>
            <p>Manage your system with ease. Monitor users, expenses, and generate reports.</p>
        </div>
    </div>

    <!-- Dashboard Content -->
    <div class="container dashboard-container">
        <h2 class="text-center mb-4">Admin Dashboard</h2>
        <div class="row">
            <!-- Manage Users Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        Manage Users
                    </div>
                    <div class="card-body">
                        <p>View, update, or delete users from the system.</p>
                        <a href="manageUsers.jsp" class="btn-dashboard">Manage Users</a>
                    </div>
                </div>
            </div>

            <!-- View Expenses Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        View Expenses
                    </div>
                    <div class="card-body">
                        <p>View detailed expense records from all users.</p>
                        <a href="adminExpense.jsp" class="btn-dashboard">View Expenses</a>
                    </div>
                </div>
            </div>

            <!-- Reports Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        Generate Reports
                    </div>
                    <div class="card-body">
                        <p>Generate detailed reports based on user data and expenses.</p>
                        <a href="adminReports.jsp" class="btn-dashboard">Generate Reports</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
          
   

            <!-- Logout Card -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Logout
                    </div>
                    <div class="card-body">
                        <p>Logout from the admin dashboard.</p>
                        <a href="Index.html" class="btn-dashboard">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
  
  <footer class="footer mt-5">
    <div class="container text-center">
              <p>&copy; <script>document.write(new Date().getFullYear())</script> ExpenseManager. All Rights Reserved.</p>
      
      <div class="social-icons">
        <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
        <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
        <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
      </div>
    </div>
  </footer>

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
