<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Set Monthly Budget - Expense Manager</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Expense Manager</a>
    </div>
  </nav>

  <div class="container mt-5 pt-5">
    <div class="text-center mb-4">
      <h2>Set Your Monthly Budget</h2>
      <p>Specify your budget for the month to manage your expenses.</p>
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

    <!-- Display success or error message if set in the request -->
    <%
      String message = (String) request.getAttribute("message");
      if (message != null) {
    %>
      <div class="alert <%= (String) request.getAttribute("alertType") %> mt-3">
        <%= message %>
      </div>
    <% } %>
  </div>

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
