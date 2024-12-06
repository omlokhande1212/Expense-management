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
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: url('back.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            color: #fff;
        }
        .profile-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-card {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            padding: 30px;
            backdrop-filter: blur(10px);
        }
        .card-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: black; 
        }
        .profile-info {
            text-align: left;
        }
        .profile-info p {
            font-size: 1.2rem;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            transition: transform 0.2s, color 0.2s; /* Smooth hover effect */
        }
        .profile-info p:hover {
            transform: scale(1.05);
            color: #00ff00; /* Bright green on hover */
        }
        .profile-info p i {
            margin-right: 10px;
            color: #007bff; /* Blue for icons */
        }
        .profile-info .field-name {
            color: #ff4500; /* Orange for field names */
            font-weight: bold;
            margin-right: 5px;
        }
        .profile-info .field-value {
            color: #00ced1; /* Turquoise for field values */
        }
        .btn {
            margin-top: 10px;
            font-weight: bold;
        }
        .logout-btn {
            background-color: #ff4d4d;
            border: none;
        }
        .logout-btn:hover {
            background-color: #e60000;
        }
        .dashboard-btn {
            background-color: #007bff;
            border: none;
        }
        .dashboard-btn:hover {
            background-color: #0056b3;
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
                                    <p><i class="fas fa-user"></i><span class="field-name">Username          :</span> <span class="field-value"><%= username %></span></p>
                                    <p><i class="fas fa-envelope"></i><span class="field-name">Email         :</span> <span class="field-value"><%= email %></span></p>
                                    <p><i class="fas fa-calendar-alt"></i><span class="field-name">Birthdate :</span> <span class="field-value"><%= birthdate %></span></p>
                                    <p><i class="fas fa-venus-mars"></i><span class="field-name">Gender      :</span> <span class="field-value"><%= gender %></span></p>
                                    <p><i class="fas fa-user-tag"></i><span class="field-name">Role          :</span> <span class="field-value"><%= role %></span></p>
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
