<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Custom CSS -->
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            font-family: Arial, sans-serif;
        }
        .login-container {
            max-width: 500px;
            width: 100%;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .login-container h3 {
            color: #007bff;
            font-weight: bold;
            font-size: 1.8rem;
            margin-bottom: 1rem;
            text-align: center;
        }
        .login-btn {
            width: 100%;
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .form-footer {
            text-align: center;
            margin-top: 15px;
        }
        .form-footer a {
            color: #007bff;
            font-weight: bold;
            text-decoration: none;
        }
        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h3>Login</h3>
    <form action="loginServlet" method="POST">
        <div class="form-group position-relative">
            <i class="fas fa-envelope position-absolute" style="left: 15px; top: 50%; transform: translateY(-50%); color: #007bff;"></i>
            <input type="email" class="form-control pl-5" name="email" placeholder="Enter your email" required>
        </div>
        <div class="form-group position-relative">
            <i class="fas fa-lock position-absolute" style="left: 15px; top: 50%; transform: translateY(-50%); color: #007bff;"></i>
            <input type="password" class="form-control pl-5" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="btn login-btn">Login</button>
    </form>
    <div class="form-footer">
        <p>Don't have an account? <a href="register.jsp">Register here</a>.</p>
    </div>
</div>

<!-- SweetAlert Script for Login Notification -->
<% String status = (String) request.getAttribute("status"); %>
<script>
    <% if ("success".equals(status)) { %>
        Swal.fire({
            icon: 'success',
            title: 'Login Successful',
            text: 'Welcome to your dashboard!',
            showConfirmButton: false,
            timer: 2000
        }).then(() => {
            window.location.href = "userdashboard.jsp";
        });
    <% } else if ("failed".equals(status)) { %>
        Swal.fire({
            icon: 'error',
            title: 'Login Failed',
            text: 'Wrong username or password. Please try again.',
            confirmButtonText: 'OK'
        });
    <% } %>
</script>

</body>
</html>
