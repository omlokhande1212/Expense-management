<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Expense</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f4f4f4;
            flex-direction: column;
            height: 100vh; 
        }
        header {
            background: #4CAF50; 
            color: white;
            padding: 20px;
            text-align: center;
            height: 10%; 
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .user-actions {
            position: relative; 
              }
        .icon-button {
            background: white;
            color: #4CAF50;
            border: none;
            padding: 10px;
            border-radius: 50%; 
            cursor: pointer;
            transition: background 0.3s;
            font-size: 24px; 
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .icon-button:hover {
            background: #ddd; 
        }
           .dropdown {
            display: none;
            position: absolute;
            right: 0;
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            z-index: 1;
            animation: fadeIn 0.5s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .dropdown a {
            display: block;
            color: #4CAF50;
            padding: 10px;
            text-decoration: none;
            transition: background 0.3s;
        }
        .dropdown a:hover {
            background: #f1f1f1; 
        }
        .content {
            display: flex;
            flex: 1; 
        }
        .sidebar {
            width: 250px;
            background-color: #4CAF50; 
            color: white;
            padding: 15px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }
        .sidebar h2 {
            text-align: center;
            margin-top: 0;
        }
        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background: #45a049;
        }.container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        input[type="date"], input[type="submit"] {
            padding: 10px;
            margin: 0 10px;
            font-size: 16px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
      
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin: 20px 0;
            }
        }
    </style>
</head>
<body>
    <header>
        <center><h1>Welcome, ${sessionScope.uname}...!!!</h1></center>
        <div class="user-actions">
            <button class="icon-button" onclick="toggleDropdown()">
                <i class="fas fa-user-circle"></i>
            </button>
            <div class="dropdown" id="userDropdown">
                <a href="login.jsp">Login</a>
                <a href="logout.jsp">Logout</a>
                <a href="addAccount.jsp">Add Account</a>
                <a href="profile.jsp">Profile</a>
            </div>
        </div>
    </header>

    <div class="content">
        <div class="sidebar">
            <h2>Expenses Menu</h2>
            <a href="addexpense.jsp">Add New Expense</a>
            <a href="view_expense.jsp">View All Expenses</a>
            <a href="reports.jsp">View Reports</a>
            <a href="manage_categories.jsp">Manage Categories</a>
        </div>
        <div class="container">
            <h1>View Expenses by Date</h1>
            <form method="get" action="view_expense.jsp">
                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="startDate" required>
                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="endDate" required>
                <input type="submit" value="Filter Expenses">
            </form>

            <%
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                if (startDate != null && endDate != null) {
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_management", "root", "Root@123");

                        String query = "SELECT * FROM add_expense WHERE date BETWEEN ? AND ?";
                        pst = con.prepareStatement(query);
                        pst.setDate(1, java.sql.Date.valueOf(startDate));
                        pst.setDate(2, java.sql.Date.valueOf(endDate));

                        rs = pst.executeQuery();
                        if (!rs.isBeforeFirst()) {
                            out.println("<h3>No records found for the selected dates.</h3>");
                        } else {
                            out.println("<table>");
                            out.println("<thead><tr><th>ID</th><th>Description</th><th>Amount</th><th>Date</th><th>Category</th></tr></thead>");
                            out.println("<tbody>");
                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getInt("id") + "</td>");
                                out.println("<td>" + rs.getString("description") + "</td>");
                                out.println("<td>" + rs.getDouble("amount") + "</td>");
                                out.println("<td>" + rs.getDate("date") + "</td>");
                                out.println("<td>" + rs.getString("category") + "</td>");
                                out.println("</tr>");
                            }
                            out.println("</tbody>");
                            out.println("</table>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<h3>Error occurred while fetching data. Please try again later.</h3>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pst != null) pst.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </div>
    </div>

    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById('userDropdown');
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        }

        window.onclick = function(event) {
            if (!event.target.matches('.icon-button')) {
                const dropdowns = document.getElementsByClassName("dropdown");
                for (let i = 0; i < dropdowns.length; i++) {
                    const openDropdown = dropdowns[i];
                    if (openDropdown.style.display === 'block') {
                        openDropdown.style.display = 'none';
                    }
                }
            }
        }
    </script>
</body>
</html>
