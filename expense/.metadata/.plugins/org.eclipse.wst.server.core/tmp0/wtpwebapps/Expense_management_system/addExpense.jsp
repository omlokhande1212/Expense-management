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
    .footer {
      background-color: #333;
      color: #fff;
      padding: 20px 0;
    }
    .footer .social-icons a {
      color: #fff;
      margin: 0 10px;
    }
    .footer .social-icons a:hover {
      color: #4caf50;
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

  <!-- Add Expense Form Container -->
  <div class="container">
    <div class="card p-4">
      <h3 class="text-center mb-4">Add New Expense</h3>
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

  <!-- Footer -->
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

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
