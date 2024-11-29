<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .profile-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-card {
            width: 100%;
            max-width: 450px;
            background-color: #fff;
            border: none;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .profile-info p {
            font-size: 1rem;
            margin-bottom: 10px;
        }
        .logout-btn, .dashboard-btn {
            width: 100%;
            font-size: 1rem;
            margin-top: 10px;
        }
        .profile-card img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container profile-container">
        <% 
            String username = (String) session.getAttribute("username");

            if (username == null) {
                out.println("<p class='text-center'>You are not logged in.</p>");
            } else {
                String url = "jdbc:mysql://localhost:3306/expensemanagementsystem";
                String dbUsername = "root";
                String dbPassword = "Root@123";
                
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                    String query = "SELECT * FROM users WHERE username = ?";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, username);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        String email = rs.getString("email");
                        String birthdate = rs.getString("birthdate");
                        String gender = rs.getString("gender");
                        String role = rs.getString("role");
        %>
                        <div class="card profile-card text-center">
                           
                            <div class="card-body">
                                <h5 class="card-title">Hello, <%= username %>!</h5>
                                <div class="profile-info">
                                    <p><strong>Username:</strong> <%= username %></p>
                                    <p><strong>Email:</strong> <%= email %></p>
                                    <p><strong>Birthdate:</strong> <%= birthdate %></p>
                                    <p><strong>Gender:</strong> <%= gender %></p>
                                    <p><strong>Role:</strong> <%= role %></p>
                                </div>
                                <a href="userdashboard.html" class="btn btn-primary dashboard-btn">Back to Dashboard</a>
                                <a href="logout.html" class="btn btn-danger logout-btn">Logout</a>
                            </div>
                        </div>
        <%
                    } else {
                        out.println("<p class='text-center'>User not found.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p class='text-center'>Error occurred while fetching profile information.</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
