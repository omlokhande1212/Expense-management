<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Budget Report</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Your Budget Report</h1>
    <table class="table">
        <tr>
            <td>Monthly Budget</td>
            <td>₹<%= request.getAttribute("monthlyBudget") %></td>
        </tr>
        <tr>
            <td>Total Expenses</td>
            <td>₹<%= request.getAttribute("totalExpenses") %></td>
        </tr>
        <tr>
            <td>Remaining Budget</td>
            <td>₹<%= request.getAttribute("remainingBudget") %></td>
        </tr>
    </table>

    <% 
       Double remainingBudget = (Double) request.getAttribute("remainingBudget");
    %>
    <% if (remainingBudget != null && remainingBudget >= 0) { %>
        <div class="alert alert-success">
            You have a remaining budget of ₹<%= remainingBudget %>.
        </div>
    <% } else { %>
        <div class="alert alert-danger">
            Your budget is over by ₹<%= Math.abs(remainingBudget != null ? remainingBudget : 0.0) %>.
        </div>
    <% } %>
</body>
</html>
